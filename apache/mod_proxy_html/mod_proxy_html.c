/********************************************************************
         Copyright (c) 2003-5, WebThing Ltd
         Author: Nick Kew <nick@webthing.com>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
     
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
      
*********************************************************************/


/********************************************************************
        Note to Users
 
        You are requested to register as a user, at
        http://apache.webthing.com/registration.html
 
        This entitles you to support from the developer.
        I'm unlikely to reply to help/support requests from
        non-registered users, unless you're paying and/or offering
        constructive feedback such as bug reports or sensible
        suggestions for further development.
 
        It also makes a small contribution to the effort
        that's gone into developing this work.
*********************************************************************/

/* End of Notices */


/*      GO_FASTER

        You can #define GO_FASTER to disable informational logging.
        This disables the ProxyHTMLLogVerbose option altogether.

        Default is to leave it undefined, and enable verbose logging
        as a configuration option.  Binaries are supplied with verbose
        logging enabled.
*/

#ifdef GO_FASTER
#define VERBOSE(x)
#else
#define VERBOSE(x) if ( verbose ) x
#endif

#define VERSION_STRING "proxy_html/2.5"

#include <ctype.h>

/* libxml */
#include <libxml/HTMLparser.h>

#ifndef APR_PATH_MAX
#define APR_PATH_MAX 4096
#endif // APR_PATH_MAX

/* apache */
#include <http_protocol.h>
#include <http_config.h>
#include <http_log.h>
#include <apr_strings.h>

/* To support Apache 2.1/2.2, we need the ap_ forms of the
 * regexp stuff, and they're now used in the code.
 * To support 2.0 in the same compile, * we #define the
 * AP_ versions if necessary.
 */
#ifndef AP_REG_ICASE
/* it's 2.0, so we #define the ap_ versions */
#define ap_regex_t regex_t
#define ap_regmatch_t regmatch_t
#define AP_REG_EXTENDED REG_EXTENDED
#define AP_REG_ICASE REG_ICASE
#define AP_REG_NOSUB REG_NOSUB
#define AP_REG_NEWLINE REG_NEWLINE
#endif

module AP_MODULE_DECLARE_DATA proxy_html_module ;

#define M_HTML          0x01
#define M_EVENTS        0x02
#define M_CDATA         0x04
#define M_REGEX         0x08
#define M_ATSTART       0x10
#define M_ATEND         0x20
#define M_LAST          0x40

typedef struct {
  unsigned int start ;
  unsigned int end ;
} meta ;
typedef struct urlmap {
  struct urlmap* next ;
  unsigned int flags ;
  union {
    const char* c ;
    ap_regex_t* r ;
  } from ;
  const char* to ;
} urlmap ;
typedef struct {
  urlmap* map ;
  const char* doctype ;
  const char* etag ;
  unsigned int flags ;
  int extfix ;
  int metafix ;
  int strip_comments ;
#ifndef GO_FASTER
  int verbose ;
#endif
  size_t bufsz ;
} proxy_html_conf ;
typedef struct {
  htmlSAXHandlerPtr sax ;
  ap_filter_t* f ;
  proxy_html_conf* cfg ;
  htmlParserCtxtPtr parser ;
  apr_bucket_brigade* bb ;
  char* buf ;
  size_t offset ;
  size_t avail ;
} saxctxt ;

static int is_empty_elt(const char* name) {
  const char** p ;
  static const char* empty_elts[] = {
    "br" ,
    "link" ,
    "img" ,
    "hr" ,
    "input" ,
    "meta" ,
    "base" ,
    "area" ,
    "param" ,
    "col" ,
    "frame" ,
    "isindex" ,
    "basefont" ,
    NULL
  } ;
  for ( p = empty_elts ; *p ; ++p )
    if ( !strcmp( *p, name) )
      return 1 ;
  return 0 ;
}

typedef struct {
        const char* name ;
        const char** attrs ;
} elt_t ;

#define NORM_LC 0x1
#define NORM_MSSLASH 0x2
#define NORM_RESET 0x4

typedef enum { ATTR_IGNORE, ATTR_URI, ATTR_EVENT } rewrite_t ;

static void normalise(unsigned int flags, char* str) {
  xmlChar* p ;
  if ( flags & NORM_LC )
    for ( p = str ; *p ; ++p )
      if ( isupper(*p) )
        *p = tolower(*p) ;

  if ( flags & NORM_MSSLASH )
    for ( p = strchr(str, '\\') ; p ; p = strchr(p+1, '\\') )
      *p = '/' ;

}

#define FLUSH ap_fwrite(ctx->f->next, ctx->bb, (chars+begin), (i-begin)) ; begin = i+1
static void pcharacters(void* ctxt, const xmlChar *chars, int length) {
  saxctxt* ctx = (saxctxt*) ctxt ;
  int i ;
  int begin ;
  for ( begin=i=0; i<length; i++ ) {
    switch (chars[i]) {
      case '&' : FLUSH ; ap_fputs(ctx->f->next, ctx->bb, "&amp;") ; break ;
      case '<' : FLUSH ; ap_fputs(ctx->f->next, ctx->bb, "&lt;") ; break ;
      case '>' : FLUSH ; ap_fputs(ctx->f->next, ctx->bb, "&gt;") ; break ;
      case '"' : FLUSH ; ap_fputs(ctx->f->next, ctx->bb, "&quot;") ; break ;
      default : break ;
    }
  }
  FLUSH ;
}
static void preserve(saxctxt* ctx, const size_t len) {
  char* newbuf ;
  if ( len <= ( ctx->avail - ctx->offset ) )
    return ;
  else while ( len > ( ctx->avail - ctx->offset ) )
    ctx->avail += ctx->cfg->bufsz ;

  newbuf = realloc(ctx->buf, ctx->avail) ;
  if ( newbuf != ctx->buf ) {
    if ( ctx->buf )
        apr_pool_cleanup_kill(ctx->f->r->pool, ctx->buf, (void*)free) ;
    apr_pool_cleanup_register(ctx->f->r->pool, newbuf,
        (void*)free, apr_pool_cleanup_null);
    ctx->buf = newbuf ;
  }
}
static void pappend(saxctxt* ctx, const char* buf, const size_t len) {
  preserve(ctx, len) ;
  memcpy(ctx->buf+ctx->offset, buf, len) ;
  ctx->offset += len ;
}
static void dump_content(saxctxt* ctx) {
  urlmap* m ;
  char* found ;
  size_t s_from, s_to ;
  size_t match ;
  char c = 0 ;
  int nmatch ;
  ap_regmatch_t pmatch[10] ;
  char* subs ;
  size_t len, offs ;
#ifndef GO_FASTER
  int verbose = ctx->cfg->verbose ;
#endif

  pappend(ctx, &c, 1) ; /* append null byte */
        /* parse the text for URLs */
  for ( m = ctx->cfg->map ; m ; m = m->next ) {
    if ( ! ( m->flags & M_CDATA ) )
        continue ;
    if ( m->flags & M_REGEX ) {
      nmatch = 10 ;
      offs = 0 ;
      while ( ! ap_regexec(m->from.r, ctx->buf+offs, nmatch, pmatch, 0) ) {
        match = pmatch[0].rm_so ;
        s_from = pmatch[0].rm_eo - match ;
        subs = ap_pregsub(ctx->f->r->pool, m->to, ctx->buf+offs,
                nmatch, pmatch) ;
        s_to = strlen(subs) ;
        len = strlen(ctx->buf) ;
        offs += match ;
        VERBOSE( {
          const char* f = apr_pstrndup(ctx->f->r->pool,
                ctx->buf + offs , s_from ) ;
          ap_log_rerror(APLOG_MARK, APLOG_INFO, 0, ctx->f->r,
                "C/RX: match at %s, substituting %s", f, subs) ;
        } )
        if ( s_to > s_from) {
          preserve(ctx, s_to - s_from) ;
          memmove(ctx->buf+offs+s_to, ctx->buf+offs+s_from,
                len + 1 - s_from - offs) ;
          memcpy(ctx->buf+offs, subs, s_to) ;
        } else {
          memcpy(ctx->buf + offs, subs, s_to) ;
          memmove(ctx->buf+offs+s_to, ctx->buf+offs+s_from,
                len + 1 - s_from - offs) ;
        }
        offs += s_to ;
      }
    } else {
      s_from = strlen(m->from.c) ;
      s_to = strlen(m->to) ;
      for ( found = strstr(ctx->buf, m->from.c) ; found ;
                found = strstr(ctx->buf+match+s_to, m->from.c) ) {
        match = found - ctx->buf ;
        if ( ( m->flags & M_ATSTART ) && ( match != 0) )
          break ;
        len = strlen(ctx->buf) ;
        if ( ( m->flags & M_ATEND ) && ( match < (len - s_from) ) )
          continue ;
        VERBOSE( ap_log_rerror(APLOG_MARK, APLOG_INFO, 0, ctx->f->r,
            "C: matched %s, substituting %s", m->from.c, m->to) ) ;
        if ( s_to > s_from ) {
          preserve(ctx, s_to - s_from) ;
          memmove(ctx->buf+match+s_to, ctx->buf+match+s_from,
                len + 1 - s_from - match) ;
          memcpy(ctx->buf+match, m->to, s_to) ;
        } else {
          memcpy(ctx->buf+match, m->to, s_to) ;
          memmove(ctx->buf+match+s_to, ctx->buf+match+s_from,
                len + 1 - s_from - match) ;
        }
      }
    }
  }
  ap_fputs(ctx->f->next, ctx->bb, ctx->buf) ;
}
static void pcdata(void* ctxt, const xmlChar *chars, int length) {
  saxctxt* ctx = (saxctxt*) ctxt ;
  if ( ctx->cfg->extfix ) {
    pappend(ctx, chars, length) ;
  } else {
    ap_fwrite(ctx->f->next, ctx->bb, chars, length) ;
  }
}
static void pcomment(void* ctxt, const xmlChar *chars) {
  saxctxt* ctx = (saxctxt*) ctxt ;
  if ( ctx->cfg->strip_comments )
    return ;

  if ( ctx->cfg->extfix ) {
    pappend(ctx, "<!--", 4) ;
    pappend(ctx, chars, strlen(chars) ) ;
    pappend(ctx, "-->", 3) ;
  } else {
    ap_fputstrs(ctx->f->next, ctx->bb, "<!--", chars, "-->", NULL) ;
  }
}
static void pendElement(void* ctxt, const xmlChar* name) {
  saxctxt* ctx = (saxctxt*) ctxt ;
  if ( ctx->offset > 0 ) {
    dump_content(ctx) ;
    ctx->offset = 0 ;   /* having dumped it, we can re-use the memory */
  }
  if ( ! is_empty_elt(name) )
    ap_fprintf(ctx->f->next, ctx->bb, "</%s>", name) ;
}
static void pstartElement(void* ctxt, const xmlChar* name,
                const xmlChar** attrs ) {

  int num_match ;
  size_t offs, len ;
  char* subs ;
  rewrite_t is_uri ;
  const char** linkattrs ;
  const xmlChar** a ;
  const elt_t* elt ;
  const char** linkattr ;
  urlmap* m ;
  size_t s_to, s_from, match ;
  char* found ;
  saxctxt* ctx = (saxctxt*) ctxt ;
  size_t nmatch ;
  ap_regmatch_t pmatch[10] ;
#ifndef GO_FASTER
  int verbose = ctx->cfg->verbose ;
#endif

  static const char* href[] = { "href", NULL } ;
  static const char* cite[] = { "cite", NULL } ;
  static const char* action[] = { "action", NULL } ;
  static const char* imgattr[] = { "src", "longdesc", "usemap", NULL } ;
  static const char* inputattr[] = { "src", "usemap", NULL } ;
  static const char* scriptattr[] = { "src", "for", NULL } ;
  static const char* frameattr[] = { "src", "longdesc", NULL } ;
  static const char* objattr[] =
                       { "classid", "codebase", "data", "usemap", NULL } ;
  static const char* profile[] = { "profile", NULL } ;
  static const char* background[] = { "background", NULL } ;
  static const char* codebase[] = { "codebase", NULL } ;

  static const elt_t linked_elts[] = {
    { "a" , href } ,
    { "img" , imgattr } ,
    { "form", action } ,
    { "link" , href } ,
    { "script" , scriptattr } ,
    { "base" , href } ,
    { "area" , href } ,
    { "input" , inputattr } ,
    { "frame", frameattr } ,
    { "iframe", frameattr } ,
    { "object", objattr } ,
    { "q" , cite } ,
    { "blockquote" , cite } ,
    { "ins" , cite } ,
    { "del" , cite } ,
    { "head" , profile } ,
    { "body" , background } ,
    { "applet", codebase } ,
    { NULL, NULL }
  } ;
  static const char* events[] = {
        "onclick" ,
        "ondblclick" ,
        "onmousedown" ,
        "onmouseup" ,
        "onmouseover" ,
        "onmousemove" ,
        "onmouseout" ,
        "onkeypress" ,
        "onkeydown" ,
        "onkeyup" ,
        "onfocus" ,
        "onblur" ,
        "onload" ,
        "onunload" ,
        "onsubmit" ,
        "onreset" ,
        "onselect" ,
        "onchange" ,
        NULL
  } ;

  ap_fputc(ctx->f->next, ctx->bb, '<') ;
  ap_fputs(ctx->f->next, ctx->bb, name) ;

  if ( attrs ) {
    linkattrs = 0 ;
    for ( elt = linked_elts;  elt->name != NULL ; ++elt )
      if ( !strcmp(elt->name, name) ) {
        linkattrs = elt->attrs ;
        break ;
      }
    for ( a = attrs ; *a ; a += 2 ) {
      ctx->offset = 0 ;
      if ( a[1] ) {
        pappend(ctx, a[1], strlen(a[1])+1) ;
        is_uri = ATTR_IGNORE ;
        if ( linkattrs ) {
          for ( linkattr = linkattrs ; *linkattr ; ++linkattr) {
            if ( !strcmp(*linkattr, *a) ) {
              is_uri = ATTR_URI ;
              break ;
            }
          }
        }
        if ( (is_uri == ATTR_IGNORE) && ctx->cfg->extfix ) {
          for ( linkattr = events; *linkattr; ++linkattr ) {
            if ( !strcmp(*linkattr, *a) ) {
              is_uri = ATTR_EVENT ;
              break ;
            }
          }
        }
        switch ( is_uri ) {
          case ATTR_URI:
            num_match = 0 ;
            for ( m = ctx->cfg->map ; m ; m = m->next ) {
              if ( ! ( m->flags & M_HTML ) )
                continue ;
              if ( m->flags & M_REGEX ) {
                nmatch = 10 ;
                if ( ! ap_regexec(m->from.r, ctx->buf, nmatch, pmatch, 0) ) {
                  ++num_match ;
                  offs = match = pmatch[0].rm_so ;
                  s_from = pmatch[0].rm_eo - match ;
                  subs = ap_pregsub(ctx->f->r->pool, m->to, ctx->buf+offs,
                        nmatch, pmatch) ;
                  VERBOSE( {
                    const char* f = apr_pstrndup(ctx->f->r->pool,
                        ctx->buf + offs , s_from ) ;
                    ap_log_rerror(APLOG_MARK, APLOG_INFO, 0, ctx->f->r,
                        "H/RX: match at %s, substituting %s", f, subs) ;
                  } )
                  s_to = strlen(subs) ;
                  len = strlen(ctx->buf) ;
                  if ( s_to > s_from) {
                    preserve(ctx, s_to - s_from) ;
                    memmove(ctx->buf+offs+s_to, ctx->buf+offs+s_from,
                        len + 1 - s_from - offs) ;
                    memcpy(ctx->buf+offs, subs, s_to) ;
                  } else {
                    memcpy(ctx->buf + offs, subs, s_to) ;
                    memmove(ctx->buf+offs+s_to, ctx->buf+offs+s_from,
                        len + 1 - s_from - offs) ;
                  }
                }
              } else {
                s_from = strlen(m->from.c) ;
                if ( ! strncasecmp(ctx->buf, m->from.c, s_from ) ) {
                  ++num_match ;
                  s_to = strlen(m->to) ;
                  len = strlen(ctx->buf) ;
                  VERBOSE( ap_log_rerror(APLOG_MARK, APLOG_INFO, 0, ctx->f->r,
                    "H: matched %s, substituting %s", m->from.c, m->to) ) ;
                  if ( s_to > s_from ) {
                    preserve(ctx, s_to - s_from) ;
                    memmove(ctx->buf+s_to, ctx->buf+s_from,
                        len + 1 - s_from ) ;
                    memcpy(ctx->buf, m->to, s_to) ;
                  } else {      /* it fits in the existing space */
                    memcpy(ctx->buf, m->to, s_to) ;
                    memmove(ctx->buf+s_to, ctx->buf+s_from,
                        len + 1 - s_from) ;
                  }
                  break ;
                }
              }
              if ( num_match > 0 )      /* URIs only want one match */
                break ;
            }
            break ;
          case ATTR_EVENT:
            for ( m = ctx->cfg->map ; m ; m = m->next ) {
              num_match = 0 ;   /* reset here since we're working per-rule */
              if ( ! ( m->flags & M_EVENTS ) )
                continue ;
              if ( m->flags & M_REGEX ) {
                nmatch = 10 ;
                offs = 0 ;
                while ( ! ap_regexec(m->from.r, ctx->buf+offs,
                        nmatch, pmatch, 0) ) {
                  match = pmatch[0].rm_so ;
                  s_from = pmatch[0].rm_eo - match ;
                  subs = ap_pregsub(ctx->f->r->pool, m->to, ctx->buf+offs,
                        nmatch, pmatch) ;
                  VERBOSE( {
                    const char* f = apr_pstrndup(ctx->f->r->pool,
                        ctx->buf + offs , s_from ) ;
                    ap_log_rerror(APLOG_MARK, APLOG_INFO, 0, ctx->f->r,
                        "E/RX: match at %s, substituting %s", f, subs) ;
                  } )
                  s_to = strlen(subs) ;
                  offs += match ;
                  len = strlen(ctx->buf) ;
                  if ( s_to > s_from) {
                    preserve(ctx, s_to - s_from) ;
                    memmove(ctx->buf+offs+s_to, ctx->buf+offs+s_from,
                        len + 1 - s_from - offs) ;
                    memcpy(ctx->buf+offs, subs, s_to) ;
                  } else {
                    memcpy(ctx->buf + offs, subs, s_to) ;
                    memmove(ctx->buf+offs+s_to, ctx->buf+offs+s_from,
                        len + 1 - s_from - offs) ;
                  }
                  offs += s_to ;
                  ++num_match ;
                }
              } else {
                found = strstr(ctx->buf, m->from.c) ;
                if ( (m->flags & M_ATSTART) && ( found != ctx->buf) )
                  continue ;
                while ( found ) {
                  s_from = strlen(m->from.c) ;
                  s_to = strlen(m->to) ;
                  match = found - ctx->buf ;
                  if ( ( s_from < strlen(found) ) && (m->flags & M_ATEND ) ) {
                    found = strstr(ctx->buf+match+s_from, m->from.c) ;
                    continue ;
                  } else {
                    found = strstr(ctx->buf+match+s_to, m->from.c) ;
                  }
                  VERBOSE( ap_log_rerror(APLOG_MARK, APLOG_INFO, 0, ctx->f->r,
                    "E: matched %s, substituting %s", m->from.c, m->to) ) ;
                  len = strlen(ctx->buf) ;
                  if ( s_to > s_from ) {
                    preserve(ctx, s_to - s_from) ;
                    memmove(ctx->buf+match+s_to, ctx->buf+match+s_from,
                        len + 1 - s_from - match) ;
                    memcpy(ctx->buf+match, m->to, s_to) ;
                  } else {
                    memcpy(ctx->buf+match, m->to, s_to) ;
                    memmove(ctx->buf+match+s_to, ctx->buf+match+s_from,
                        len + 1 - s_from - match) ;
                  }
                  ++num_match ;
                }
              }
              if ( num_match && ( m->flags & M_LAST ) )
                break ;
            }
            break ;
          case ATTR_IGNORE:
            break ;
        }
      }
      if ( ! a[1] )
        ap_fputstrs(ctx->f->next, ctx->bb, " ", a[0], NULL) ;
      else {

        if ( ctx->cfg->flags != 0 )
          normalise(ctx->cfg->flags, ctx->buf) ;

        /* write the attribute, using pcharacters to html-escape
           anything that needs it in the value.
        */
        ap_fputstrs(ctx->f->next, ctx->bb, " ", a[0], "=\"", NULL) ;
        pcharacters(ctx, ctx->buf, strlen(ctx->buf)) ;
        ap_fputc(ctx->f->next, ctx->bb, '"') ;
      }
    }
  }
  ctx->offset = 0 ;
  if ( is_empty_elt(name) )
    ap_fputs(ctx->f->next, ctx->bb, ctx->cfg->etag) ;
  else
    ap_fputc(ctx->f->next, ctx->bb, '>') ;
}
static htmlSAXHandlerPtr setupSAX(apr_pool_t* pool) {
  htmlSAXHandlerPtr sax = apr_pcalloc(pool, sizeof(htmlSAXHandler) ) ;
  sax->startDocument = NULL ;
  sax->endDocument = NULL ;
  sax->startElement = pstartElement ;
  sax->endElement = pendElement ;
  sax->characters = pcharacters ;
  sax->comment = pcomment ;
  sax->cdataBlock = pcdata ;
  return sax ;
}

static ap_regex_t* seek_meta_ctype ;
static ap_regex_t* seek_charset ;
static ap_regex_t* seek_meta ;

static void proxy_html_child_init(apr_pool_t* pool, server_rec* s) {
  seek_meta_ctype = ap_pregcomp(pool,
        "(<meta[^>]*http-equiv[ \t\r\n='\"]*content-type[^>]*>)",
        AP_REG_EXTENDED|AP_REG_ICASE) ;
  seek_charset = ap_pregcomp(pool, "charset=([A-Za-z0-9_-]+)",
        AP_REG_EXTENDED|AP_REG_ICASE) ;
  seek_meta = ap_pregcomp(pool, "<meta[^>]*(http-equiv)[^>]*>",
        AP_REG_EXTENDED|AP_REG_ICASE) ;
}

static xmlCharEncoding sniff_encoding(
                request_rec* r, const char* cbuf, size_t bytes
#ifndef GO_FASTER
                        , int verbose
#endif
        ) {
  xmlCharEncoding ret ;
  char* encoding = NULL ;
  char* p ;
  ap_regmatch_t match[2] ;
  unsigned char* buf = (unsigned char*)cbuf ;

  VERBOSE( ap_log_rerror(APLOG_MARK, APLOG_INFO, 0, r,
                "Content-Type is %s", r->content_type) ) ;

/* If we've got it in the HTTP headers, there's nothing to do */
  if ( r->content_type &&
        ( p = ap_strcasestr(r->content_type, "charset=") , p != NULL ) ) {
    p += 8 ;
    if ( encoding = apr_pstrndup(r->pool, p, strcspn(p, " ;") ) , encoding ) {
      if ( ret = xmlParseCharEncoding(encoding),
                ret != XML_CHAR_ENCODING_ERROR ) {
        VERBOSE( ap_log_rerror(APLOG_MARK, APLOG_INFO, 0, r,
                "Got charset %s from HTTP headers", encoding) ) ;
        return ret ;
      } else {
        ap_log_rerror(APLOG_MARK, APLOG_ERR, 0, r,
                "Unsupported charset %s in HTTP headers", encoding) ;
        encoding = NULL ;
      }
    }
  }

/* to sniff, first we look for BOM */
  if ( ret = xmlDetectCharEncoding(buf, bytes),
        ret != XML_CHAR_ENCODING_NONE ) {
    VERBOSE( ap_log_rerror(APLOG_MARK, APLOG_INFO, 0, r,
        "Got charset from XML rules.") ) ;
    return ret ;
  }

/* If none of the above, look for a META-thingey */
  encoding = NULL ;
  if ( ap_regexec(seek_meta_ctype, buf, 1, match, 0) == 0 ) {
    p = apr_pstrndup(r->pool, buf + match[0].rm_so,
        match[0].rm_eo - match[0].rm_so) ;
    if ( ap_regexec(seek_charset, p, 2, match, 0) == 0 )
      encoding = apr_pstrndup(r->pool, p+match[1].rm_so,
        match[1].rm_eo - match[1].rm_so) ;
  }

/* either it's set to something we found or it's still the default */
  if ( encoding ) {
    if ( ret = xmlParseCharEncoding(encoding),
        ret != XML_CHAR_ENCODING_ERROR ) {
      VERBOSE( ap_log_rerror(APLOG_MARK, APLOG_INFO, 0, r,
        "Got charset %s from HTML META", encoding) ) ;
      return ret ;
    } else {
      ap_log_rerror(APLOG_MARK, APLOG_ERR, 0, r,
        "Unsupported charset %s in HTML META", encoding) ;
    }
  }
/* the old HTTP default is a last resort */
  ap_log_rerror(APLOG_MARK, APLOG_WARNING, 0, r,
        "No usable charset information: using old HTTP default LATIN1") ;
  return XML_CHAR_ENCODING_8859_1 ;
}
static meta* metafix(request_rec* r, const char* buf /*, size_t bytes*/
#ifndef GO_FASTER
                , int verbose
#endif
        ) {
  meta* ret = NULL ;
  size_t offs = 0 ;
  const char* p ;
  const char* q ;
  char* header ;
  char* content ;
  ap_regmatch_t pmatch[2] ;
  char delim ;

  while ( ! ap_regexec(seek_meta, buf+offs, 2, pmatch, 0) ) {
    header = NULL ;
    content = NULL ;
    p = buf+offs+pmatch[1].rm_eo ;
    while ( !isalpha(*++p) ) ;
    for ( q = p ; isalnum(*q) || (*q == '-') ; ++q ) ;
    header = apr_pstrndup(r->pool, p, q-p) ;
    if ( strncasecmp(header, "Content-", 8) ) {
/* find content=... string */
      for ( p = ap_strstr((char*)buf+offs+pmatch[0].rm_so, "content") ; *p ; ) {
        p += 7 ;
        while ( *p && isspace(*p) )
          ++p ;
        if ( *p != '=' )
          continue ;
        while ( *p && isspace(*++p) ) ;
        if ( ( *p == '\'' ) || ( *p == '"' ) ) {
          delim = *p++ ;
          for ( q = p ; *q != delim ; ++q ) ;
        } else {
          for ( q = p ; *q && !isspace(*q) && (*q != '>') ; ++q ) ;
        }
        content = apr_pstrndup(r->pool, p, q-p) ;
        break ;
      }
    } else if ( !strncasecmp(header, "Content-Type", 12) ) {
      ret = apr_palloc(r->pool, sizeof(meta) ) ;
      ret->start = pmatch[0].rm_so ;
      ret->end = pmatch[0].rm_eo ;
    }
    if ( header && content ) {
      VERBOSE( ap_log_rerror(APLOG_MARK, APLOG_INFO, 0, r,
        "Adding header [%s: %s] from HTML META", header, content) ) ; 
      apr_table_setn(r->headers_out, header, content) ;
    }
    offs += pmatch[0].rm_eo ;
  }
  return ret ;
}

static int proxy_html_filter_init(ap_filter_t* f) {
  const char* env ;
  saxctxt* fctx ;

#if 0
/* remove content-length filter */
  ap_filter_rec_t* clf = ap_get_output_filter_handle("CONTENT_LENGTH") ;
  ap_filter_t* ff = f->next ;

  do {
    ap_filter_t* fnext = ff->next ;
    if ( ff->frec == clf )
      ap_remove_output_filter(ff) ;
    ff = fnext ;
  } while ( ff ) ;
#endif

  fctx = f->ctx = apr_pcalloc(f->r->pool, sizeof(saxctxt)) ;
  fctx->sax = setupSAX(f->r->pool) ;
  fctx->f = f ;
  fctx->bb = apr_brigade_create(f->r->pool, f->r->connection->bucket_alloc) ;
  fctx->cfg = ap_get_module_config(f->r->per_dir_config,&proxy_html_module);

  if ( f->r->proto_num >= 1001 ) {
    if ( ! f->r->main && ! f->r->prev ) {
      env = apr_table_get(f->r->subprocess_env, "force-response-1.0") ;
      if ( !env )
        f->r->chunked = 1 ;
    }
  }

  apr_table_unset(f->r->headers_out, "Content-Length") ;
  apr_table_unset(f->r->headers_out, "ETag") ;
  return OK ;
}
static saxctxt* check_filter_init (ap_filter_t* f) {

  const char* errmsg = NULL ;
  if ( ! f->r->proxyreq ) {
    errmsg = "Non-proxy request; not inserting proxy-html filter" ;
  } else if ( ! f->r->content_type ) {
    errmsg = "No content-type; bailing out of proxy-html filter" ;
  } else if ( strncasecmp(f->r->content_type, "text/html", 9) &&
        strncasecmp(f->r->content_type, "application/xhtml+xml", 21) ) {
    errmsg = "Non-HTML content; not inserting proxy-html filter" ;
  }

  if ( errmsg ) {
#ifndef GO_FASTER
    proxy_html_conf* cfg
        = ap_get_module_config(f->r->per_dir_config, &proxy_html_module);
    if ( cfg->verbose ) {
      ap_log_rerror(APLOG_MARK, APLOG_INFO, 0, f->r, errmsg) ;
    }
#endif
    ap_remove_output_filter(f) ;
    return NULL ;
  }
  if ( ! f->ctx )
    proxy_html_filter_init(f) ;
  return f->ctx ;
}
static int proxy_html_filter(ap_filter_t* f, apr_bucket_brigade* bb) {
  apr_bucket* b ;
  meta* m = NULL ;
  xmlCharEncoding enc ;
  const char* buf = 0 ;
  apr_size_t bytes = 0 ;
#ifndef USE_OLD_LIBXML2
  int xmlopts = XML_PARSE_RECOVER | XML_PARSE_NONET |
        XML_PARSE_NOBLANKS | XML_PARSE_NOERROR | XML_PARSE_NOWARNING ;
#endif

  saxctxt* ctxt = check_filter_init(f) ;
  if ( ! ctxt )
    return ap_pass_brigade(f->next, bb) ;

  for ( b = APR_BRIGADE_FIRST(bb) ;
        b != APR_BRIGADE_SENTINEL(bb) ;
        b = APR_BUCKET_NEXT(b) ) {
    if ( APR_BUCKET_IS_EOS(b) ) {
      if ( ctxt->parser != NULL ) {
        htmlParseChunk(ctxt->parser, buf, 0, 1) ;
      }
      APR_BRIGADE_INSERT_TAIL(ctxt->bb,
        apr_bucket_eos_create(ctxt->bb->bucket_alloc) ) ;
      ap_pass_brigade(ctxt->f->next, ctxt->bb) ;
    } else if ( ! APR_BUCKET_IS_METADATA(b) &&
		apr_bucket_read(b, &buf, &bytes, APR_BLOCK_READ)
              == APR_SUCCESS ) {
      if ( ctxt->parser == NULL ) {
        if ( buf && buf[bytes] != 0 ) {
          /* make a string for parse routines to play with */
          char* buf1 = apr_palloc(f->r->pool, bytes+1) ;
          memcpy(buf1, buf, bytes) ;
          buf1[bytes] = 0 ;
          buf = buf1 ;
        }
#ifndef GO_FASTER
        enc = sniff_encoding(f->r, buf, bytes, ctxt->cfg->verbose) ;
        if ( ctxt->cfg->metafix )
          m = metafix(f->r, buf, ctxt->cfg->verbose) ;
#else
        enc = sniff_encoding(f->r, buf, bytes) ;
        if ( ctxt->cfg->metafix )
          m = metafix(f->r, buf) ;
#endif
        ap_set_content_type(f->r, "text/html;charset=utf-8") ;
        ap_fputs(f->next, ctxt->bb, ctxt->cfg->doctype) ;
        if ( m ) {
          ctxt->parser = htmlCreatePushParserCtxt(ctxt->sax, ctxt,
                buf, m->start, 0, enc ) ;
          htmlParseChunk(ctxt->parser, buf+m->end, bytes-m->end, 0) ;
        } else {
          ctxt->parser = htmlCreatePushParserCtxt(ctxt->sax, ctxt,
                buf, bytes, 0, enc ) ;
        }
        apr_pool_cleanup_register(f->r->pool, ctxt->parser,
                (void*)htmlFreeParserCtxt, apr_pool_cleanup_null) ;
#ifndef USE_OLD_LIBXML2
        if ( xmlopts = xmlCtxtUseOptions(ctxt->parser, xmlopts ), xmlopts )
          ap_log_rerror(APLOG_MARK, APLOG_WARNING, 0, f->r,
                "Unsupported parser opts %x", xmlopts) ;
#endif
      } else {
        htmlParseChunk(ctxt->parser, buf, bytes, 0) ;
      }
    } else {
      ap_log_rerror(APLOG_MARK, APLOG_ERR, 0, f->r, "Error in bucket read") ;
    }
  }
  /*ap_fflush(ctxt->f->next, ctxt->bb) ;        // uncomment for debug */
  apr_brigade_cleanup(bb) ;
  return APR_SUCCESS ;
}
static const char* fpi_html =
        "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\">\n" ;
static const char* fpi_html_legacy =
        "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\n" ;
static const char* fpi_xhtml =
        "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n" ;
static const char* fpi_xhtml_legacy =
        "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" ;
static const char* html_etag = ">" ;
static const char* xhtml_etag = " />" ;
/*#define DEFAULT_DOCTYPE fpi_html */
static const char* DEFAULT_DOCTYPE = "" ;
#define DEFAULT_ETAG html_etag

static void* proxy_html_config(apr_pool_t* pool, char* x) {
  proxy_html_conf* ret = apr_pcalloc(pool, sizeof(proxy_html_conf) ) ;
  ret->doctype = DEFAULT_DOCTYPE ;
  ret->etag = DEFAULT_ETAG ;
  ret->bufsz = 8192 ;
  return ret ;
}
static void* proxy_html_merge(apr_pool_t* pool, void* BASE, void* ADD) {
  proxy_html_conf* base = (proxy_html_conf*) BASE ;
  proxy_html_conf* add = (proxy_html_conf*) ADD ;
  proxy_html_conf* conf = apr_palloc(pool, sizeof(proxy_html_conf)) ;

  if ( add->map && base->map ) {
    urlmap* a ;
    conf->map = NULL ;
    for ( a = base->map ; a ; a = a->next ) {
      urlmap* save = conf->map ;
      conf->map = apr_pmemdup(pool, a, sizeof(urlmap)) ;
      conf->map->next = save ;
    }
    for ( a = add->map ; a ; a = a->next ) {
      urlmap* save = conf->map ;
      conf->map = apr_pmemdup(pool, a, sizeof(urlmap)) ;
      conf->map->next = save ;
    }
  } else
    conf->map = add->map ? add->map : base->map ;

  conf->doctype = ( add->doctype == DEFAULT_DOCTYPE )
                ? base->doctype : add->doctype ;
  conf->etag = ( add->etag == DEFAULT_ETAG ) ? base->etag : add->etag ;
  conf->bufsz = add->bufsz ;
  if ( add->flags & NORM_RESET ) {
    conf->flags = add->flags ^ NORM_RESET ;
    conf->metafix = add->metafix ;
    conf->extfix = add->extfix ;
    conf->strip_comments = add->strip_comments ;
#ifndef GO_FASTER
    conf->verbose = add->verbose ;
#endif
  } else {
    conf->flags = base->flags | add->flags ;
    conf->metafix = base->metafix | add->metafix ;
    conf->extfix = base->extfix | add->extfix ;
    conf->strip_comments = base->strip_comments | add->strip_comments ;
#ifndef GO_FASTER
    conf->verbose = base->verbose | add->verbose ;
#endif
  }
  return conf ;
}
#define REGFLAG(n,s,c) ( (s&&(ap_strchr((char*)(s),(c))!=NULL)) ? (n) : 0 )
#define XREGFLAG(n,s,c) ( (!s||(ap_strchr((char*)(s),(c))==NULL)) ? (n) : 0 )
static const char* set_urlmap(cmd_parms* cmd, void* CFG,
        const char* from, const char* to, const char* flags) {
  int regflags ;
  proxy_html_conf* cfg = (proxy_html_conf*)CFG ;
  urlmap* map ;
  urlmap* newmap = apr_palloc(cmd->pool, sizeof(urlmap) ) ;

  newmap->next = NULL ;
  newmap->flags
        = XREGFLAG(M_HTML,flags,'h')
        | XREGFLAG(M_EVENTS,flags,'e')
        | XREGFLAG(M_CDATA,flags,'c')
        | REGFLAG(M_ATSTART,flags,'^')
        | REGFLAG(M_ATEND,flags,'$')
        | REGFLAG(M_REGEX,flags,'R')
        | REGFLAG(M_LAST,flags,'L')
  ;

  if ( cfg->map ) {
    for ( map = cfg->map ; map->next ; map = map->next ) ;
    map->next = newmap ;
  } else
    cfg->map = newmap ;

  if ( ! (newmap->flags & M_REGEX) ) {
    newmap->from.c = apr_pstrdup(cmd->pool, from) ;
    newmap->to = apr_pstrdup(cmd->pool, to) ;
  } else {
    regflags
        = REGFLAG(AP_REG_EXTENDED,flags,'x')
        | REGFLAG(AP_REG_ICASE,flags,'i')
        | REGFLAG(AP_REG_NOSUB,flags,'n')
        | REGFLAG(AP_REG_NEWLINE,flags,'s')
    ;
    newmap->from.r = ap_pregcomp(cmd->pool, from, regflags) ;
    newmap->to = apr_pstrdup(cmd->pool, to) ;
  }
  return NULL ;
}
static const char* set_doctype(cmd_parms* cmd, void* CFG, const char* t,
        const char* l) {
  proxy_html_conf* cfg = (proxy_html_conf*)CFG ;
  if ( !strcasecmp(t, "xhtml") ) {
    cfg->etag = xhtml_etag ;
    if ( l && !strcasecmp(l, "legacy") )
      cfg->doctype = fpi_xhtml_legacy ;
    else
      cfg->doctype = fpi_xhtml ;
  } else if ( !strcasecmp(t, "html") ) {
    cfg->etag = html_etag ;
    if ( l && !strcasecmp(l, "legacy") )
      cfg->doctype = fpi_html_legacy ;
    else
      cfg->doctype = fpi_html ;
  } else {
    cfg->doctype = apr_pstrdup(cmd->pool, t) ;
    if ( l && ( ( l[0] == 'x' ) || ( l[0] == 'X' ) ) )
      cfg->etag = xhtml_etag ;
    else
      cfg->etag = html_etag ;
  }
  return NULL ;
}
static void set_param(proxy_html_conf* cfg, const char* arg) {
  if ( arg && *arg ) {
    if ( !strcmp(arg, "lowercase") )
      cfg->flags |= NORM_LC ;
    else if ( !strcmp(arg, "dospath") )
      cfg->flags |= NORM_MSSLASH ;
    else if ( !strcmp(arg, "reset") )
      cfg->flags |= NORM_RESET ;
  }
}
static const char* set_flags(cmd_parms* cmd, void* CFG, const char* arg1,
        const char* arg2, const char* arg3) {
  set_param( (proxy_html_conf*)CFG, arg1) ;
  set_param( (proxy_html_conf*)CFG, arg2) ;
  set_param( (proxy_html_conf*)CFG, arg3) ;
  return NULL ;
}
static const command_rec proxy_html_cmds[] = {
  AP_INIT_TAKE23("ProxyHTMLURLMap", set_urlmap, NULL,
        RSRC_CONF|ACCESS_CONF, "Map URL From To" ) ,
  AP_INIT_TAKE12("ProxyHTMLDoctype", set_doctype, NULL,
        RSRC_CONF|ACCESS_CONF, "(HTML|XHTML) [Legacy]" ) ,
  AP_INIT_TAKE123("ProxyHTMLFixups", set_flags, NULL,
        RSRC_CONF|ACCESS_CONF, "Options are lowercase, dospath" ) ,
  AP_INIT_FLAG("ProxyHTMLMeta", ap_set_flag_slot,
        (void*)APR_OFFSETOF(proxy_html_conf, metafix),
        RSRC_CONF|ACCESS_CONF, "Fix META http-equiv elements" ) ,
  AP_INIT_FLAG("ProxyHTMLExtended", ap_set_flag_slot,
        (void*)APR_OFFSETOF(proxy_html_conf, extfix),
        RSRC_CONF|ACCESS_CONF, "Map URLs in Javascript and CSS" ) ,
  AP_INIT_FLAG("ProxyHTMLStripComments", ap_set_flag_slot,
        (void*)APR_OFFSETOF(proxy_html_conf, strip_comments),
        RSRC_CONF|ACCESS_CONF, "Strip out comments" ) ,
#ifndef GO_FASTER
  AP_INIT_FLAG("ProxyHTMLLogVerbose", ap_set_flag_slot,
        (void*)APR_OFFSETOF(proxy_html_conf, verbose),
        RSRC_CONF|ACCESS_CONF, "Verbose Logging (use with LogLevel Info)" ) ,
#endif
  AP_INIT_TAKE1("ProxyHTMLBufSize", ap_set_int_slot,
        (void*)APR_OFFSETOF(proxy_html_conf, bufsz),
        RSRC_CONF|ACCESS_CONF, "Buffer size" ) ,
  { NULL }
} ;
static int mod_proxy_html(apr_pool_t* p, apr_pool_t* p1, apr_pool_t* p2,
        server_rec* s) {
  ap_add_version_component(p, VERSION_STRING) ;
  return OK ;
}
static void proxy_html_hooks(apr_pool_t* p) {
  ap_register_output_filter("proxy-html", proxy_html_filter,
        NULL, AP_FTYPE_RESOURCE) ;
  ap_hook_post_config(mod_proxy_html, NULL, NULL, APR_HOOK_MIDDLE) ;
  ap_hook_child_init(proxy_html_child_init, NULL, NULL, APR_HOOK_MIDDLE) ;
}
module AP_MODULE_DECLARE_DATA proxy_html_module = {
        STANDARD20_MODULE_STUFF,
        proxy_html_config,
        proxy_html_merge,
        NULL,
        NULL,
        proxy_html_cmds,
        proxy_html_hooks
} ;


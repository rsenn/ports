// *******  nexImage MSOLEv2 information extractor *******
// *******  version: 2.0.20060601                  *******
// *******  © by nexbyte gmbh, switzerland         *******
// *******  create: 01.06.2006 - rsenn             *******
// *******  modify: 01.06.2006 - rsenn             *******
// *******  requires: libgsf-1                     *******
 
#include <gsf/gsf-input-stdio.h>
#include <gsf/gsf-utils.h>
#include <gsf/gsf-infile.h>
#include <gsf/gsf-infile-msole.h>
#include <gsf/gsf-doc-meta-data.h>
#include <gsf/gsf-msole-utils.h>
#include <gsf/gsf-timestamp.h>
#include <gsf/gsf-docprop-vector.h>

#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define DEBUG 0

#define GSF_OLEINFO_TYPES_FILE "biff-types.h"
      
typedef struct
{  
  guint16 opcode;
  char *name;
} gsf_oleinfo_generic_t;

static const char       *gsf_oleinfo_program;
static GHashTable       *gsf_oleinfo_values;
static GPtrArray        *gsf_oleinfo_biff_types;
static char const *const gsf_oleinfo_key_map[][2] =
{
  /* according to previous oleinfo.c by nexbyte */
  { "app",        "meta:generator" },
  { "title",      "dc:title" },
  { "subject",    "dc:subject" },
  { "author",     "dc:creator" },  
  { "keywords",   "dc:keywords" },
  { "comments",   "dc:description" },
  { "template",   "meta:template" },  
  { "saved from", "gsf:last-saved-by" },  
  { "rev",        "meta:editing-cycles" },
  { "pagecount",  "gsf:page-count" },  
  { "wordcount",  "gsf:word-count" },  
  { "charcount",  "gsf:character-count" },
  { "security",   "gsf:security" },
  
  /* additional info */
  { "last printed",   "gsf:last-printed" },
  { "duration",       "meta:editing-duration" },
  { "codepage",       "msole:codepage" },
  { "line count",     "gsf:line-count" },
  { "publisher",      "dc:publisher" },
  { "document parts", "gsf:document-parts" },
  { "modified",       "dc:date" },
  { "created",        "meta:creation-date" },
  { "paragraphs",     "gsf:paragraph-count" },
  { "scale",          "gsf:scale" },
  { "links dirty",    "gsf:links-dirty" },
  { "heading pairs",  "gsf:heading-pairs" },
  { "data size",      "msole:unknown-doc-23" }
};
static char const *const gsf_oleinfo_stream_names[] =
{
  "Workbook", "WORKBOOK", "workbook",
  "Book",     "BOOK",     "book"
};
static void              gsf_oleinfo_read_types  (char const *fname, 
                                                  GPtrArray **types);
static char const       *gsf_oleinfo_opcode_name (unsigned    opcode);
static void              gsf_oleinfo_dump_biff   (GsfInput   *stream);  

/* Output all info */
static void gsf_oleinfo_output()
{
  unsigned int i;
  
  for(i = 0; i < (sizeof(gsf_oleinfo_key_map) / 
                  sizeof(gsf_oleinfo_key_map[0])); i++)
  {
    gpointer ptr;

    ptr = g_hash_table_lookup(gsf_oleinfo_values, gsf_oleinfo_key_map[i][1]);
    
    printf("%s:%s\n", gsf_oleinfo_key_map[i][0], (const char *)ptr);
  }
}

/* Dump data */
/*
static void gsf_oleinfo_dump(gpointer key, gpointer value, gpointer user_data)
{
  printf("%s = %s\n", (const char *)key, (const char *)value);
}  
*/  
/* Process data and store it in the hashtable */
static void gsf_oleinfo_data(gpointer name, gpointer prop, gpointer user_data)
{
  if(name && prop)
  {
    const GValue *value = gsf_doc_prop_get_val(prop);
    char buf[1024];
    buf[0] = '\0';
    
    switch(G_VALUE_TYPE(value))
    {
      case G_TYPE_INT:
        snprintf(buf, sizeof(buf), "%i", 
                 *(gint *)(value->data));
        break;   

      case G_TYPE_BOOLEAN:
      snprintf(buf, sizeof(buf), "%s", 
               *(gboolean *)(value->data) ? "true" : "false");
        break;   

      case G_TYPE_STRING:
        snprintf(buf, sizeof(buf), "%s", 
                 *(gchararray *)(value->data));
        break;
      
      default:
      
        if(VAL_IS_GSF_TIMESTAMP(value))
        {
          GsfTimestamp *timestamp = (GsfTimestamp *)(value->data);
          char *p;

          snprintf(buf, sizeof(buf), "%s", 
                   gsf_timestamp_as_string(timestamp));
          
          if((p = strchr(buf, 'T')))
            *p = ' ';
          if((p = strchr(buf, 'Z')))
            *p = ' ';
        }
        else if(VAL_IS_GSF_DOCPROP_VECTOR(value))
        {
          GsfDocPropVector *prop_vector = *(GsfDocPropVector **)(value->data);
          
          snprintf(buf, sizeof(buf), "%s", 
                   gsf_docprop_vector_as_string(prop_vector));
        }
        else
        {
          g_warning("%s: unhandled value type: %s",
                    gsf_oleinfo_program, G_VALUE_TYPE_NAME(value));
          return;
        }
      
        break;
    }

    g_hash_table_insert(gsf_oleinfo_values, g_strdup(name), g_strdup(buf));
  }  
}

/*
 * Read an MSOLE v2 compatible document in one go; builds up a hashed key list
 */
static int gsf_oleinfo_read(const char *filename)
{
  GsfInput  *input;
  GsfInput  *stream;
  GsfInfile *infile;
  GError    *err = NULL;
  int        i;

  /* Open a stdio stream for the specified MSOLE file */
  input = gsf_input_stdio_new(filename, &err);
  
  if(input == NULL)
  {
    g_return_val_if_fail(err != NULL, 1);
    g_warning("%s: %s: error: %s", gsf_oleinfo_program, 
              filename, err->message);
    g_error_free(err);
    return 1;
  }
  
  /* Incompress the input stream and load it as MSOLE document */
  input = gsf_input_uncompress(input);
  infile = gsf_infile_msole_new(input, &err);
  g_object_unref(input);
  
  if(infile == NULL)
  {
    g_return_val_if_fail(err != NULL, 1);
    g_warning("%s: %s: Not an OLE file: %s", gsf_oleinfo_program, 
              filename, err->message);
    g_error_free(err);
    return 1;
  }
  
  /* Read OLE summary information */
  stream = gsf_infile_child_by_name(infile, "\05SummaryInformation");
  
  if(stream != NULL)
  {
    GsfDocMetaData *meta_data = gsf_doc_meta_data_new();
    
    err = gsf_msole_metadata_read(stream, meta_data);
    
    if(err != NULL)
    {
      g_warning("%s: %s: error: %s", gsf_oleinfo_program, 
                filename, err->message);
      g_error_free(err);
      err = NULL;
    }
    else
    {
#if DEBUG
      gsf_doc_meta_dump(meta_data);
#else
      gsf_doc_meta_data_foreach(meta_data, gsf_oleinfo_data, NULL);
#endif /* DEBUG */
    }
    
    g_object_unref(meta_data);
    g_object_unref(stream);
  }

  /* Read document summary information */
  stream = gsf_infile_child_by_name(infile, "\05DocumentSummaryInformation");
  
  if(stream != NULL)
  {
    GsfDocMetaData *meta_data = gsf_doc_meta_data_new();
    
    err = gsf_msole_metadata_read(stream, meta_data);
    
    if(err != NULL)
    {
      g_warning("%s: %s: error: %s", gsf_oleinfo_program, 
                filename, err->message);
      g_error_free(err);
      err = NULL;
    }
    else
    {
#if DEBUG
      gsf_doc_meta_dump(meta_data);
#else      
      gsf_doc_meta_data_foreach(meta_data, gsf_oleinfo_data, NULL);
#endif /* DEBUG */
    }

    g_object_unref(meta_data);
    g_object_unref(stream);
  }

  /* Iterate through the various child streams */
  for(i = 0; i < G_N_ELEMENTS(gsf_oleinfo_stream_names); i++)
  {
    stream = gsf_infile_child_by_name(infile, gsf_oleinfo_stream_names[i]);
    
    if(stream != NULL)
    {
//      puts(i < 3 ? "Excel97" : "Excel95");
      gsf_oleinfo_dump_biff(stream);
      g_object_unref(stream);
      break;
    }
  }
  
  g_object_unref(infile);
//  g_object_unref(input);
  
  return 0;  
}

int main(int argc, char *argv[])
{
  int ret;

  gsf_oleinfo_program = argv[0];
  
  if(argc < 2)
  {
    fprintf(stderr, "usage: %s <file>\n", gsf_oleinfo_program);
    return 1;
  }
  
  gsf_init();
  
  /* Create a hash table which will contain our info */
  gsf_oleinfo_values = 
    g_hash_table_new_full(g_str_hash, g_str_equal, g_free, g_free);
  
  ret = gsf_oleinfo_read(argv[1]);

  gsf_oleinfo_output();
//  g_hash_table_foreach(gsf_oleinfo_values, gsf_oleinfo_dump, NULL);
  
  g_hash_table_unref(gsf_oleinfo_values);
  
  gsf_shutdown();
  
  return ret;
}

/* Read the BIFF types from the header file */
static void gsf_oleinfo_read_types(char const *fname, GPtrArray **types)
{
  FILE *file = fopen(fname, "r");
  unsigned char buffer[1024];
  *types = g_ptr_array_new();
  
  if(!file)
  {
    char *newname = g_strconcat("../", fname, NULL);
    file = fopen(newname, "r");
  }
  
  if(!file)
  {
    g_printerr("Can't find vital file '%s'\n", fname);
    return;
  }

  while(!feof(file))
  {
    unsigned char *p;
    
    fgets((char *)buffer, sizeof(buffer) - 1, file);
    
    for(p = buffer; *p; p++)
      if(*p == '0' && *(p + 1) == 'x')
    {
      gsf_oleinfo_generic_t *bt = g_new(gsf_oleinfo_generic_t, 1);
      unsigned char *name, *pt;
      
      bt->opcode = strtol((char *)p + 2, 0, 16);
      
      pt = buffer;
      
      while(*pt && *pt != '#')                  /* # */
        pt++;
      
      while(*pt && !isspace(*pt))               /* define */
        pt++;
      
      while(*pt && isspace((unsigned char)*pt)) /* '   ' */
        pt++;
      
      while(*pt && *pt != '_')                   /* BIFF_ */
        pt++;
      
      name = *pt ? pt + 1 : pt;
      
      while(*pt && !isspace((unsigned char)*pt))
        pt++;
      
      bt->name = g_strndup((gchar *)name, (unsigned)(pt - name));
      g_ptr_array_add(*types, bt);
      break;
    }
  }
  
  fclose(file);
}

static char const *gsf_oleinfo_opcode_name(unsigned opcode)
{
  int lp;

  if(!gsf_oleinfo_biff_types)
    gsf_oleinfo_read_types(GSF_OLEINFO_TYPES_FILE, &gsf_oleinfo_biff_types);
  
  /* count backwars to give preference to non-filtered record types */
  for(lp = gsf_oleinfo_biff_types->len; --lp >= 0;)
  {
    gsf_oleinfo_generic_t *bt = g_ptr_array_index(gsf_oleinfo_biff_types, lp);
    
    if(bt->opcode == opcode)
      return bt->name;
  }
  
  return "Unknown";
}

static void gsf_oleinfo_dump_biff(GsfInput *stream)
{
  guint8 const *data;
  guint16 len, opcode;
  unsigned pos = gsf_input_tell(stream);
        
  while(NULL != (data = gsf_input_read(stream, 4, NULL)))
  {
    gboolean enable_dump = TRUE;
    
    opcode = GSF_LE_GET_GUINT16(data);
    len = GSF_LE_GET_GUINT16(data + 2);
    
    if(len > 15000)
    {
      enable_dump = TRUE;
      g_warning("suspicious import of biff record > 15,000 (0x%x) "
                "for opcode 0x%hx", len, opcode);
    }
    else if((opcode & 0xff00) > 0x1000)
    {
      enable_dump = TRUE;
      g_warning("suspicious import of biff record with opcode 0x%hx",
                opcode);
    }
            
//    if(enable_dump)
    if(0)
      printf("opcode 0x%3hx : %15s, length 0x%hx (=%hd)\n",
             opcode, gsf_oleinfo_opcode_name(opcode),
             len, len);

    if(len > 0)
    {
      data = gsf_input_read(stream, len, NULL);
      
      if(data == NULL)
        break;
      
      if(enable_dump)
        gsf_mem_dump(data, len);
    }

    pos = gsf_input_tell(stream);
  }
}


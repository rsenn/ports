#!/bin/sh
#
# -*-mode: shell-script-*-
#
# port-docs.sh
#
# Copyright (c) 2008 root,,, <root@vinylz>.
# All rights reserved.
# 
# $Id: default@license.inc,v 1.1.1.1 2003/04/09 13:55:15 alane Exp $
#
#
# 2008-12-05 root,,, <root@vinylz>
#

# provide default values for the required path variables.
# --------------------------------------------------------------------------- 
: ${prefix="/usr"}
: ${libdir="$prefix/lib"}
: ${shlibdir="$libdir/sh"}

# source required scripts
# --------------------------------------------------------------------------- 
. $shlibdir/util.sh
. $shlibdir/port.sh
. $shlibdir/buildsys/nobuild.sh
. $shlibdir/data/list.sh

# parse command line options using shflags 
# ---------------------------------------------------------------------------
. shflags

DEFINE_boolean help "$FLAGS_FALSE"            "show this help" h
DEFINE_boolean debug "$FLAGS_FALSE"           "enable debug mode" D
DEFINE_boolean no_multi_dirs "$FLAGS_FALSE"   "no multiple dirs" M

FLAGS_HELP="usage: `basename "$0"` [flags] [arguments...]
"
FLAGS "$@" || exit 1; shift ${FLAGS_ARGC}


# Main program
# --------------------------------------------------------------------------- 
main()
{
  if [ "$#" = 0 ]; then
    echo "Usage: ${0##*/} < name | path >"
    exit 1
  fi

  for ARG; do
    if ! is_port "$ARG"; then
      warn "Not a port: $ARG"
      continue
    fi
    
    FILE=`port_pkgfile "$ARG"`
    DIR=`port_dir "$ARG"`
    ROOT=`port_rootdir "$ARG" | head -1`
    NAME=`port_name "$ARG"`
    #IFS=" ""
#"
    DOCS=`
      port_listsources "$ARG" | 
      nobuild_extractdocs | 
      grep -vE "(/|^)(CVS|\.svn|\.git|\.hg)" | 
      grep -vE "(/|^)(configure|install-sh|depcomp|missing|ltconfig|mkinstalldirs|diagnose-lib)" |
      list_removeprefix "$ROOT" | 
      list_filter_out "*/"
    `

    DOCDIRS=`
      list $DOCS | 
      sed -n "\,/, s,/[^/]*\$,,p ;; \,/,! s,.*,.,p" | 
      sort -u
    `

    if [ `count $DOCDIRS` -gt 1 -a "$FLAGS_no_multi_dirs" = "$FLAGS_FALSE" ]; then
      for DOCDIR in $DOCDIRS; do
    
        case $DOCDIR in
          .) DOCDIR= DIRDOCS=`list $DOCS | sed -n "\,/,! p"` ;;
          *) DIRDOCS=`list $DOCS | sed -n "\,^$DOCDIR/[^/]*\$,p"` ;;
        esac
        set -- $DIRDOCS

        echo
        echo "  install -d \$ROOT/share/doc/$NAME${DOCDIR:+/$DOCDIR}"

        echo "  install -m 644 $* \$ROOT/share/doc/$NAME${DOCDIR:+/$DOCDIR}"
      done
    else
      set -- 
      for DOC in $DOCS; do
        if [ "$FLAGS_no_multi_dirs" = "$FLAGS_TRUE" ]; then
          case $DOC in
            */*) continue ;;
          esac
        fi

        set -- "$@" $DOC
      done

      echo "  install -d \$ROOT/share/doc/$NAME"
      echo "  install -m 644 $* \$ROOT/share/doc/$NAME"
    fi
  done  

}
# ---------------------------------------------------------------------------
main "$@"
# ---[ EOF ]-----------------------------------------------------------------

#EOF

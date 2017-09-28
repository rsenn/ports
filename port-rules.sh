#!/bin/sh
#
# -*-mode: shell-script-*-
#
# port-rules.sh
#
# Copyright (c) 2008 root <root@gatling>.
# All rights reserved.
#
# $Id: default@license.inc,v 1.1.1.1 2003/04/09 13:55:15 alane Exp $
#
#
# 2008-11-29 root <root@gatling>
#

# provide default values for the required path variables.
# ---------------------------------------------------------------------------
: ${prefix="/usr"}
: ${libdir="$prefix/lib"}
: ${shlibdir="$libdir/sh"}

# source required scripts
# ---------------------------------------------------------------------------
. $shlibdir/util.sh
. $shlibdir/std/array.sh
. $shlibdir/port.sh
. $shlibdir/devel/toolchain/gcc.sh

# parse command line options using shflags
# ---------------------------------------------------------------------------
. shflags

DEFINE_boolean help "$FLAGS_FALSE"    "show this help" h
DEFINE_boolean debug "$FLAGS_FALSE"   "enable debug mode" D
DEFINE_boolean libtool "$FLAGS_FALSE" "generate libtool/automake vars" l
DEFINE_boolean no_compile "$FLAGS_FALSE" "do not generate rules for compilation of object files" C

FLAGS_HELP="usage: `basename "$0"` [flags] [arguments...]
"
FLAGS "$@" || exit 1; shift ${FLAGS_ARGC}

# Main program
# ---------------------------------------------------------------------------
main()
{
  PF=`port_pkgfile "$1"`
  PD=`port_dir "$PF"`
  PS=`port_srcdir "$PF"`

  IFS="
 "
  while read bin at dir colon cmd; do

    TARGET=
    OBJECTS=
    SOURCES=

    case $dir in
      $PS/*) reldir=${dir#$PS/} ;;
      *) reldir= ;;
    esac

    case $bin in
      */ar)
        set -- $cmd

        AR=$1
        ARFLAGS=$2
        TARGET=$3
        shift 3
        OBJECTS=$*
      ;;

      */gcc)
        gcc_parse $cmd

        CC=$gcc_driver
        TARGET=$gcc_output
        SOURCES=$gcc_args

        gcc_clear
      ;;

      *)
        : warn "Unrecognized command: $cmd"
      ;;
    esac

    if [ "$reldir" ]; then
      SOURCES=`addprefix "${reldir+$reldir/}" $SOURCES`
      OBJECTS=`addprefix "${reldir+$reldir/}" $OBJECTS`
    fi

    if [ "${TARGET%.*}" = "${SOURCES%.*}" ]; then
      continue
    fi

    if [ -n "$TARGET" ]; then
      if [ "$FLAGS_libtool" = "$FLAGS_TRUE" ]; then
        if [ "${TARGET%.a}" = "$TARGET" ]; then
          continue
        fi
        OBJECTS=`array $OBJECTS | sed 's,\.o$,.c,'`
        TARGET=`echo $TARGET | sed 's,\.a$,_la, ;; s,^[./]*,, ;; s,[^_0-9A-Za-z],_,g'`

        echo ${TARGET}_SOURCES = $SOURCES $OBJECTS
      else
        TARGET=`addprefix "${reldir+$reldir/}" $TARGET`

        echo $TARGET: $SOURCES $OBJECTS
      fi
    fi

  done <$PD/.cmds

}

# ---------------------------------------------------------------------------
main "$@"

# ---[ EOF ]-----------------------------------------------------------------

#EOF

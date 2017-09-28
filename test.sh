#!/bin/sh
#
# -*-mode: shell-script-*-
#
# test.sh
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

# parse command line options using shflags 
# ---------------------------------------------------------------------------
. shflags

DEFINE_boolean help false            "show this help" h
DEFINE_boolean debug false           "enable debug mode" D
DEFINE_string input-file "-"         "input file" i

FLAGS_HELP="usage: `basename "$0"` [flags] [arguments...]
"
FLAGS "$@" || exit 1; shift ${FLAGS_ARGC}


# Main program
# --------------------------------------------------------------------------- 
main()
{
  # loop through arguments
  while test "$#" -gt 0; do
    case $1 in
      --) 
        shift
        break
      ;;

      *) 
        break 
      ;;
    esac
    shift
  done

  # now here do something
}

# ---------------------------------------------------------------------------
main "$@"
# ---[ EOF ]-----------------------------------------------------------------

#EOF

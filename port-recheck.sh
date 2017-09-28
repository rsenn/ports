#!/bin/sh
#
# -*-mode: shell-script-*-
#
# port-recheck.sh
#
# Copyright (c) 2009 enkio,,, <enkilo@gatling>.
# All rights reserved.
# 
# $Id: default@license.inc,v 1.1.1.1 2003/04/09 13:55:15 alane Exp $
#
#
# 2009-03-12 enkio,,, <enkilo@gatling>
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

# parse command line options using shflags 
# ---------------------------------------------------------------------------
. shflags

DEFINE_boolean help "$FLAGS_FALSE"            "show this help" h
DEFINE_boolean debug "$FLAGS_FALSE"           "enable debug mode" D
DEFINE_string input_file "-"         "input file" i

FLAGS_HELP="usage: `basename "$0"` [flags] [arguments...]
"
FLAGS "$@" || exit 1; shift ${FLAGS_ARGC}


# Main program
# --------------------------------------------------------------------------- 
main()
{
  for PF in ${@-*/*/Pkgfile}; do
   (OLDVERSION=`port_version "$PF"`
    NEWVERSION=`port_recheck "$PF" 2>/dev/null`
    NAME=`port_name "$PF"`
    ID=`port_id "$PF"`

    if [ "$NEWVERSION" ]; then
      if [ "$NEWVERSION" = "$OLDVERSION" ]; then
        msg "$ID is up to date."
        exit 0
      fi

      msg "$ID got a version bump from $OLDVERSION to $NEWVERSION"

      echo "$ID" "$OLDVERSION" "$NEWVERSION"
    fi)
  done
}

# ---------------------------------------------------------------------------
main "$@"

# ---[ EOF ]-----------------------------------------------------------------

#EOF

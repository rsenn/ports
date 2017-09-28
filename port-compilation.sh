#!/bin/sh
#
# -*-mode: shell-script-*-
#
# port-rules.sh
#
# Copyright (c) 2009 enkio,,, <enkilo@gatling>.
# All rights reserved.
# 
# $Id: default@license.inc,v 1.1.1.1 2003/04/09 13:55:15 alane Exp $
#
#
# 2009-03-07 enkio,,, <enkilo@gatling>
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

DEFINE_boolean  help        "$FLAGS_FALSE"   "show this help" h
DEFINE_boolean  debug       "$FLAGS_FALSE"  "enable debug mode" D

FLAGS_HELP="usage: `basename "$0"` [flags] [arguments...]
"
FLAGS "$@" || exit 1; shift ${FLAGS_ARGC}

# Main program
# --------------------------------------------------------------------------- 
main()
{
  PORT="$1"
  PF=`port_pkgfile "$PORT"`

  port_readfile "$PF" .cmds | 

  while read BIN AT DIR COLON CMD; do
    #CMD=`basename "$BIN"` 

    echo $CMD
  done
}

# ---------------------------------------------------------------------------
main "$@"

# ---[ EOF ]-----------------------------------------------------------------

#EOF

#!/bin/sh
#
# -*-mode: shell-script-*-
#
# port-dupes.sh
#
# Copyright (c) 2009 enkio,,, <enkilo@gatling>.
# All rights reserved.
# 
# $Id: default@license.inc,v 1.1.1.1 2003/04/09 13:55:15 alane Exp $
#
#
# 2009-02-28 enkio,,, <enkilo@gatling>
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

DEFINE_boolean help    "$FLAGS_FALSE"      "show this help" h
DEFINE_boolean verbose "$FLAGS_FALSE"      "verbose output" v
DEFINE_boolean exit    "$FLAGS_FALSE"      "exit on first duplicate" e

FLAGS_HELP="usage: `basename "$0"` [-ehv] [port-list...]
"
FLAGS "$@" || exit 1; shift ${FLAGS_ARGC}
                                                                                                                                                                  
# Main program
# --------------------------------------------------------------------------- 
main()
{
  IFS="
"
  [ "$FLAGS_verbose" = "$FLAGS_TRUE" ] && msg "Building complete port list..."
  
  PORTS=`port_list`

  if [ -z "$*" ]; then
    [ "$FLAGS_verbose" = "$FLAGS_TRUE" ] && warn "Processing the whole bunch of ports...."
    set -- $PORTS
  else
    [ "$FLAGS_verbose" = "$FLAGS_TRUE" ] && msg "Number of ports to check: $#"
  fi


  while [ "$#" -gt 0 ]; do
    
    ID=`port_id "$1"`

    #[ "$FLAGS_verbose" = "$FLAGS_TRUE" ] && msg "Checking `port_id "$1"`..."

    unset DUPES    

    for PORT in $PORTS; do
      if [ "$PORT" != "$ID" -a "${PORT#*/}" = "${ID#*/}" ]; then
        pushv DUPES "$PORT"
      fi
    done

    if [ "$DUPES" ]; then
      #echo "$ID :" $DUPESQ
      echo $ID $DUPES

      if [ "$FLAGS_exit" = "$FLAGS_TRUE" ]; then
        exit 1
      fi
    fi

    shift
  done

  
}

# ---------------------------------------------------------------------------
main "$@"

# ---[ EOF ]-----------------------------------------------------------------

#EOF

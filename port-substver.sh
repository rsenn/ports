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

DEFINE_boolean help false            "show this help" h
DEFINE_boolean debug false           "enable debug mode" D

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
    VERSION=`port_version "$ARG"`

    VEXPR=`fn2re "$VERSION"`

    sed -i "/^version=/! {
      s/$VEXPR/\\\$version/g
    }" "$FILE"
  done  

}
# ---------------------------------------------------------------------------
main "$@"
# ---[ EOF ]-----------------------------------------------------------------

#EOF

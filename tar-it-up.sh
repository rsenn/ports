#!/bin/sh
#
# -*-mode: shell-script-*-
#
# tar-it-up.sh
#
# Copyright (c) 2009  <enki@digitall>.
# All rights reserved.
# 
# $Id: default@license.inc,v 1.1.1.1 2003/04/09 13:55:15 alane Exp $
#
#
# 2009-09-14  <enki@digitall>
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


# Main program
# --------------------------------------------------------------------------- 
main()
{
  while [ "$#" -gt 0 ]; do
   (
   
    PORT=`port_id "$1"`
    DIR=`port_dir "$1"`
    NAME=`port_name "$1"`

    set -e

    if [ -e "$NAME.tgz" ]; then
      msg "$NAME.tgz already exists!"
      exit 2
    fi

    if [ ! -d "$DIR" ]; then
      msg "Port directory $DIR doesn't exist!"
      exit 3
    fi

    tar -cvzf "$NAME.tgz" \
      --exclude="*/.*" \
      --exclude="i[0-7]86-*-*" \
      "$PORT" 
 
    echo "$NAME.tgz"
   

   ) || exit $?

    shift
  done
}

# ---------------------------------------------------------------------------
main "$@"
# ---[ EOF ]-----------------------------------------------------------------

#EOF

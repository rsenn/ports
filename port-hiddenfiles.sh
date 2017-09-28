#!/bin/sh
#
# -*-mode: shell-script-*-
#
# port-hiddenfiles.sh
#
# Copyright (c) 2008 root <root@vinylz>.
# All rights reserved.
# 
# $Id: default@license.inc,v 1.1.1.1 2003/04/09 13:55:15 alane Exp $
#
#
# 2008-12-04 root <root@vinylz>
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
DEFINE_boolean archive false         "put into archive" a
DEFINE_boolean remove false          "remove" r

FLAGS_HELP="usage: `basename "$0"` [flags] [arguments...]
"
FLAGS "$@" || exit 1; shift ${FLAGS_ARGC}


# Main program
# --------------------------------------------------------------------------- 
main()
{
  BASE=hiddenfiles-`date +%Y%m%d`
  NL="
"  
  # now here do something
  find * -mindepth 2 -maxdepth 2 -name ".*" -type f | tee "$BASE.list"

  if [ "$FLAGS_archive" = "$FLAGS_TRUE" ]; then
    set tar -cvzf "$BASE.tgz" --files-from="$BASE.list" 
   # if [ "$FLAGS_remove" = "$FLAGS_TRUE" ]; then
   #   set "$@" --remove-files
   # fi
    "$@"
  fi  
  if [ "$FLAGS_remove" = "$FLAGS_TRUE" ]; then
    xargs -d "$NL" <$BASE.list svn remove --force
  fi
}

# ---------------------------------------------------------------------------
main "$@"
# ---[ EOF ]-----------------------------------------------------------------

#EOF

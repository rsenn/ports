#!/bin/bash
# -*-mode: shell-script-*-
#
# apt-match.sh
#
# Copyright (c) 2008 root <root@phalanx>.
# All rights reserved.
# 
# $Id: apt-match.sh 339 2008-07-04 09:07:07Z enki $
#
#
# 2008-06-24 root <root@phalanx>
#

: ${prefix="/usr"}
: ${libdir="$prefix/lib"}
: ${shlibdir="$libdir/sh"}
: ${portsdir="$prefix/ports"}

source $shlibdir/util.sh
source $shlibdir/port.sh
source $shlibdir/pkgtool/apt.sh

usage()
{
  msg "Usage: ${0##*/} [-v] <exact|ambiguous|notfound> [ports-list]"
  return 1
}

# Initialize variables
IFS="
"

# Parse arguments
while :
do
  case $1 in
    -v) verbose=$((verbose+1)) ;;
    *) break
  esac
  shift
done

mode=$1

case $mode in
  exact)
    cond="= 1"
    ;;
    
  ambig*)
    cond="-gt 1"
    ;;

  not*)
    cond="= 0"
    ;;

  *) 
    usage
    exit 1 
    ;;
esac

shift

# Determine script which lists ports
if test "$#" = 0
then
  ports_list='(cd "$portsdir" && port_find .) | sed -e "s,^\./,,"'
else
  ports_list="IFS=\$'\n' && echo \"$*\""
fi

# List the ports and process each one...
eval "$ports_list" | while read port
do
  pf=$(port_pkgfile "$port")
  
  name=$(port_name "$port")
  category=$(port_category "$port")
  pattern=$name
  
  # Regex pattern for APT package search
  pattern=$(echo "$pattern" | sed "s/[0-9]\+/\[0-9\]*/g")
  pattern=${pattern#lib}
  pattern=${pattern//[-_]/"[-_]\?"}
  
  verbose "Name: $name"

  test "$name" != "$pattern" && verbose "Pattern: $pattern" 2

  matches=$(apt_match "$name")
  
  set -- $matches
  
  IFS=" $IFS"
  
  if test "$#" = 1
  then
    verbose "Exact match: $1" 2
  elif test "$#" -gt 0
  then
    verbose "Matches ($#): $*" 2
  fi

  test "$#" ${cond:-= 1} && 
  case $mode in
    ambig*) 
      echo "$category/$name: $*"
      ;;
    not*)
      echo "$category/$name"
      ;;
    *)
      echo "$1"
      ;;
  esac
done

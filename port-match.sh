#!/bin/bash

. ${shlibdir="/usr/lib/sh"}/util.sh

require 'port'
require 'pkgtool/apt'
require 'pkgmgr/dpkg'

maintainer="Roman Senn <rs@adfinis.com>"
verbosity=1

case $1 in
  -v) verbosity=$((++verbosity)) && shift ;;
  -vv) verbosity=$((verbosity+2)) && shift ;;
esac

if test -z "$1"
then
  set -- */*/Pkgfile
fi

verbose "Matching $# packages..." 1


match_name()
{
  local n="$1" h

  shift
 
  for h
  do
    case $h in
      $n | lib$n | lib$n[0-9]*) echo "$h" && return 0 ;;
    esac
    
    n=${n//-/*}
    
    case $h in
      $n | lib$n | lib$n[0-9]*) echo "$h" && return 0 ;;
    esac    
  done
  return 1
}

for id
do 
  pf=$(port_pkgfile "$id") || break
  pn=$(port_name "$id") || break
  pi=$(port_id "$id") || break
  
  xp=${pn//[!-A-Za-z0-9]/-}
  xp=${xp%-[0-9]}
  xp=${xp%%-[0-9].*}
  xp=${xp//"-"/".*"}
  
  verbose "Matching $xp..." 3
  
  set -- $( apt_match "$xp" | grep -vE '\-(dev|dbg|data|i[3-7]86)' )

  if dpkg_name=$(match_name "$pn" "$@")
  then
    if apt-cache show "$dpkg_name" | grep -q "^Maintainer: .*$maintainer"
    then
      verbose "Maintainer matched, deploying anyway." 2
      set --
    else
      verbose "Package $dpkg_name is already in Ubuntu repository, not deploying" 1
      continue
    fi
  else
    verbose "Package $pn not matched${@:+ ($@)}, deploying it" 2
  fi


  echo "$pi:" "$@"

#  if test "$#" = 1
#  then
#    echo "$x" "$1"
#  fi
done


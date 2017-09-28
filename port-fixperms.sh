#!/bin/sh
#
# -*-mode: shell-script-*-
#
# fix-perms.sh
#
# Copyright (c) 2008 Roman Senn <rs@adfinis.com>
# All rights reserved.
# 
# $Id: default@license.inc,v 1.1.1.1 2003/04/09 13:55:15 alane Exp $
#
#
# 2008-08-02 Roman Senn <rs@adfinis.com>
#

# --------------------------------------------------------------------------- 
: ${prefix="/usr"}
: ${libdir="$prefix/lib"}
: ${shlibdir="$libdir/sh"}
: ${srcdir="$prefix/src"}
: ${pkgdir="$prefix/pkg"}
: ${portsdir="$prefix/ports"}

# --------------------------------------------------------------------------- 
. $shlibdir/util.sh
. $shlibdir/port.sh

# main [arguments...]
#
# Main routine
# --------------------------------------------------------------------------- 
main()
{
  local uid gid

  uid=$(id -u)
  gid=$(id -g)

  local category=
  
  if isin "$1" `port_categories`; then
    category="$1"
  elif is_port "$1"; then
    category=`port_category "$1"`	  
  fi  

  if [ -n "$category" ]; then
    set -- \
      "$srcdir/$category" \
      "$portsdir/$category" \
      "$pkgdir/*/$category" \
      "$srcdir/distfiles"
  fi

  while [ "$#" -gt 0 ]; do

   (if [ -n "$1" ]; then
      msg "Working in directory $1"
      cd "$1"
    fi

    msg "Changing owner to $uid:$gid"
  
    sudo chown -R $uid:$gid .

    msg "Giving user & group write permission to all files"

    find . -type f -follow -print0 | xargs -0 -r chmod ug+rw

    msg "Giving user & group write/exec permission to all directories"

    find . -type d -follow -print0 | xargs -0 -r chmod ug+rwx)
    shift
  done
}

# ===========================================================================
main "$@"

#EOF

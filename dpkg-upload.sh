#!/bin/bash
# -*-mode: shell-script-*-
#
# dpkg-upload
#
# Copyright (c) 2008 root <root@phalanx>.
# All rights reserved.
# 
# $Id: dpkg-upload.sh 332 2008-07-03 00:39:56Z enki $
#
#
# 2008-06-24 root <root@phalanx>
#

: ${prefix="/usr"}
: ${libdir="$prefix/lib"}
: ${shlibdir="$libdir/sh"}

source $shlibdir/util.sh
source $shlibdir/port.sh
source $shlibdir/pkgmgr/dpkg.sh
source $shlibdir/ports/deb.sh
source $shlibdir/distrib.sh

host="i486-linux-gnu"
upload="false"
distrib=$(distrib_detect)

remote_host="adfinis@wonko01.adfinis.com"
remote_path="/local/ftp/$distrib"
remote_script="/local/system/bin/wonko01/generate-pkg-index.sh"
#remote_mount="/mnt/sshfs/$remote_host"

while test "$1" != "${1#-}"
do
  case $1 in
    -u) upload="true" && shift ;;
    --host=*) host="${1#*=}" && shift ;;
  esac
done

debremove=

for deb
do
  debname=${deb%%_*}
  debname=${debname##*/}
      
  pushv debremove "rm -v $remote_path/packages/*/${debname}_* 2>/dev/null;"
done

test -n "$debremove" && ssh "$remote_host" "$debremove"

for deb
do 
  cat=$(dpkg_info "$deb" | sed -n -e '/^Section: / {
    s,^Section: ,,
    s,[^/]\+/,,
    p
  }') || exit $?
  
    rsync --rsh="ssh" --progress $deb "$remote_host:$remote_path/packages/$cat/"
done

#if $upload
#then
  ssh "$remote_host" "$remote_script"

 (#set -x
  remote_mount=$(mktemp -d)
#  trap 'rm -rf "$remote_mount"' EXIT
  (set -x; sshfs "$remote_host:/" "$remote_mount") &&
  cd "$remote_mount$remote_path/dists" &&
  
  rm -f hardy/Release.gpg.new &&
  
  gpg -ba -o \
      hardy/Release.gpg.new \
      hardy/Release &&

  rm -f hardy/Release.gpg &&
  mv -f hardy/Release.gpg{.new,} &&
  
  umount -l "$remote_mount")
#fi      


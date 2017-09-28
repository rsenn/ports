#!/bin/sh

. /usr/lib/sh/util.sh
. /usr/lib/sh/pkgmgr/dpkg.sh
. /usr/lib/sh/data/info.sh

dpkg_list -a | while read pkg
do
  info=$(dpkg_info "$pkg")
  
  if ! echo "$info" | grep -q "adfinis.com"; then
    package=`echo "$info" | info_get - "Package"`
    section=`echo "$info" | info_get - "Section"`
    
    echo -n "$package: " 1>&2
    echo "$section"
  fi
  
done

#!/bin/bash

source /usr/lib/sh/port.sh

verbosity=0
update='true'

while test "$1" != "${1#-}"
do
  case $1 in
    -v) : $((++verbosity)) ;;
    -U) update='false' ;;
  esac
  shift
done

for arg
do 
  dir=$(port_dir "$arg" | head -n1)
  name=$(port_name "$arg")
  deps=$(port_deps "$arg")
  
  if test ! -f "$dir/.deps"
  then
    msg "No .deps file in $dir"
    continue
  fi
  
  libs=$(sed -e "s,^[^:]*: ,," -e "s, ,\n,g" $dir/.deps | sed \
    -e "\,/,! {
      \,\.so[.0-9]*$,! {
        \,\.dll$,! d
      }
    }" \
    | sort -u)
  
  if test -z "$libs"
  then
    msg "No libs in $dir/.deps"
    continue
  fi

  verbose "$(echo "$libs" | sed 's,^,SEARCH: ,')"
  
  dpkg_pkgs=$(dpkg -S $libs | sed -e 's/ [^ ]*\?\.dll\.so//g' | sed -e '/^[^ ]\+:\s*$/d')
  
  verbose "$(echo "$dpkg_pkgs" | sed 's,^,DPKG: ,')"
  
  pkgs=$(echo "$dpkg_pkgs" | sed \
    -e "s,:.*,,g" \
    -e "s,-i686\$,," \
    -e "s,-amd64\$,," \
    -e "\,-dbg\$,d" \
    -e "/diversion by/d" \
  | sed \
    -e "/^$name\$/d" \
    | sed -e "s/[^-+._A-Za-z0-9]\+/\n/g" | sed -e "/^[0-9]/d" | sort -u)
  
  
#  msg "Pkgs: $pkgs"
  
  dpkg_deps=$(IFS=$'\n' && set -- $deps $pkgs && echo "$*" | sort -u)
  dpkg_deps=$(IFS=$'\n' && set -- $dpkg_deps && IFS="," && echo "$*" | sed "s/,/, /g")
#  dpkg_deps="${dpkg_deps:+$dpkg_deps }$deps"
  
#  if ! grep -q "Depends on:" "$dir/Pkgfile"
#  then
#    msg "No 'Depends on:' header in $dir/Pkgfile"
#    continue
#  fi

  echo -n "$dir: " 1>&2
  echo $dpkg_deps

  if $update
  then
   : port_set -i "$dir/Pkgfile" "Depends on:" "$dpkg_deps"
 #   sed -i "s|\(Depends on:\).*|\1 $dpkg_deps|" "$dir/Pkgfile"
  fi
done


#!/bin/sh

PREFIX="/usr"
BOGUSX="$PREFIX/(var|etc)"

. $PREFIX/lib/sh/data/list.sh

egrep -l -R -Dskip "$BOGUSX" $PREFIX/{bin,lib}/ 2>/dev/null | 
xargs -n1 pkginfo -o 2>/dev/null |
sed \
  -e "/^Package\\s\+File/d" \
  -e "/^pkginfo:\\s\+/d" \
  -e "s,\\s\+${PREFIX#/}/, $PREFIX/," |
list_accumulate " " |
while read PKG FILES; do
  DIRS=`strings $FILES | egrep "$BOGUSX" | sort -u`

  echo "$PKG:" $DIRS
done


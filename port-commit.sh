#!/bin/bash

. /usr/lib/sh/port.sh
. /usr/lib/sh/util.sh

n=10
IFS="
"
TMP=`mktemp`

trap 'rm -f "$TMP"' EXIT

(cd $(scriptdir)
 port_find ${@:-.} | xargs -n"$n" svn add
 sh port-list.sh $@ | xargs -n"$n" svn add
 svn ci -m "") 2>&1 | grep -v ' is already under version control$' | tee "$TMP"

sed -n "s,^svn: warning: '\([^']*\)' not found\$,\1,p" \
  "$TMP" \
  >missing.list

wc -l missing.list

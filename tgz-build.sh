#!/bin/bash -e

. /usr/lib/sh/port.sh

if [ "`id -u`" = 0 ]; then
  unset ROOT
elif type fakeroot >/dev/null 2>/dev/null; then
  ROOT=fakeroot
else
  ROOT=sudo
fi

for ARG; do
  PF=`port_pkgfile "$ARG"`
  ID=`port_id "$PF"`
  DESC=`port_description "$ID" short`
  VERSION=`port_version "$ID"`

  set -- `port_pkgmask "$ID"`

  if [ ! -e "$1" ]; then
    echo "ERROR: Package $ID not built." 1>&2
    exit 1
  fi
  (FN=`basename "$1"` #FN=${FN%%"#"*}-${FN#*"#"}
  #FN=${FN
  FN=`port_name "$ID"`-$VERSION-i486-`port_get "$ID" release`.pkg.tgz
  TMP=${FN%.pkg.*}

  trap 'rm -f "$TMP.tgz"' EXIT

  bzcat "$1" | gzip -c -9 >$TMP.tgz

 (set -x
  $ROOT \
  alien \
    --verbose \
    --to-tgz \
    --scripts \
    --description="$DESC" \
    --version="$VERSION" \
    "$TMP.tgz") &&
  trap '' EXIT
  )
done

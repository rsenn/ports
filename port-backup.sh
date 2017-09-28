#!/bin/sh

DESTDIR="/tmp"
FILENAME="ports-`date +%Y%m%d`.tar.bz2"
LIST=".list"

./port-list.sh >$LIST

NUMFILES=`wc -l <$LIST`

echo "Backing up $NUMFILES directory entries." 1>&2

OUTPUT=`tar -cjf "$DESTDIR/$FILENAME" --files-from "$LIST" 2>&1`
FAILCOUNT=`echo "$OUTPUT" | grep -i 'No such file or directory' | wc -l`

if [ "$FAILCOUNT" -gt 0 ]; then
  echo "WARNING: $FAILCOUNT files were not found." 1>&2
fi

du -s "$DESTDIR/$FILENAME"

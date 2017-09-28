#!/usr/local/bin/sh

prefix=/usr/local
sysconfdir=/usr/local/etc
libdir=/usr/local/lib

source ${sysconfdir}/nexbyte.conf
source ${libdir}/nexshell/mysql

if [ "$1" ]; then
  mysql_query "SHOW STATUS" | sed -n "/^$1[ \t]/ { s,$1[ \t]\+,,; p }"
else
  echo -n $(mysql_query "SHOW STATUS" | sed '1 d; /^Com_/d; /^Handler_/d; s,[ \t]\+,:,; /:[0-9]\+$/!d')
fi

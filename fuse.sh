#!/bin/bash

. /usr/lib/sh/util.sh

require port
require ports/deb

export host="i486-linux-gnu"

for x in \
  fuse/archivemount fuse/avfs fuse/ccgfs fuse/chironfs fuse/copyfs fuse/cromfs fuse/cryptofs fuse/cvsfs fuse/dbtoy fuse/fuse-dbfs fuse/fuse-kio fuse/fusecloop fuse/fusecompress fuse/fuseftp fuse/gitfs fuse/goofs fuse/lftpfs fuse/libsqlfs fuse/loggerfs fuse/magmafs fuse/metafs fuse/metfs fuse/mp3fs fuse/mysqlfs fuse/relfs fuse/siefs fuse/svnfs fuse/tagfs fuse/unpackfs fuse/youtubefs
do 
  port_debuild "$x" bugs="Roman Senn <rs@adfinis.com>" origin="adfinis gmbh - http://adfinis.com/"
done

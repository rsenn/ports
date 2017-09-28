#!/bin/sh

dist="hardy"
arch="i386"

basedir="/ubuntu"
distdir="$basedir/dists/$dist"
release="$distdir/Release"
maindir="$distdir/main"
bindir="$maindir/binary-$arch"

#index="$basedir/dists/$dist/P

usage()
{
  echo "Usage: ${0##*/} <release|packages> [field]"
}

release=$(ssh root@apt.adfinis.com "cat /data/$release")

case $1 in
  "release") 
    echo "$release"
    ;;
    
  *)
    set -- $(echo "$release" | sed -n -e '/^ / s,.* ,,p')

    IFS=","

    ssh root@apt.adfinis.com "for file in /data/$distdir/{$*}
    do
      case \$file in 
        *.bz2) : bzip2 -dc \"\$file\" ;;
        *.gz) : gzip -dc \"\$file\" ;;
        *) cat \"\$file\" ;;
      esac
    done" | \
    sed -e "s, \(packages/\), ftp://apt.adfinis.com${basedir}/\1," 
    ;;
esac
    

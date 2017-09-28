#!/bin/bash
#
# -*-mode: shell-script-*-
#
# dpkg-build
#
# Copyright (c) 2008 root <root@phalanx>.
# All rights reserved.
# 
# $Id: dpkg-build.sh 570 2008-10-02 05:42:22Z root $
#
# 2008-06-24 root <root@phalanx>
# ---------------------------------------------------------------------------

# Set any required directories not yet defined
# ---------------------------------------------------------------------------
: ${prefix="/usr"}
: ${libdir="$prefix/lib"}
: ${shlibdir="$libdir/sh"}

# Detect distribution
# ---------------------------------------------------------------------------
. $shlibdir/distrib.sh

: ${distrib=`distrib_detect`}
: ${codename=`distrib_get 'codename'`}
: ${canonical=`distrib_canonical`}
: ${component="main"}
: ${pool="pool"}

if [ -z "$distrib" ]; then
  error "Could not determine distribution!"
  exit 1
fi

# Load script dependencies
# ---------------------------------------------------------------------------
. $shlibdir/util.sh
. $shlibdir/port.sh
. $shlibdir/net/ssh.sh
. $shlibdir/shell/cmd.sh
. $shlibdir/ports/deb.sh
. $shlibdir/archive/tar.sh

# Parse command line options using shflags 
# ---------------------------------------------------------------------------
. shflags

DEFINE_string  host    "`gcc -dumpmachine`"     "host architecture"  H
DEFINE_boolean upload  "$FLAGS_FALSE"           "upload the package" u
DEFINE_boolean keep    "$FLAGS_FALSE"           "keep temporary dir" k
DEFINE_boolean verbose "$FLAGS_FALSE"           "verbosity"          v
DEFINE_boolean lintian "$FLAGS_FALSE"           "check the package"  l

FLAGS_HELP="usage: `basename "$0"` [flags] <package names...>"
FLAGS "$@" || exit 1; shift ${FLAGS_ARGC}

# valid DPKG_sections for debian packages
# ---------------------------------------------------------------------------
DPKG_sections="admin base comm devel doc editors electronics embedded games 
               gnome graphics hamradio interpreters kde libdevel libs mail 
               math media metapackages misc net oldlibs otherosfs perl pkgmgm 
               python science shells sound tex text translations utils web 
               x11"

# ---------------------------------------------------------------------------
REPOSITORY_host="adfinis@strinder.adfinis.com"
REPOSITORY_path="/local/ftp/$distrib"
REPOSITORY_script="/local/system/bin/wonko01/generate-pkg-index.sh"
REPOSITORY_pkgdir="$REPOSITORY_path/${pool:-pool}/\${component}/\${category}"
#REPOSITORY_pkgdir="$REPOSITORY_path/${pool:-pool}/\${section}"

# ---------------------------------------------------------------------------
check_useriuserid()
{
  USERID=`id -u`

  if [ "$USERID" != 0 ]; then
    error "${0##*/} must be running as root or under fakeroot!"
  fi
}

# ---------------------------------------------------------------------------
if [ "$FLAGS_verbose" = "$FLAGS_TRUE" ]; then
  verbosity=3
fi

for arg; do 
  if ! is_port "$arg"; then
    warn "$arg is not a valid port!"
    continue
  fi

  dir=`port_dir "$arg" | head -n1`
  name=`port_name "$arg"`
  category=`port_category "$arg"`

  # Determine package section
  section=`port_get "$arg" "Section:"`

  if [ -z "$section" ]; then
    section="$category"
  fi

  if ! isin "${section##*/}" $DPKG_sections; then
    error "$section is not a valid section"
  fi
  
  # Determine package version
  version=`port_get "$arg" "Version:"`

  case "$version" in
    *:) version="$version`port_version "$arg"`-`port_get "$arg" release`" ;;
  esac

  if [ -z "$version" ]; then
    version=`port_version "$arg"`-`port_get "$arg" release`
  fi
  
  if [ -n "$codename" ]; then
    version="${version}~$codename"
  fi
  
  args=
  deps=
  dep_args=
  package=  
  
  if [ "$FLAGS_keep" = "$FLAGS_TRUE" ]; then
    pushv args -k
  fi
  
  case "$FLAGS_host" in
    *-mingw32*) 
      package="mingw32-$name" 
      section="universe/devel" 
      dep_args="-U"
    ;;
    *-diet)
      package="$name-diet" 
      section="universe/devel" 
      dep_args="-U"
    ;;
  esac

  case "$section" in
    */*)
      component=${section%%/*}
      section=${component#*/}
    ;;
  esac

  if [ -n "$package" ]; then
    warn "Package is for different architecture $FLAGS_host, renaming it to $package."
  fi
  
  deps=`port_get "$arg" 'Depends on:'`

  if [ -z "$deps" ]; then
    deps=`dpkg-dep.sh $dep_args "$arg" 2>/dev/null`
    
    if [ "$deps" ]; then
      msg "Dependencies:" $deps
    fi
  fi
  
  set -- port_debuild $args "$arg" \
      bugs="${bugs:-"Roman Senn <rs@adfinis.com>"}" \
      origin="${origin:-"adfinis GmbH - http://adfinis.com/"}" \
      ${package:+package="$package"} \
      ${section:+section="$section"} \
      depends="$deps" \
      version="$version"
  echo "+ $@" 1>&2

  debs=`
    "$@"
  `
  
  if [ -z "$debs" ]; then
    error "Building $package failed"
    exit 1
  fi
  
  if [ "$FLAGS_lintian" = "$FLAGS_TRUE" ]; then
    for deb in $debs; do
      lintian "$deb" 2>&1 | 
      grep -vE "(running it with root privileges|/compat'|invalid option -wmac)" 
    done
  fi

  if [ "$FLAGS_upload" = "$FLAGS_TRUE" ]; then
    debremove=

    for deb in $debs; do
      debname=${deb%%[_\`\"\>\']*}

      case $debname in
        [a-z]*)
          verbose "Going to remove old package ${debname}"
          pushv debremove "find '$REPOSITORY_path' -name '${debname}_*' -type f -exec rm '{}' ';'"
          ;;
      esac
    done

    if [ -n "$debremove" ]; then
      cmd_exec "$debremove" "$REPOSITORY_host" 1>&2
    fi
     
    set -- $debs
     
   (IFS=" "
    eval "REPOSITORY_pkgdir=\"$REPOSITORY_pkgdir\""
    cmd_exec "mkdir -p $REPOSITORY_pkgdir" $REPOSITORY_host
    cmd_exec "rsync --rsh=ssh --progress $* $REPOSITORY_host:$REPOSITORY_pkgdir")
  fi
done

# ---------------------------------------------------------------------------
if [ "$FLAGS_upload" = "$FLAGS_TRUE" ]; then
  cmd_exec "cd '$REPOSITORY_path' && distrib='$distrib' codename='$codename' pool='pool' section='${section:-main}' $REPOSITORY_script" "$REPOSITORY_host"
 # ssh "$REPOSITORY_host" "cd '$REPOSITORY_path' && distrib='$distrib' codename='$codename' pool='packages' section='${section:-main}' $REPOSITORY_script"

 (remote_mount=$(mktemp -d)

#  trap 'rm -rf "$remote_mount"' EXIT

 suite=$codename-adfinis

 (set -x; sshfs "$REPOSITORY_host:/" "$remote_mount") &&
  cd "$remote_mount$REPOSITORY_path/dists" &&
  rm -f $suite/Release.gpg.new &&  
  gpg -ba -o $suite/Release.gpg.new $suite/Release &&
  rm -f $suite/Release.gpg &&
  mv -f $suite/Release.gpg{.new,} &&
  umount -l "$remote_mount"
 )
fi      

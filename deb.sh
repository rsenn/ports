#!/bin/sh
#
# ports/deb.sh: Debian package porting abstraction
#
# $Id: deb.in 700 2007-04-19 21:00:17Z  $
# -------------------------------------------------------------------------
test $lib_ports_deb_sh || {

: ${prefix=/usr/local}
: ${libdir=${prefix}/lib}
: ${shlibdir=}

. $shlibdir/util.sh
. $shlibdir/dir.sh
. $shlibdir/file.sh

# deb_control <variables...>
#
# Gets header info from a .deb file.
# -------------------------------------------------------------------------
deb_control()
{
  local IFS="$obj_s"
  local "$@"
  #$(obj -s" " "$@")"
  IFS="
"
  test -z "$description" && description="<no description>"

  description=$(echo "$description" | sed -e 's/^\s*$/./')
  
  set -- $depends
  depends=$(IFS="," && echo "$*")

cat <<EOF
Package: ${package:?'missing required variable $package'}
Version: ${version:?'missing required variable $version'}
Section: ${section}${source:+
Source: $source}
Priority: ${priority:-optional}
Installed-Size: ${size:?'missing required variable $size'}
Architecture: ${arch:?'missing required variable $arch'}${replaces:+
Replaces: $replaces}${provides:+
Provides: $provides}${depends:+
Depends: $depends}${conflicts:+
Conflicts: $conflicts}${recommends:+
Recommends: $recommends}${suggests:+
Suggests: $suggests}
Maintainer: ${maintainer:?'missing required variable $maintainer'}
Description: ${description//$IFS/$IFS }${homepage:+
Homepage: $homepage}${bugs:+
Bugs: $bugs}${origin:+
Origin: $origin}
EOF
}

# deb_splittree <destdir> <list-of-files...>
#
# 
# -------------------------------------------------------------------------
deb_splittree()
{
  local n destdir="$1" file subdir
  
  shift
  
  n="$#"

  while test "$n" -ge 1 && eval "file=\"\${$n}\"" && test -n "$file"
  do
    subdir=${file%/*}

    if test -e "$file" #|| (test -d "$file" && ! dir_empty "$file")
    then
      if test ! -d "$destdir/$subdir"
      then
        mkdir -p "$destdir/$subdir"
      fi
#      mv -vf "$file" "$destdir/$subdir" 1>&2 2>/dev/null
      mv -f "$file" "$destdir/$subdir" 2>/dev/null
      
      
      find "$subdir" -type d | while read x; do dir_prune -r "$x"; done
    fi

    n=$((n - 1))
  done
  
  deb_rename_docdir "$destdir"
}

# deb_rename_docdir <directory> 
# -------------------------------------------------------------------------
deb_rename_docdir()
{
  local destdir=$1 docdir="/usr/share/doc"

  if test -e "$destdir$docdir"; then
   (cd "$destdir$docdir"

    set -- *
    pkgname=$(basename "$destdir")

    if test "$1" != "$pkgname" && test "$#" = 1
    then
      verbose "Renaming $docdir/$1 to $pkgname ..."
      mv -f "$1" "$pkgname"
    fi)
  fi
}

# deb_buildpkg <archive-or-directory> [control-variables]
#
# Gets header info from a .deb file.
# -------------------------------------------------------------------------
deb_buildpkg()
{
  local dir temp= ret keep="false" suffix=

  case $1 in
    -k) keep="true" && shift ;;
  esac

  arg="$1" 
  shift
  
  local "$@"

  if test -f "$arg"
  then
    $lib_archive_sh source $shlibdir/archive.sh
    $lib_util_sh source $shlibdir/util.sh
    
    dir=$(mktempdir)
    
    dir="$dir/debian/${package:-PKG}"
    temp="$dir"
    
    mkdir -p "$dir/DEBIAN"
    
    verbose "Unpacking $arg"
    
    archive_unpack "$arg" "$dir" >/dev/null
    
  elif test -n "$arg" -a -d "$arg"
  then
    dir="$arg"
  else 
    errormsg "No such source package: $arg"
    return 127
  fi
  
  local {pre,post}{inst,rm}
  local {elf,script,executable,runtime}_files
  
  script_files=$(
    cd $dir && find * \
        -not -type d \
    '(' -wholename "*/pkgadd/*.pre" \
    -or -wholename "*/pkgadd/*.post" \
    -or -wholename "*/pkgrm/*.pre" \
    -or -wholename "*/pkgrm/*.post" \
    -or -wholename "*/pkgconf/*" ')'
  )

  if test -n "$script_files"
  then
   #warn "Need to move scripts:" $script_files
    local sh
    for sh in $script_files
    do
     (pfx=${package}.
     
      case $sh in
        */pkgadd/*) what="inst" when=${sh##*.} ;;
        */pkgrm/*) what="rm" when=${sh##*.} ;;
        */pkgconf/*) what=${sh##*.} when= pfx= ;;
      esac

      case $what in
        inst | rm) sed -i '$ i\
\
##DEBHELPER##\
\
' $dir/$sh
        ;;
      esac

      mv -f $dir/$sh $dir/DEBIAN/${pfx}${when}${what}
      dir_prune -r $dir/${sh%/*}
     )
      
      case $sh in
        */pkgconf/*)
          depends=${depends//'debconf, '/} 
          depends=${depends//', debconf'/}
          test "$depends" = debconf && depends=
          depends="debconf${depends:+, $depends}" 
          ;;
      esac
    done
  fi

  executable_files=$(
    cd $dir && find * \
        -not -type d \
    '(' -wholename "*/bin/*" \
    -or -wholename "*/sbin/*" \
    -or -wholename "*/libexec/*" ')' \
   -and -not -wholename "*/bin/*-config"
  )

  runtime_files=$(
    cd $dir &&
    find * \
        -type f \
        -wholename "*/lib/*.so*" -and \
        -not -wholename "*/lib/perl[0-9]/*" -and \
        -not -wholename "*/lib/ruby/*"
  )
  
  libdevel_shared=$(
    cd $dir &&
    find * \
        -type l \
        -wholename "*/lib/*.so"
  )
  
  libdevel_static=$(
    cd $dir &&
    find * \
        -type f \
        -wholename "*/include/*" -or \
        -wholename "*/lib/*.[ao]" -or \
        -wholename "*/lib/*.l[ao]"
  )
  
  local perl_{files,version}
  
  perl_files=$(
    cd $dir &&
    find * \
        -type f \
        -wholename "*/lib/perl*/*.pm" -or \
        -wholename "*/share/perl*/*.pm" -or \
        -wholename "*/lib/perl*/*.so"
  )
  
  perl_version=$(
    echo "$perl_files" |
    sed -n -e 's,^.*/.*/perl/\?\([.0-9]\+\)/.*,\1,p' |
    sort -u |
    tail -n1
  )
  
#  msg "Perl files:" $perl_files
#  msg "Perl version:" $perl_version

  local ruby_{files,version}
  
  ruby_files=$(
    cd $dir &&
    find * \
        -type f \
        -wholename "*/lib/ruby*/*.rb" -or \
        -wholename "*/share/ruby*/*.rb" -or \
        -wholename "*/lib/ruby*/*.so"
  )
  
  ruby_version=$(
    echo "$ruby_files" |
    sed -n -e 's,^.*/.*/ruby/\?\([.0-9]\+\)/.*,\1,p' |
    sort -u |
    tail -n1
  )

  if test -n "$ruby_files" || test -n "$ruby_version"
  then
    verbose "Ruby files:" $ruby_files
    verbose "Ruby version:" $ruby_version
  fi

  local split=$(echo "$split" | sed -e 's/,\s\?/\n/g' | sed -e "s/^-/$package-/")
  local split_parts=$(echo "$split" | sed -e 's, \?([^)]*)$,,')

  if test -n "$split" || test -n "$split_parts"
  then
    debug "split: $split"
    debug "split_parts: $split_parts"
  fi



  split_get()
  {
    local IFS=$'\n '
    
    set -f
    set -- $(IFS=$'\n' && match "$1 *" $split | sed 's,^.*(\([^)]*\))$,\1,')
    
    echo "$*"
  }
  
  split_find()
  {
    local args=$(split_get "$@" | sed 's,.\+,-or\n-wholename\n&,')
    
    echo "${args#-or?}"
  }

#  msg "Split: $split"
#  msg "Split parts: $split_parts"
#  msg "Split-dev: $(split_find '*dev')"
 
  
  if test -z "$executable_files" &&
   { test -n "$runtime_files" || test -n "$perl_files" || test -n "$ruby_files"; } &&
     test "$package" = "${package#lib}" && test "$split" != -
  then
    if test -z "$runtime_files"
    then
      if test -n "$perl_files"
      then
        suffix="perl" 
      
        local n=$(IFS="." && set -- $perl_version && echo "$#")
      
        if test "$n" -gt 1
        then
          suffix="$suffix$perl_version"
          warn "Version specific perl libraries, package suffix: $suffix"
        fi
      elif test -n "$ruby_files"
      then
        suffix="ruby" 
      
        local n=$(IFS="." && set -- $ruby_version && echo "$#")
      
        if test "$n" -gt 1
        then
          suffix="$suffix$ruby_version"
          warn "Version specific ruby libraries, package suffix: $suffix"
        fi
      fi
#      depends="\${perl:Depends}${depends:+ $depends}"
    fi
  
    msg "Package has no executables, only ${suffix:+${suffix%%[0-9]*} }libraries, renaming it to lib$package${suffix:+-$suffix}"
  
    package="lib$package${suffix:+-$suffix}"
    set -- "$@" package="$package"
  fi

  local devel_pkg= orig_pkg

  orig_pkg="$package"

  case $package in
    lib*)
      verbose "Checking library major versions..."
    
      major_versions=$(for arg in $runtime_files
      do
        arg="${arg##*.so.}"
        arg="${arg%%.*}"

        if test $((arg)) -ge 0; then
          echo $((arg))
        fi
      done 2>/dev/null | sort -u)

      if test $(count $major_versions) -gt 1; then
        msg "Ambiguous major versions:" $major_versions
#      else
#        msg "Library major versions:" $major_versions
      fi

      if test $(count $major_versions) = 1 && imatch_some "*${package%%-[0-9]*}*" $runtime_files; then
         msg "Detected common major library version: $major_versions"

         provides="${provides:+$provides, }$package"

         case $package in 
           *[0-9]) 
             devel_pkg="${package}-dev"
             package="${package}-$major_versions"
             ;;

           *) 
             package="${package}$major_versions"
             devel_pkg="$package-dev"
             ;;
         esac
         set -- "$@" package="$package" provides="$provides"

      elif test $(count $major_versions) -ge 1; then
        msg "Library major versions:" $major_versions
      fi
    ;;
  esac

  local split_devel=$(split_find '*-dev')

  if test -n "$split_devel"
  then
  
    devel_files=$(
      set -f && set -- $split_devel && set +f
    
      cd $dir && IFS=$'\n ' && find * "$@"
    )

  else
    devel_files=$(
      cd $dir &&
      find * \
           -not -type d \
          -wholename "*/man3/*" \
      -or -wholename "*/lib/*.a" \
      -or -wholename "*/lib/*.la" \
      -or -wholename "*/lib/pkgconfig/*.pc" \
      -or -wholename "*/bin/*-config" \
      -or -wholename "*/include/*"

      find * \
          -type l \
          -wholename "*/lib/*.so"
    )
  fi

  manpage_files=$(
    cd $dir &&
    find * \
        -not -type d \
        -wholename "*/man/man*/*"
  )

  # check for binaries
  elf_files=$(find "$dir" -type f -exec file '{}' ';' | grep -E ':.* (ELF |current ar archive$)')
  
  if test -z "$elf_files"; then
    arch="all"
  fi

  if isin "dev" $split_parts || test -n "$split_devel" ||
     test -n "$libdevel_shared" -a "$devel_files" != "$manpage_files" -a "$split" != -
  then
    if test -z "$devel_pkg"; then
      devel_pkg="${dir##*/}-dev"
    fi
  
    msg "Package $package has development-files, breaking them out to $devel_pkg"
  
    mkdir -p "${dir%/*}/$devel_pkg"
    pushv temp "${dir%/*}/$devel_pkg"
    
   (cd "$dir" && IFS="
";  deb_splittree "../$devel_pkg" $devel_files)

    case $devel_pkg in
      lib*) section="libdevel" ;;
    esac

    deb_buildpkgdir "${dir%/*}/$devel_pkg" "$@" package="$devel_pkg" arch="$arch" section="$section" provides="$orig_pkg-dev" \
        description="$(echo "$description" | sed -e '1s/$/ - development kit/')

This package contains the header and development files needed to build
programs and packages using $package." \
        depends="${depends:+$depends, }$package (= $version)"

    set -- "$@" description="$(echo "$description" | sed -e '1s/$/ - runtime library/')
    
This package contains the runtime library files needed to run software
using $package."
  fi
  
  local part split_pkg
  
  array_remove split_parts "dev"
  
  for part in $split_parts; do
    case $part in
      -*) split_pkg="$orig_pkg$part" ;;
      *) split_pkg="$part" ;;
    esac
  
    msg "Splitting from package $package to $split_pkg"
  
    mkdir -p "${dir%/*}/$split_pkg"
    pushv temp "${dir%/*}/$split_pkg"
    
   (cd "$dir" && IFS="
";  deb_splittree "../$split_pkg" $(split_find "$part"))

#    deb_rename_docdir "${dir%/*}/$split_pkg"
    deb_buildpkgdir "${dir%/*}/$split_pkg" "$@" package="$split_pkg"
  done

#  deb_rename_docdir "$dir"
  
  deb_buildpkgdir "$dir" "$@" depends="$depends" arch="$arch"
  ret=$?

  if ! $keep
  then
    verbose "Cleaning up temp dirs:" $temp

    for temp in $temp
    do
      test -e "$temp" && rm -rf "$temp"
    done
  fi

  return $ret
}

# -------------------------------------------------------------------------
deb_buildpkgdir()
{
  local dir="$1" pkgname
  
  deb_rename_docdir "$1"

  shift
  
  local "$@"
  
  verbose "Building package $package in $dir" 1
  
  mkdir -p "$dir"

  if test ! -e "$dir/DEBIAN/control"
  then
    mkdir -p "$dir/DEBIAN"

    if ! deb_control "$@" >$dir/DEBIAN/control
    then
      return 1
    fi
 
    echo 5 >$dir/DEBIAN/compat
 
    case $dir in
      */debian/*)
        dirname=${dir##*/}

        (for file in $dir/DEBIAN/*
         do
           if test -f "$file"
           then 
             case $file in
               postrm|postinst|templates|config)
                 cp "$file" $dir/../${dirname}.${file##*/}
                 ;;
               *)
                 cat "$file" >>$dir/../${file##*/}
                 ;;
             esac
           fi
         done)

        (for file in $dir/DEBIAN/*
         do
           case ${file##*/} in
             *config)
               (cd $dir/../.. && set -x && dh_installdebconf) 1>&2
               ;;
             *postrm | *postinst)
               (cd $dir/../.. && set -x && dh_installdeb) 1>&2
               ;;
           esac
         done)
        ;;
    esac
  fi

#  (set -x ;  ln -svf $dir/DEBIAN/* $dir/../.. ; find $dir/../../.. -not -type d 1>&2)
#
#  case $package in
#    *-perl)
#      msg "Launching perl debhelper..."#
#     (cd $dir/../../.. && set -x
#       strace -s 1024 -f dh_perl 2>&1 | grep -E '^(open|chdir|stat|mmap)\("[^/]' 1>&2
#      cat debian/control 1>&2
#      ls -la debian 1>&2)
#      ;;
#  esac

  pkgname=${package}_${version##*:}_${arch}.deb  

  dpkg-deb --build "$dir" "$pkgname" 2>&1 | grep -v '^grep: debian/control: No such file or directory' 1>&2 && echo "$pkgname"
}

# --- eof ---------------------------------------------------------------------
lib_ports_deb_sh=:;}

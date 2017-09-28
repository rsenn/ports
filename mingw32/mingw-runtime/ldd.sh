#!/bin/sh
#set -x
newline="
"
libpath="$PATH"

# is_relative <path>
#----------------------------------------------------------------------------
is_relative()
{
  case $1 in
    /*) return 1 ;;
    *) return 0
  esac
}

# is_triplet <name>
#----------------------------------------------------------------------------
is_triplet()
{
  case $1 in
    *-*-*) return 0 ;;
    *) return 1
  esac
}

# has_dir <path/file>
#----------------------------------------------------------------------------
has_dir()
{
  case $1 in
    */*) return 0 ;;
    *) return 1
  esac
}

# dir_part <path>
#----------------------------------------------------------------------------
dir_part()
{
  if has_dir "$1"; then
    echo "${1%/*}"
  fi
}

# name_part <path>
#----------------------------------------------------------------------------
name_part()
{
  if has_dir "$1"; then
    echo "${1##*/}"
  else
    echo "$1"
  fi
}

# my_path
#----------------------------------------------------------------------------
my_path()
{
  if test -z "$my_path"; then
    if ! has_dir "$0"; then
      my_path=$(find_in_path "$0")
    elif is_relative "$0"; then
      my_path="$(cd -- "${0%/*}" && pwd -P)/${0##*/}"
    else
      my_path="$0"
    fi
  fi
  echo "$my_path"
}

# my_name
#----------------------------------------------------------------------------
my_name()
{
  if test -z "$my_name"; then
    my_name=$(name_part "$0")
    case $my_name in
      ""|-*) my_name="ldd" ;;
    esac
  fi
  echo "$my_name"
}

# my_prefix
#----------------------------------------------------------------------------
my_prefix()
{
  if test -z "$my_prefix"; then
    local name=$(my_name)
    if test "$name" != "${name%-*}"; then
      my_prefix="${name%-*}"
    fi
  fi
  echo "$my_prefix"
}

# my_dir
#----------------------------------------------------------------------------
my_dir()
{
  if test -z "$my_dir"; then
    my_dir=$(dir_part "$(my_path)")
  fi
  echo "$my_dir"
}

# my_root
#----------------------------------------------------------------------------
my_root()
{
  if test -z "$my_root"; then
    my_root=$(my_dir)
    my_root=${my_root%/bin}
    my_root=${my_root%/sbin}
  fi
  echo "$my_root"
}

# my_triplet
#----------------------------------------------------------------------------
my_triplet()
{
  if test -z "$my_triplet"; then
    for my_triplet in "$(my_prefix)" "$(name_part "$(my_root)")"
    do
      if ! is_triplet "$triplet"; then
        unset my_triplet
      fi
    done
    test -z "$my_triplet" && my_triplet="i686-pc-mingw32"
  fi
  echo "$my_triplet"
}

# my_basedir
#----------------------------------------------------------------------------
my_basedir()
{
  if test -z "$my_basedir"; then
    my_basedir=$(my_root)
    my_basedir="${my_basedir%/$(my_triplet)}"
  fi
  echo "$my_basedir"
}

# my_hostdir
#----------------------------------------------------------------------------
my_hostdir()
{
  if test -z "$my_hostdir"; then
    echo "$(my_basedir)/$(my_triplet)"
  fi
  echo "$my_hostdir"
}

# find_in_path <file>
#----------------------------------------------------------------------------
find_in_path()
{
  local IFS=":;"
  
  for dir in $PATH
  do
    if test -f "$dir/$1"; then
      echo "$dir/$1"
      return 0
    fi
  done
  return 1
}

# pedump_value <file>
#----------------------------------------------------------------------------
pedump_run()
{
  local path=$(path_fix "$1")
  pedump "$path"
}

# pedump_value <file> <name>
#----------------------------------------------------------------------------
pedump_value()
{
  pedump_run "$1" | sed -n \
   "/^\s\+$2\s\s\+/ { s,^\s\+$2\s\s\+\([^\s].*\)$,\1, ;; s,\s\+, ,g ;; p }"
}

# pedump_imports <file>
#----------------------------------------------------------------------------
pedump_imports()
{
  pedump_run "$1" | sed -n \
   '/IMPORT MODULE DETAILS/ {
      :lp1
      n
      /^\s\+Import Module [0-9]\+:/ { s,^\s\+Import Module [0-9]\+: ,, ; p }
      b lp1
    }
    /^Imports Table/ {
      :lp2
      p
      n
      /^[_0-9A-Za-z]\+ table/ q
      b lp2
    }'
}

# objdump_base <file...>
#----------------------------------------------------------------------------
objdump_base()
{
  $objdump -p "$@" | grep -Pv '^(\t+|$)' | sed -n \
    '/^.\+:\s\+file format/ { s,:\s\+file format.*$,, ; h }
     /^ImageBase\s\+[0-9a-f]\+$/ { s,^ImageBase\s\+\([0-9a-f]\+\)$,(0x\1), ; x ; G ; s,\n, ,g ; p }'
}

# objdump_info <file...>
#----------------------------------------------------------------------------
objdump_info()
{
  $objdump -p "$@" 2>&1 | grep -Pv '^(\t+|$)' | sed -n \
    "/^.*'[^']\+': No such file/ { s,^.*'\([^']\+\)': No such file,\t\1 => not found, p }
     /^.\+:\s\+file format/ { s,^\(.*\)/\(.*\):\s\+file format.*$,\t\2 => \1/\2, ; h }
     /^ImageBase\s\+[0-9a-f]\+$/ { s,^ImageBase\s\+\([0-9a-f]\+\)$,(0x\1), ; x ; G ; s,\n, ,g ; p }"
}

# pedump_dlls <file>
#----------------------------------------------------------------------------
pedump_dlls()
{
  pedump_run "$1" | sed -n \
   '/IMPORT MODULE DETAILS/ {
      :lp1
      n
      /^\s\+Import Module [0-9]\+:\s\+/ { s,^\s\+Import Module [0-9]\+:\s*,, ;; s,\s*$,, ; p }
      b lp1
    }
    /^Imports Table/ {
      :lp
      /^\s\+offset\s\+[0-9A-Fa-f]\+\s\+/ s,^\s\+offset\s\+[0-9A-Fa-f]\+\s\+\([_0-9A-Za-z.]\+\)$,\1, p
      n
      /^[_0-9A-Za-z]\+ table/ q
      b lp
    }' | uniq
}

# pe_find <dll/exe...>
#----------------------------------------------------------------------------
pe_find()
{
  if test "${have_which-unset}" = "unset"; then
    ! which kernel32.dll >/dev/null 2>&1
    have_which=$?
  fi

  if test "$have_which" = "1"; then
    local IFS="$newline"  
    path_fix $(which "$@")
    return $?
  fi

  if test "${have_find-unset}" = "unset"; then
    ! find . -maxdepth 1 >/dev/null 2>&1
    have_find=$?
  fi

  local ifs="$IFS"
  local IFS=" $newline"
  local dir file clear=0 result ok
  
  for file in $*
  do
    if [ "$clear" = 0 ]; then
      set --
      clear=1
    fi

    IFS=";:"

#echo "searching file:" $file 1>&2
    ok=0

    for dir in $libpath
    do
      if test "$have_find" = 1; then
#        echo find "$dir" -maxdepth 1 -type f -iname $file 1>&2
        result=$(find "$dir" -maxdepth 1 -type f -iname $file)
        if test -n "$result"; then
          set -- "$@" "$result"
          ok=1
        fi
      else
        if [ -f "$dir/$file" ]; then
          set -- "$@" "$dir/$file"
          ok=1
        fi
      fi
    done
    
    if test "$ok" = 0; then
      set -- "$@" "$file"
    fi

    IFS="$ifs"
  done
  
#  echo "result: $@" 1>&2
  
  path_fix "$@"
}

# path_fix <path...>
#----------------------------------------------------------------------------
path_fix()
{
  local temp path drive do_cygpath=0
  
  for path in "$@"
  do
    case $path in
      /*)
        do_cygpath=1
        ;;
    esac
  done  
  
  if [ "$do_cygpath" = 1 ] && cygpath -m "$@" 2>/dev/null; then
#    cygpath -m "$@"
    return $?
  fi
  
  for path in "$@"
  do
    case $path in
      /cygdrive/*)
        temp=${1#/cygdrive/}
        path=${temp#[A-Za-z]}
        drive=${temp%"$path"}
        echo "$drive:$path"
        ;;
      *)
        echo "$path"
        ;;
    esac
  done
}

# hex_tolower <string>
#----------------------------------------------------------------------------
hex_tolower()
{
  local str="$*"
  
  str=${str//A/a}
  str=${str//B/b}
  str=${str//C/c}
  str=${str//D/d}
  str=${str//E/e}
  str=${str//F/f}
  
  echo "$str"
}

#----------------------------------------------------------------------------
main()
{
  local IFS
  
  for file in "$@"
  do
    dlls=$(pedump_dlls "$file")
    
    IFS="$newline"
    
#    echo "$(path_fix $file):"
    objdump_info $(pe_find $dlls)
#    for dll in $dlls
#    do
#      if ! dllpath=$(pe_find "$dll"); then
#        dllinfo="not found"
#      else
#        dllinfo=$(objdump_base "$dllpath")
#        dllbase=$(pedump_value "$dllpath" "image base")
#        dllinfo="$dllpath ($(hex_tolower ${dllbase%% *}))"
#      fi
      
#      echo -e "\t$dll => $dllinfo"
#    done
  done
}

#----------------------------------------------------------------------------
#my_path=$(my_path)
#my_name=$(my_name)
#my_prefix=$(my_prefix)
#my_dir=$(my_dir)
#my_root=$(my_root)
#my_triplet=$(my_triplet)
#my_basedir=$(my_basedir)
#my_hostdir=$(my_hostdir)


libpath="$(my_hostdir)/bin:$(my_hostdir)/lib:$libpath"
objdump="$(my_triplet)-objdump"

main "$@"

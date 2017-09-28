#!/bin/bash
#
# -*-mode: shell-script-*-
#
# apt-admin
#
# Copyright (c) 2008 Roman Senn <rs@adfinis.com>
# All rights reserved.
# 
# $Id: default@license.inc,v 1.1.1.1 2003/04/09 13:55:15 alane Exp $
#
# 2008-06-24 enki <rs@adfinis.com>
#
#
# Set any required directories not yet defined
# --------------------------------------------------------------------------- 
: ${prefix="/usr"}
: ${bindir="$prefix/bin"}
: ${libdir="$prefix/lib"}
: ${shlibdir="$libdir/sh"}

# Load script dependencies
# ---------------------------------------------------------------------------
. $shlibdir/distrib.sh
. $shlibdir/util.sh
. $shlibdir/net/ssh.sh
. $shlibdir/shell/cmd.sh

# Parse command line options using shflags 
# ---------------------------------------------------------------------------
. shflags

DEFINE_boolean debug false                      "enable debug mode" d
DEFINE_boolean force false                      "force overwriting" f
DEFINE_string user "root"                       "repository admin user" u
DEFINE_string host "apt.`hostname -d`"          "repository remote host" h
DEFINE_string root /local/packages              "repository base path" p
DEFINE_string dist "`distrib_detect`"           "target distribution" t
DEFINE_string codename "`distrib_get codename`" "target codename" n
DEFINE_string component "*"                     "target component" c

FLAGS_HELP="usage: `basename "$0"` [flags] command [arguments...]
commands:
  help                 shows this help
  generate             generates the repository info
  list [PATTERN...]    lists the matching packages
  remove PATTERN[...]  removes the matching packages
"
FLAGS "$@" || exit 1; shift ${FLAGS_ARGC}

# Check for arguments
# ---------------------------------------------------------------------------
if [ $# -eq 0 ]; then
  echo "error: command missing" >&2
  flags_help
  exit 1
fi

# ---------------------------------------------------------------------------
repository_init()
{
  REPOSITORY_login=${FLAGS_user:+$FLAGS_user@}$FLAGS_host
  REPOSITORY_dir=$FLAGS_root/$FLAGS_dist-$FLAGS_codename
  REPOSITORY_component=${FLAGS_comp:-*}
  REPOSITORY_script="/local/system/bin/wonko01/generate-pkg-index.sh"
  REPOSITORY_gpgkey="/local/system/keys/gpg/software-deployment.gpg"
}

# find_patterns <regular-expressions...>
# 
# Generates -wholename PATTERN arguments combined with -or for listing 
# packages using find(1).
# ---------------------------------------------------------------------------
find_patterns()
{
  while 
    echo "-wholename '`regexp_to_fnmatch "$1"`_*.deb'"; \
    shift; [ "$#" -gt 0 ]
  do
    echo "-or"
  done
}

# get_packages <fnmatch-patterns...>
# 
# Generates -wholename PATTERN arguments combined with -or for listing 
# packages using find(1).
# ---------------------------------------------------------------------------
get_packages()
{
 (IFS=" "
  cmd_exec "cd '$REPOSITORY_dir' && find * -type f $* | sort -u" \
    ${FLAGS_host:+"${FLAGS_user:+$FLAGS_user@}$FLAGS_host"})
}

# repository_sign
# 
# Signs the current repository state using the software deployment key.
# ---------------------------------------------------------------------------
repository_sign()
{
 (RELEASE=$FLAGS_codename/Release
  
  IFS=" "

  cmd_exec \
    "id=\`gpg '${MOUNT:+$MOUNT/}$REPOSITORY_gpgkey' | sed -n '/^sec\s/ s|^sec\s\+[^\s]\+/\([0-9A-F]\+\).*$|\1|p'\`
     echo 'Secret key ID:' \$id
     gpg --import '${MOUNT:+$MOUNT/}$REPOSITORY_gpgkey'
     cd '${MOUNT:+$MOUNT/}$REPOSITORY_dir/dists'
     gpg -ba -o '$RELEASE.gpg' '$RELEASE'" ${REPOSITORY_login:+"$REPOSITORY_login"} || 
  warn "Failed signing $RELEASE")
}

# main <subcommand> [options] [arguments...]
# 
# The main routine of the apt-admin script.
: ---------------------------------------------------------------------------
repository_init

COMMAND=$1; shift

case "$COMMAND" in  

  # help <subcommand>
  #
  # shows help about the requested command
  help)
    case $1 in
      list) 
        echo "$2: List either all packages in the repository or the" \
             "packages matching the specified pattern.${IFS}usage: list [PATTERN...]" 
      ;;
     
      remove | delete) 
        echo "$2: Removes the packages matching the given" \
             "expression.${IFS}usage: $2 <PATTERN...>"
      ;;

      "") 
        flags_help
      ;;

      *) 
        echo "\"$2\": unknown command." 1>&2
      ;;
    esac
  ;;

  # dump <dists|packages>
  #
  # Dumps repository state information
  dump)
    DUMP_COMMAND="cd '$REPOSITORY_dir' && find '$FLAGS_dist' -type f"
    DUMP_MASK= DUMP_FILTER=

    case $1 in
      [Rr]elease) DUMP_MASK="^\(.*/Release\).*" ;;
      [Pp]ackages) DUMP_MASK="^\(.*/Packages\).*" ;;
      deb | dsc) DUMP_MASK="^\(.*\.$1\)\$" ;;
      *) error "No such entity: $1" ;;
    esac; shift

    IFS='|'

    if [ -n "$DUMP_MASK" ]; then
      pushv DUMP_FILTER "sed -n 's!$DUMP_MASK!\1!p'"
    fi
   
    case $DUMP_MASK in
      *\$) ;; *) 
        pushv DUMP_FILTER "sed -u 's/\.bz2$//'" 
        pushv DUMP_FILTER "sed -u 's/\.gz$//'"
        pushv DUMP_FILTER "uniq"
      ;;
    esac

    cmd_exec "${DUMP_COMMAND}${DUMP_FILTER}" ${REPOSITORY_login:+"$REPOSITORY_login"}
  ;;

  # list [options] reg-exp [reg-exp...]
  #
  #
  list)
    FILTER=

    while test "$#" -gt 0; do
      case $1 in
        nopath) 
          IFS="|" pushv FILTER 'sed s:.*/::' 
        ;;

        name) 
          IFS="|" pushv FILTER 'sed s:_[^/]*\$::' 
        ;;

        source)
          FILTER='|while read pkg; do dpkg --info "$pkg" control; done | sed -n "s/^Source: //p"'
          
          # Hack, because some adfinis packages are broken
          IFS="|" pushv FILTER 'sed s,Priority:\\s.*,,'
        ;;

        all)
          FLAGS_dist=*
        ;;

        *)
          FLAGS_dist=$1
        ;;
      esac
      shift
    done
    
    set -- `find_patterns "$@"`
    
    LISTCMD="cd '$FLAGS_root' && find $FLAGS_dist-$FLAGS_codename -type f $*"

    msg "Executing: ${LISTCMD}${FILTER:+|$FILTER}"

    cmd_exec "${LISTCMD}${FILTER}" ${REPOSITORY_login:+"$REPOSITORY_login"}
  ;;

  # remove|delete <regular-expressions...>
  remove|del*)

    set -- `find_patterns "$@"`
    set -- `get_packages "$@"`

    if [ "$#" -gt 0 ]; then
     (IFS="
";    echo "$*"

      read -e -p'Really remove those packages? [y/N] ' confirm

      pkgs=`IFS=" 
" && echo "$*"`

      case $confirm in
        [YyJj]*)
          cmd="cd '$REPOSITORY_dir' && set -x && rm -vf -- $pkgs"

          cmd_exec "$cmd"  ${REPOSITORY_login:+"$REPOSITORY_login"}
        ;;
      esac)
    fi


  ;;
    
  # generate repository
  #
  # 
  gen*|regen*)
    cmd_exec "cd '$REPOSITORY_dir' && '$REPOSITORY_script'" ${REPOSITORY_login:+"$REPOSITORY_login"}
    
    MOUNT="/mnt/wonko01" REPOSITORY_login= \
    repository_sign
  ;;


  make*)
    MOUNT="/mnt/wonko01" REPOSITORY_login= \
      repository_make
  ;;

  *)
    exec "$0" --help
  ;;
esac

# Execute the final command
if [ -n "$cmd" ]; then
  cmd_exec "$cmd" ${FLAGS_host:+"$FLAGS_host"} || 
  warn "The command-line $cmd${FLAGS_host:+ on $FLAGS_host} failed (exitcode=$?)"
fi

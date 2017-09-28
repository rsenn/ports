#!/bin/sh
#
# mount.fusecompress: mount wrapper around fusecompress.

# Initialize variables
OPTS= ARGS= FILTER= HELP="false" IFS="
"

# push <variable-name> <tokens...>
#
# Adds one or more tokens separated by ${IFS:0:1} to the specified variable.
push()
{
  local vn="$1"
  shift
  eval $vn'="${'$vn':+$'$vn'$IFS}$*"'
}

# Parse arguments
while test "$#" -gt 0
do
  case "$1" in
    -o)
      push OPTS "$1" "$2"
      shift
      ;;

    -o*)
      push OPTS "-o" "${1#-o}"
      ;;

    -*)
      push OPTS "$1"

      case $1 in
        -h | --help)
          HELP=true
          ;;
      esac
      ;;
       
    *)
      push ARGS "$1"
      ;;
  esac
  shift
done

set -- $ARGS

# Must have 2 arguments now
if test "$#" != 2
then
  echo "Error: need device and mountpoint" 1>&2
  set --
  OPTS="--help"
  HELP=true
fi

# Filter the help message
#if "$HELP"
#then
  FILTER=" 2>&1 | sed '1s,\(Usage:\) \([^ ]\+\),\1 ${0##*/} dummy,' 1>&2"
#fi

# Substitute \s within options
OPTS=$(echo "$OPTS" | sed "s,\\\\s, ,g")

# Append options to arguments
set -- "$@" $OPTS

# Execute fusecompress binary
eval "exec fusecompress \"\$@\"${FILTER}"

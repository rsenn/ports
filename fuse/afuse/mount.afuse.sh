#!/bin/sh
#
# mount.afuse: mount wrapper around afuse.

# Initialize variables
OPTS= ARGS= FILTER= HELP="false" DEBUG="false" IFS="
"

# pushv <variable-name> <tokens...>
#
# Adds one or more tokens separated by ${IFS:0:1} to the specified variable.
pushv()
{
  local vn="$1"
  shift
  eval $vn'="${'$vn':+$'$vn'$IFS}$*"'
}

# Parse arguments
while test "$#" -gt 0; do
  case "$1" in
    -o)
      pushv OPTS "$2"
      shift
    ;;
    -o*)
      pushv OPTS "${1#-o}"
    ;;
    -*)
      pushv OPTS "$1"

      case $1 in
        -h | --help)
          HELP=true
          ;;
      esac
    ;;       
    *)
      pushv ARGS "$1"
    ;;
  esac
  shift
done

set -- $ARGS

# Must have 2 arguments now
if test "$#" != 2; then
  echo "Error: need device and mountpoint" 1>&2
  set --
  OPTS="--help"
  HELP=true
else
  shift
fi

# Filter the help message
#if "$HELP"
#then
  FILTER="sed
1s,\(Usage:\) \([^ ]\+\),\1 ${0##*/} dummy,"
#fi

# Substitute \s within options and remove the "user" option
OPTS=`echo "$OPTS" | sed -e 's,\\s, ,g ;; s,\\\s, ,g ;; s,\\\\s, ,g' | sed -e "s/^user,//" -e "s/,user,/,/g" -e "s/,user\$//"`

case $OPTS in
  debug,* | *,debug,* | *,debug)
    DEBUG="true"
  ;;
esac

# Append options to arguments
set -- "$@" -o "$OPTS"

# Execute afuse binary
if $DEBUG; then
  PS4="Executing: "
fi

$DEBUG && set -x

exec afuse "$@" 2>&1 | $FILTER 1>&2



eval "$DEBUG && set -x; exec afuse \"\$@\"${FILTER} 2>&1"

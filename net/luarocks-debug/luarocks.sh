alias luarocks=_luarocks

_luarocks() {
 ([ "$DEBUG" ] && set -x; unset CMD OPTS FILTER
  while [ $# -gt 0 ]; do
    case "$1" in
      -*) OPTS="${OPTS:+$OPTS
}$1" ; shift ;;
      *) CMD="$1"; shift; break ;;
    esac
  done
  case "$CMD" in
    search)  FILTER="${FILTER:+$FILTER ;; } /^[-=\\s]\+\$/d ;; /^\$/d ;; /^   [^ ]/d ;; /Search results for/d ;; /Rockspecs and source rocks:/d"    ;;
  esac
  while [ $# -gt 0 ]; do
    case "$1" in
      -*) OPTS="${OPTS:+$OPTS
}$1" ; shift ;;
      *) break ;;
    esac
  done
  set +x
[ $# -gt 0 ] ||  set -- ""
  for ARG; do 
    eval "(echo 'Searching $ARG ...' 1>&2 ; set -x; command luarocks \$CMD \$OPTS \$ARG${FILTER:+ | sed -e '$FILTER'}) || exit \$?"
  done)
}

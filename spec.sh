#!/bin/sh
#
# ports/spec.sh: spec file (RPM) port abstraction
#
# $Id: spec.in 700 2007-04-19 21:00:17Z  $
# -------------------------------------------------------------------------
test $lib_spec_sh || {

# spec_header <spec-file>
#
# Gets header info from a .spec file.
# -------------------------------------------------------------------------
spec_header()
{
  sed -n \
      -e "/^%define/d" \
      -e "/^[^ ]\+: /p" \
      -e "/^%/q" \
    "$1"
}

# spec_get <spec-file> <key>
#
# Gets a value from a .spec file.
# -------------------------------------------------------------------------
spec_get()
{
  sed -n \
      -e "/^%$2\$/ {
        n
        :lp
        N
        /\n%.\+\$/! b lp
        s/^%.\+\$//
        s/\n%.\+\$//
        p
      }" \
    "$1"
}

# --- eof ---------------------------------------------------------------------
}
lib_spec_sh=1

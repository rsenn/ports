#!/bin/bash
#
# -*-mode: shell-script-*-
#
# ports2csv.bash
#
# Copyright (c) 2008  <enki@vinylz>.
# All rights reserved.
# 
# $Id: default@license.inc,v 1.1.1.1 2003/04/09 13:55:15 alane Exp $
#
#
# 2008-10-01  <enki@vinylz>
#

# provide default values for the required path variables.
# --------------------------------------------------------------------------- 
: ${prefix="/usr"}
: ${libdir="$prefix/lib"}
: ${shlibdir="$libdir/sh"}

# source required scripts
# --------------------------------------------------------------------------- 
. $shlibdir/util.sh
. $shlibdir/port.sh
. $shlibdir/std/algorithm.sh
. $shlibdir/shell/bash.sh

. /etc/pkgmk.conf.d/layout.conf
. /etc/pkgmk.conf.d/libtool.conf
. /etc/pkgmk.conf.d/mirrors.conf
. /etc/pkgmk.conf.d/toolchain.conf

# --------------------------------------------------------------------------- 
CSV_fields=(name category version description maintainer source build)

# Main program
# --------------------------------------------------------------------------- 
main()
{
  bash_enable csv

  port_list | {

    IFS="
"
    csv ${CSV_fields[@]}
    
    while read port; do
     
      set --
     
      for field in ${CSV_fields[@]}; do
        set -- "$@" "`port_get $port $field`"
      done
      
      csv "$@"
    done
  }
}

# ---------------------------------------------------------------------------
main "$@"

# ---[ EOF ]-----------------------------------------------------------------


#EOF

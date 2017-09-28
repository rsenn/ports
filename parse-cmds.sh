#!/bin/bash
# -*-mode: shell-script-*-
#
# parse-cmds.sh
#
# Copyright (c) 2008 root <root@phalanx>.
# All rights reserved.
# 
# $Id: default@license.inc,v 1.1.1.1 2003/04/09 13:55:15 alane Exp $
#
#
# 2008-07-15 root <root@phalanx>
#

: ${prefix="/usr"}
: ${libdir="$prefix/lib"}
: ${shlibdir="$libdir/sh"}

. $shlibdir/util.sh
. $shlibdir/port.sh
. $shlibdir/devel/compiler.sh
. $shlibdir/devel/toolchain/gcc.sh

for arg; do
  id=$(port_id "$arg")
  pd=$(port_dir "$arg")
  
  while IFS=$' \t\n' && read cmd at dir colon args
  do
    set -- $args

    cmd=$1
    shift

    case ${cmd##*/} in
      gcc | g++)
      
        IFS=" " gcc_parse "$@"
      
        IFS=$'\t'

        gcc_serialize

        echo $(obj_s=$'\t' gcc_obj)
        
      
        ;;
    esac
  done <$pd/.cmds
  

done


#EOF

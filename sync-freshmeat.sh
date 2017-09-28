#!/bin/bash
# -*-mode: shell-script-*-
#
# sync-freshmeat.sh
#
# Copyright (c) 2008 root <root@phalanx>.
# All rights reserved.
# 
# $Id: default@license.inc,v 1.1.1.1 2003/04/09 13:55:15 alane Exp $
#
#
# 2008-07-29 root <root@phalanx>
#

: ${prefix="/usr"}
: ${libdir="$prefix/lib"}
: ${shlibdir="$libdir/sh"}

source $shlibdir/util.sh

require "port"
require "web/freshmeat"

# --------------------------------------------------------------------------- 
main()
{
  port_list | while read p
  do 
    if ! test -f "$portsdir/$p/freshmeat.xml"
    then
  
      xml=$(freshmeat_xml "${p##*/}")
    
      if test -n "$xml"; then

        echo "$xml" >$p/freshmeat.xml
        echo "$p"

      fi
    fi
  done  
}

main "@"

#EOF

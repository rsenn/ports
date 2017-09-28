#!/bin/bash
# -*-mode: shell-script-*-
#
# update-sourceforge.sh
#
# Copyright (c) 2008 root <root@phalanx>.
# All rights reserved.
# 
# $Id: default@license.inc,v 1.1.1.1 2003/04/09 13:55:15 alane Exp $
#
#
# 2008-07-01 root <root@phalanx>
#

: ${prefix="/usr"}
: ${libdir="$prefix/lib"}
: ${shlibdir="$libdir/sh"}

source $shlibdir/util.sh
source $shlibdir/web/sourceforge.sh

grep -E '(sourceforge\.net|$sf_mirror)' */*/Pkgfile |
sed -n \
    -e '\,/sourceforge/, s,^\(.*\)/Pkgfile.*/sourceforge/\([^/]\+\)/.*,\1: \2,p'


#EOF

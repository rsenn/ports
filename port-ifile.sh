#!/bin/sh
#
# -*-mode: shell-script-*-
#
# ifile-ports.sh
#
# Copyright (c) 2008 Roman Senn,,, <roman@phalanx>.
# All rights reserved.
# 
# $Id: default@license.inc,v 1.1.1.1 2003/04/09 13:55:15 alane Exp $
#
#
# 2008-08-22 Roman Senn,,, <roman@phalanx>
#

# set path variable defaults
# --------------------------------------------------------------------------- 
: ${prefix="/usr"}
: ${libdir="$prefix/lib"}
: ${shlibdir="$libdir/sh"}

# --------------------------------------------------------------------------- 
IFILE_data=~/ports/.idata
IFILE_verbosity=2

# include library modules
# --------------------------------------------------------------------------- 
. $shlibdir/util.sh

# ifile_run
# --------------------------------------------------------------------------- 
ifile_run()
{
  ifile -g --db-file="$IFILE_data" --verbosity="${IFILE_verbosity:-0}" "$@"
}

# ifile_learn <folder> [input-files...]
# --------------------------------------------------------------------------- 
ifile_learn()
{
  ifile_run "$@"
}

# Main program
# --------------------------------------------------------------------------- 
main()
{
   ifile_learn "$@"  
}

main "$@"

#EOF

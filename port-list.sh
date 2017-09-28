#!/bin/bash
exec 2>/dev/null

find ${@:-*} -maxdepth 2 -mindepth 2 -type f -name Pkgfile |
while read pf; do
  (dir=${pf%/*}
  
   cd "$dir"
  
   . Pkgfile
  
   echo ${pf}

#   if test -f .md5sum || test -f .footprint ]
#   then
#     echo ${dir}/.footprint
#   fi
  
   for src in ${source[@]}; do
     case ${src} in
       */*) ;;
       *)
         echo ${dir}/${src}
       ;;
     esac     
   done)   
done

for script in *.sh; do
  echo "$script"
done

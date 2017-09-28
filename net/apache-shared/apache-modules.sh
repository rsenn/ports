#!/bin/sh
: ${prefix="/usr/local"}
: ${template="$prefix/share/apache/Configuration.tmpl"}

get_description()
{
  sed -n ":lp /^##/! { d; n; b lp }
          :ok
          s,##[ \t]*,# ,g
          N
          /\n$/ {
            N
            /AddModule.*$1.*\.[ao]/ {
              s,[ \t]*\n,\n,g
              s,\n\n,\n,g
              s,\n[ \t]*#*[ \t]*AddModule.*,\n,
              p
              q
            }
          }
          /##/ { b ok }
          d; n; b lp          
          " \
    ${template}
}

get_module_order()
{
  sed -n "/^[ \t]*#*[ \t]*AddModule/ { 
            s,^[ \t]*#*[ \t]*AddModule[ \t]*.*/\(.\+\)\.[ao]$,\1,
#            s,^mod_,,
#            s,^lib,,
            p
          }" \
    ${template}
}

get_comment()
{
  sed -n "/^[ \t]*#*[ \t]*AddModule.*$1\.[ao]/ {
    s,^[ \t]*\(#*\).*,\1, p; q; 
  }" \
  ${template}
}

get_module_dir()
{
  (cd $prefix/lib/apache
   echo *.so | sed 's,\.so,,g')
}

isin()
{
  local what=$1
  shift
  for x
  do
    if [ $x = $what ]; then
      return 0
    fi
  done
  
  return 1
}

symbol()
{
  objdump -T "$1" | \
    sed -n '/DO[ \t]\+\.data[ \t]\+.*Base[ \t]\+[0-9a-z_]\+_module$/ { s,.*[ \t]\+\([0-9a-z_]\+_module\).*,\1, p; q }'
}

print_module()
{
  local file=$prefix/lib/apache/$1.so

  if [ ! -f "$file" ]; then
    
    echo "WARNING: $1 not found!" 1>&2
    return 1
#    local name=$1
#    local src=$1
#    local desc=$(get_description ${src%.c})
  else
    local name=$(symbol "$file")
    local src=$(strings "$file" | sed -n '/mod_[0-9a-z_]\+\.c$/ { p;q }')
    local desc=${2-$(get_description ${src%.c})}
    local cmt=$(get_comment ${src%.c})
  fi


#  echo $src

  if [ $name = example_module ]; then
    continue
  fi
         
  if [ "${desc}" ]; then
  
    $first || echo
    first=false
    echo "${desc}"
    
    if [ -f "$file" ]; then
      echo
    fi
  fi
  
  if [ -f "$file" ]; then
    printf "${cmt}LoadModule %-20s ${file#$prefix/}\n" "${name}"
  fi
#  printf "AddModule ${source##*/}\n\n"
}

#echo "$(get_description 'ssl')"
#exit 0

module_order=$(get_module_order)
module_dir=$(get_module_dir)

#echo $module_order
#echo $module_dir
#exit 0
first=true

for module in ${module_order}
do
  print_module ${module}
done

echo "#"
echo "# 3rd party modules"
echo "#"

#for module in ${module_dir}
#do
#  if isin ${module} ${module_order}; then
#    continue
#  fi
#
#  print_module ${module} ""
#done



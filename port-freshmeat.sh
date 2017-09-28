#!/bin/sh
#
# -*-mode: shell-script-*-
#
# port-freshmeat.sh
#
# Copyright (c) 2008 Roman Senn <rs@adfinis.com>
# All rights reserved.
# 
# $Id: default@license.inc,v 1.1.1.1 2003/04/09 13:55:15 alane Exp $
#
# This script tries to construct a working software port
# using the info taken from a freshmeat.net project.
#
# 2008-06-24 Roman Senn <rs@adfinis.com>
#

# load the libswsh utility functions
# -------------------------------------------------------------------------
. /usr/lib/sh/util.sh

# load the require libswsh modules
# -------------------------------------------------------------------------
require array
require port
require var
require str
require web/freshmeat
require web/sourceforge
require net/url
require net/www

# detect_source <package-url> <homepage-url>
#
# Detect the real source package URL for the given freshmeat URL
# -------------------------------------------------------------------------
detect_source()
{
  local project pkg service links IFS="
"

  if [ -z "$1" ]; then
    for service in `fs_list "$shlibdir/web"`; do
      :
    done
  fi
  
  set -- $1

  while [ "$#" -gt 0 ] && pkg=$1; do
    case $pkg in 
      *[!0-9]$version[!0-9]*) 
        msg "Found matching version download: $version $pkg"
        echo "$pkg"
        return 0
      ;;
#      *.tar* | *.zip)
#        echo "$pkg"
#        return 0
#      ;;
      */)
        links=`www_links "$pkg" | grep "$pkg[_0-9A-Za-z]"`
     #   links=`reverse $links`
        #msg "Links:" $links

        set -- "$@" $links
        shift
        continue 
      ;;
    esac
    
    # It could be a sourceforge hosted project
    if project=`sourceforge_project "$pkg"` && [ -n "$project" ]; then
      #sourceforge_url "$project" download
      files=`sourceforge_files "$project"`
      
      if file=`echo "$files" | grep "$version"` && [ -n "$file" ]; then
        msg "Found matching version download: $version ${file##*/}"
        echo "$file" | grep -vE '\.(rpm|deb)$'
      else
        echo "$files" | tail -n1
      fi
      
      return 0
#    else
#      echo "$pkg"
#      return 0
    fi
    shift
  done
}

# main routine
# -------------------------------------------------------------------------
main()
{
  local opts args IFS="
"
  while [ "$#" -gt 0 ]; do
    case $1 in 
      *=*) local "$1" ;;
      -*) pushv opts "$1" ;;
      *) pushv args "$1" ;;
    esac
    shift
  done
  
  name=$(index 0 $args)
 

  # determine the package category
  if var_empty category; then
    # it can also be specified as section=
    if var_isset section; then
      category="$section"
    else
      # When the package name is a category/name pair 
      # we can take it from there
      case $name in
        */*)
          IFS="/"; str_split "$name" category name; IFS="
"
          ;;

        *)
          categories=$(freshmeat_categories "$name")

          error "No category has been specified.
Use either a category/name pair for the package,
or specify category=<name> as an argument.
            $categories"
          ;;
      esac
    fi
  fi
  
  # remove category from package name
  name=${name##*/}
  
  #freshmeat_cache "$name"

  # download metainfo from freshmeat.net
  #xml=$(freshmeat_xml "$name")
  description=`freshmeat_description "$name"`
  
  if var_empty description; then
    error "The project $name cannot be found on freshmeat.net/projects"
  fi

  var_dump description

  # determine the package description
  if [ -z "$description" ]; then
    description=$(freshmeat_description "$name")
    msg "Fetching description:" $description
  fi

  # determine the source package(s)
  if var_empty source; then
    packages=$(freshmeat_url "$name" bz2 tgz zip)
    
  fi

  # determine the homepage url
  if var_empty url; then
    url=$(freshmeat_url "$name" homepage)
  fi

  # determine the version
  if var_empty version; then
    version=$(freshmeat_get "$name" latest_release_version)
  fi

  # Create the port
   var_dump verbosity description
  
  if [ -z "$packages" ]; then
    packages=$(dlynx "$(freshmeat_url "$name")" | grep -i "/$name[^/]*\$")
  fi
  
#  msg "Packages:" $packages  
  msg "IFS: \"$IFS\""

  sourcepkg=$(detect_source "$packages" "$url")
 
  msg "Source packages:" $sourcepkg

  case $sourcepkg in
    *$version*) ;;
    *) unset version ;;
  esac
 
  if [ -z "$source" ]; then
    source="$sourcepkg"
  fi

  set -- port_create "$category/$name" \
    source="$source" \
    ${version+version="$version"} \
    description="$description" \
    url="$url"

   msg "${0##*/}: $@"
   "$@" 
}

# -------------------------------------------------------------------------
verbosity=1

main "$@"

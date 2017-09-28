#!/bin/sh
#
# -*-mode: shell-script-*-
#
# port-cpan.sh
#
# Copyright (c) 2008 Roman Senn <rs@adfinis.com>
# All rights reserved.
# 
# $Id: default@license.inc,v 1.1.1.1 2003/04/09 13:55:15 alane Exp $
#
# This script tries to construct a working software port
# using the info taken from a cpan.net project.
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
require net/url
require net/www

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
      # Whecient Reading/Writing of Complete Files  n the package name is a category/name pair 
      # we can take it from there
      case $name in
        */*)
          IFS="/"; str_split "$name" category name; IFS="
"
          ;;

        *)
          categories=$(cpan_categories "$name")

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
  
  cpan_cache "$name"

  # download metainfo from cpan.net
  xml=$(cpan_xml "$name")
  
  if var_empty xml; then
    error "The project $name cannot be found on cpan.net/projects"
  fi

  var_dump description

  # determine the package description
  if [ -z "$description" ]; then
    description=$(cpan_description "$name")
    msg "Fetching description:" $description
  fi

  # determine the source package(s)
  if var_empty source; then
    packages=$(cpan_url "$name" bz2 tgz zip)
    
  fi

  # determine the homepage url
  if var_empty url; then
    url=$(cpan_url "$name" homepage)
  fi

  # determine the version
  if var_empty version; then
    version=$(cpan_get "$name" latest_release_version)
  fi

  # Create the port
   var_dump verbosity description
  
  if [ -z "$packages" ]; then
    packages=$(dlynx "$(cpan_url "$name")" | grep -i "/$name[^/]*\$")
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

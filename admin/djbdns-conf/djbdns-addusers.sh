#!/bin/bash

# djbdns users/group
# -------------------------------------------------------------------------
. /usr/share/djbdns-conf/conf

: ${adminUSER="dnsadmin"}
: ${tinydnsUSER="tinydns"}
: ${cacheUSER="dnscache"}
: ${axfrUSER="axfrdns"}
: ${wallUSER="dnswall"}
: ${logUSER="dnslog"}

# System user/group files
# -------------------------------------------------------------------------
group_file="/etc/group"
user_file="/etc/passwd"

# Checks whether a group exists
# ------------------------------------------------------------------------- 
group_exists()
{
  grep -q "^$1:" ${group_file}
}

# Outputs a list of gids
# ------------------------------------------------------------------------- 
group_gids()
{
  sed -n 's,^[^:]*:[^:]*:\([0-9]\+\):.*$,\1,p' ${group_file} | sort -n
}

# Outputs a list of uids
# ------------------------------------------------------------------------- 
user_uids()
{
  sed -n 's,^.*:\([0-9]\+\):[0-9]\+:.*$,\1,p' ${user_file} | sort -n
}

# Checks whether a user exists
# ------------------------------------------------------------------------- 
user_exists()
{
  grep -q "^$1:" ${user_file}
}

# Get the lowest available uid starting from start (defaults to 0).
# -------------------------------------------------------------------------
user_lowuid()
{
  local uid start=${1-0} previous=0 IFS="
"
  set -- $(user_uids)

  if test $((start - 1)) -ge 0
  then
    previous=$((start - 1))

    while test "$1" -lt $((previous))
    do
      shift
    done
  fi

  for uid
  do
    # got available uids between last entry and this one?
    if test $((previous + 1)) -lt ${uid}
    then
      echo $((previous + 1))
      return 0
    fi
  
    previous=${uid}
  done
  # did not find an available uid inbetween
  echo $((uid + 1))
  return 1
}

# Get the lowest available uid-gid pair
# -------------------------------------------------------------------------
user_lowuidgid()
{
  local uid previous=0 start=${1-0} IFS="
"
  set -- $( { user_uids && group_gids; } | sort -u -n )
          
  if test $((start - 1)) -ge 0
  then
    previous=$((start - 1))

    while test "$1" -lt $((previous))
    do
      shift
    done
  fi

  for uidgid
  do
    # got available uids between last entry and this one?
    if test $((previous + 1)) -lt $((uidgid))
    then
      echo $((previous + 1))
      return 0
    fi
    previous=${uidgid}
  done

  # did not find an available uid inbetween
  echo $((uidgid + 1))

  return 1
}

# Clean up users
# -------------------------------------------------------------------------
for u in $user $sysuser
do
  if user_exists "$u"
  then
    (set -x && userdel "$u" 2>/dev/null)
  fi
done

# Clean up group
# -------------------------------------------------------------------------
if group_exists "$group"
then
  (set -x && groupdel "$group" 2>/dev/null)
fi

# Finally create the users and the group
# -------------------------------------------------------------------------
(
  for class in admin tinydns cache axfr wall log
  do
    eval user='${'$class'USER}'
    eval group='${'$class'GROUP}'
    eval home='${'$class'HOME}'
    eval shell='${'$class'SHELL}'
    
    test -n "$group" || group="$user"
    test -n "$home" || home="/nonexistent"
    test -n "$shell" || shell="/bin/false"

    if ! user_exists "$user"
    then
      uid=$(user_lowuid)
    
      if ! group_exists "$group"
      then
        # Determine uid/gid
        uidgid=$(user_lowuidgid)

        groupadd -g"$uidgid" "$group" && 
        echo "Created group $group ($uidgid)" 1>&2
        
        uid=$uidgid
      fi
      
      useradd -g"$group" -u"$uid" -d"$home" -s"$shell" "$user" &&
      echo "Created user $user ($uid)" 1>&2
      
      if test "$home" != "/nonexistent"
      then
        mkdir -p "$home" &&
        chown "$user:$group" "$home" &&
        echo "Created home directory $home for $user:$group" 1>&2
      fi
    fi
  done
)

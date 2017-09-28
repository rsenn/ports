# visual.sh: pager and editor preferences

# Checks if the specified executable exists within one of the directories in PATH
chkbin()
{
  local IFS=: dir

  for dir in $PATH
  do
    test -e $dir/$1 || return $?
  done
}

# Global default preferences..
EDITOR='nano'
PAGER='more'

# Decide which editor to use
for cmd in jed nano pico vim vi emacs ed
do
  if chkbin "$cmd"
  then
    EDITOR="$cmd"
    break
  fi
done
unset -v cmd

# Decide which pager to use
for cmd in less more cat
do
  if chkbin "$cmd"
  then
    PAGER="$cmd"
    break
  fi
done

# Special setting for the "less" pager, so it will process escape sequences.
LESS="-R"

# Finally export the settings and unset the chkbin() function
export EDITOR PAGER LESS
unset -f chkbin

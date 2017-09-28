# umask.sh: user file creation mask configuration

# By default, we want this to get set. Even for non-interactive, non-login shells.
if test $UID -gt 99 && test "id -gn" = "id -un"
then
  umask 002
else
  umask 022
fi

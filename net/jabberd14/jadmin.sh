#!/bin/bash
#
# Jadmin - Jabber administrator Script V1.0
#
# Copyright adfinis GmbH 2008
# Author: Christian Schläppi
#----------------------------------------------------------------

# Usage - giving some help
usage()
{
 echo "Jadmin version 1.0 help

${0##*/} -OPTION EXPRESSION1 EXPRESSION2

Available options:
	-h	print this Help
	-a	add a Jabber user (${0##*/} -a USER [PASSWORD])
	-L	list users
 	-d	deletes user"
exit 2

}
#----------------------------------------------------------------

# adding a user
add_user()
{
mkdir -p "$WORKINGDIR"

# generating necessary output
USER=$WORKINGDIR$2.xml
PASSWD=$3

if test -z "$3"
then
  read -p "Enter password: " -s PASSWD
  echo
fi
echo -e "Enter name: \c" && read NAME
echo -e "Enter email-adress: \c" && read EMAIL

echo "<xdb><password xmlns='jabber:iq:auth' xdbns='jabber:iq:auth'>$PASSWD</password><query xmlns='jabber:iq:register' xdbns='jabber:iq:register'>
<password>$PASSWD</password>
<name>$NAME</name>
<email>$EMAIL</email>
<username>$2</username>
<x xmlns='jabber:x:delay' stamp='20080610T13:06:18'>registered</x></query><vCard xmlns='vcard-temp' version='2.0' prodid='-//HandGen//NONSGML vGen v1.0//EN' xdbns='vcard-temp'>
 <FN></FN>
</vCard><foo xmlns='jabber:x:offline' xdbns='jabber:x:offline'/><query xmlns='jabber:iq:last' last='1213108401' xdbns='jabber:iq:last'>Logged out</query></xdb>" >$USER

# to proof ;)
echo "$(find "$USER") has been added"

# setting correct permission
chown $JABBER_USER:$JABBER_GROUP "$USER"
chmod 600 "$USER"

}
#----------------------------------------------------------------

# fetching server name, spool dir & user/group
test -e /etc/jabberd14/jabber.cfg || exit 1
. /etc/jabberd14/jabber.cfg

# var define
WORKINGDIR=$JABBER_SPOOL/$JABBER_HOSTNAME/

# check if $1 is empty
if [ ! "$1"  ]
then
  usage
else

 # check options
 while [ "$1" ] 
 do 

  case $1 in
    -h | --help)
    	  usage
	  ;;

    -a | --add)
	
#		if [ ! "$3" ]
#		then
#			echo "No passwort given.
#Usage: ${0##*/} -u USER PASSWORD"
#			exit 1
#		else
			add_user "$1" "$2" "$3" "$WORKINGDIR"
#		fi
		;;

    -L | --list)
   	 find $WORKINGDIR -name "*.xml" 2>/dev/null | sed -e 's/.xml//g' | awk -F'/' '{print $NF}'
	 ;;
    -d | --del)
	 if [ ! "$2" ]
	  then
	   echo "Error:
	  	 Usage: ${0##*/} -d USER"
	 else
	    # check if users exists
	    if [ -e "$WORKINGDIR$2.xml" ]
	    then
	     # ask for removing
	     echo "$(find $WORKINGDIR$2.xml 2>/dev/null) Delete y/n? (Default: No)"
             read del
	  	
	      case $del in
	        y | Y | yes | Yes)
	          rm "$WORKINGDIR$2.xml"
	          ;;
	        *)
	          echo "user not removed"
	          exit 1
		  ;;
              esac
	     else
	        echo "$2: User not known"
	     fi
	  fi
	 ;;
    -*)
	 echo "Unknown option: $1"
	 usage
	 ;;
  esac
  shift
 done
fi

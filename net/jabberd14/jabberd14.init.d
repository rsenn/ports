#!/bin/sh
#
# jabber init script to start jabber daemon
#
#     Created from Bernd Eckenfels <ecki@lina.inka.de>
#
#     Written by Miquel van Smoorenburg <miquels@cistron.nl>.
#
#     Modified for Debian GNU/Linux
#     by Ian Murdock <imurdock@gnu.ai.mit.edu>.
#
#     Modified for Ubuntu hardy
#     by Roman Senn <rs@adfinis.com>
#
# Version:  @(#)skeleton  1.8  03-Mar-1998  miquels@cistron.nl
#

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
DAEMON=/usr/sbin/jabberd14
NAME=jabberd14
DESC=jabberd
CONF=/etc/$NAME/jabber.xml
PIDFILE=/var/run/$NAME.pid
USER=jabberd
GROUP=adm
DEFAULTS=/etc/default/$NAME
CMDLINE=""

# Check for presence of the jabber daemon
test -f $DAEMON -a -f $CONF || exit 0

if test -f $DEFAULTS; then
  . $DEFAULTS
fi
    
. /lib/lsb/init-functions

# Are we running from init?
run_by_init()
{
  ([ "$previous" ] && [ "$runlevel" ]) || [ "$runlevel" = S ]
}

# set some parameters like JABBER_HOSTNAME
if test -x /etc/$NAME/jabber.cfg; then
  . /etc/$NAME/jabber.cfg
fi

if test -n "$JABBER_HOSTNAME"; then
  CMDLINE="$CMDLINE -h $JABBER_HOSTNAME"
fi

if test -n "$JABBER_SPOOL"; then
  CMDLINE="$CMDLINE -s $JABBER_SPOOL"
fi

if test -n "$CMDLINE"; then
  CMDLINE="-- $CMDLINE"
fi

set -e

check_pid()
{
      if test -s "$PIDFILE" && test ! -e /proc/`cat $PIDFILE`; then
	rm -f "$PIDFILE"
      fi	
}

case "$1" in
   start)
      
      check_pid
 
      echo -n "Starting $DESC: "
#      cd /usr/lib/$NAME/
      start-stop-daemon -b -c $USER:$GROUP --start --quiet \
         --pidfile $PIDFILE --exec $DAEMON $CMDLINE
      sleep 2
      if pidof $DAEMON > /dev/null 2>&1; then
         echo "$NAME."
         if test -d /etc/$NAME/jabber.d; then
            run-parts --arg=$1 /etc/$NAME/jabber.d
         fi
      else
         echo -n "<Failed>"
         exit 1
      fi 
      ;;

   stop)
      echo -n "Stopping $DESC: "
      start-stop-daemon -o --stop --quiet --pidfile $PIDFILE \
         --retry 5 --exec $DAEMON || ( echo -n "<Failed>" && exit 1 )
      echo "$NAME."
      if test -d /etc/$NAME/jabber.d; then
         run-parts --arg=$1 /etc/$NAME/jabber.d
      fi
      ;;

   reload|force-reload)
      echo "Reloading $DESC configuration files."
      start-stop-daemon --stop --signal 1 --quiet \
         --pidfile $PIDFILE --exec $DAEMON
      if test -d /etc/$NAME/jabber.d; then
         run-parts --arg=$1 /etc/$NAME/jabber.d
      fi
      ;;

   restart)
      $0 stop
      sleep 3
      $0 start
      ;;

   *)
      N=/etc/init.d/$NAME
      echo "Usage: $N {start|stop|restart|reload|force-reload}" >&2
      exit 1
      ;;
esac

exit 0

# EOF

#!/bin/sh
# 
# Generates RSA private key if none available in $1.key
# Dumps RSA public key if none available to $1.pub
# Makes a self-signed certificate in $1.crt
#
# $Id: httpd2-mkcrt.sh,v 1.2 2006/09/21 15:30:07 root Exp $

# ircd dirs
prefix="@prefix@"
sysconfdir="${prefix}/etc"

# openssl client tool
openssl="${prefix}/bin/openssl"

# how many bits the RSA private key will have
bits=1024

# defaults for x509 and stuff
cnf="$sysconfdir/openssl.cnf"

# private key file
key="$1.key"

# public key file
pub="$1.pub"

# certificate
crt="$1.crt"

# random data
rnd="/dev/urandom"

if [ -z "$1" ]; then
  echo "Usage: $0 <path-to-key> [cname]"
	echo
	echo "Example: $0 $prefix/etc/httpd2 0.0.0.0:443"
	echo "         This would generate a private key in $prefix/etc/httpd2.key,"
	echo "         a public key in $prefix/etc/httpd2.pub and a self-signed"
	echo "         certificate in $prefix/etc/httpd2.crt"
	exit 1
fi

# generate RSA private key if not already there
if [ -f "$key" ]
then
  echo "There is already an RSA private key in $key."
else
  # dump random data
  dd if=/dev/urandom "of=$rnd" count=1 "bs=$bits"

  # generate key
  ${openssl} genrsa -rand "$rnd" -out "$key" "$bits"
  
  # remove old shit based on inexistent
  rm -f "$pub" "$req" "$crt"
  
  # destroy random data
#  shred "$rnd"
#  rm "$rnd"
fi

# dump the public key if not present
if [ -f "$pub" ]
then
  echo "There is already an RSA public key in $pub."
else
  ${openssl} rsa -in "$key" -out "$pub" -pubout
fi

# generate certificate
if [ -f "$crt" ]
then
  echo "There is already a certificate in $crt."
else
  COUNTRY="CH"
	STATE="Bern"
	LOCALITY="Thun"
	COMPANY="nexbyte GmbH"
	SECTION="base"
	CNAME="${2-0.0.0.0:443}"

  cat << EOF | ${openssl} req -config "$cnf" -new -x509 -nodes -key "$key" -out "$crt" 2>/dev/null
$COUNTRY
$STATE
$LOCALITY
$COMPANY
$SECTION
$CNAME

EOF
  ${openssl} x509 -subject -dates -fingerprint -noout -in "$crt"
fi


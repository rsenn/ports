#!/bin/sh

MY_NAME=`basename "$0"`
MY_DIR=`dirname "$0"`

cd "$MY_DIR/../share/easyvz/gui"

exec python ezvz.py


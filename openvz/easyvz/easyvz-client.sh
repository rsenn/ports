#!/bin/sh

MY_NAME=`basename "$0"`
MY_DIR=`dirname "$0"`

cd "$MY_DIR/../share/easyvz/backend"

exec python client.py


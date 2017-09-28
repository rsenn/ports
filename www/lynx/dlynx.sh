#!/bin/sh
lynx -dump "$@" | grep '^ *[0-9]\+\. ' | sed 's,^ *[0-9]\+\. ,,'

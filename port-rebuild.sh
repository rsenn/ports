#!/bin/sh

PREFIX="/usr"

. $PREFIX/lib/sh/util.sh

set -e

for PORT; do
  pkgmk -um "$PORT"
  pkgmk -f "$PORT"
  pkgmk -uf "$PORT"
  pkgmk -mpu "$PORT"
done

#!/bin/sh

PPL_SRC=../ppl-0.10.2
PREFIX=/crossdev/gcclibs/win-ppl-install
GMP_INSTALL=/crossdev/gcclibs/win-gmp-install

BUILD=mingw32


export PATH=$GMP_INSTALL/bin:$PATH
export C_INCLUDE_PATH=$GMP_INSTALL/include
export CPLUS_INCLUDE_PATH=$GMP_INSTALL/include
export LIBRARY_PATH=$GMP_INSTALL/lib


if test "$1" = "c"
then
  shift

$PPL_SRC/configure --prefix="$PREFIX" \
    --build=$BUILD \
    --disable-static --enable-shared \
    CFLAGS="-O2" LDFLAGS="-no-undefined"

  if test "$?" != "0"
  then
    exit $?
  fi
fi


if test "$1" = "m"
then
  shift

make

  if test "$?" != "0"
  then
    exit $?
  fi
fi


if test "$1" = "i"
then

make install

fi

exit $?


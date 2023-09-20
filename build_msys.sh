#!/bin/bash

set -e

BUILD=${BUILD:-`gcc -dumpmachine`}
SUFFIX=${SUFFIX:-`date --iso-8601`}

BASE=`pwd`



NPROC=${NPROC:-$((`nproc`*2))}
PARALLEL=${PARALLEL:--j${NPROC}}

PATH=${STAGE}:$PATH; export PATH

# pacman -S unzip bzip2 base-devel mingw-w64-i686-toolchain mingw-w64-i686-libusb mingw-w64-i686-libusb-compat-git mingw-w64-i686-hidapi mingw-w64-i686-libftdi



./configure 
    # --enable-static \
    # --disable-shared \
    # --disable-gccwarnings \
    # --enable-remote-bitbang \
    # --enable-internal-jimtcl \
    # --enable-internal-libjaylink 
make ${PARALLEL}
make install DESTDIR=${BASE}/openocd-0.12
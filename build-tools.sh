#!/bin/sh

APPLE_GCC_URL=http://www.opensource.apple.com/tarballs/gcc/gcc-5646.tar.gz


ECHO=/bin/echo
BUILD=build
PREFIX=`pwd`/Distribution/Package_root/usr/local/

function get_tarball {
    tarball_url=$1
    $ECHO -n "Getting ${tarball_url}..."
    curl --silent -O ${tarball_url}
    $ECHO "done"
}

function untar {
    tarball=$1
    $ECHO -n "Untarring ${tarball}..."
    tar xzf ${tarball}
    $ECHO "done"
}



mkdir -p ${BUILD}
cd ${BUILD}
get_tarball ${APPLE_GCC_URL}
GCC_TARBALL=`basename ${APPLE_GCC_URL}`
untar ${GCC_TARBALL}
GCC_DIR=`echo ${GCC_TARBALL} | sed 's/.tar.gz//'`


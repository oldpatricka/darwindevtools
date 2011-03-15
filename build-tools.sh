#!/bin/sh

APPLE_GCC_URL=http://www.opensource.apple.com/tarballs/gcc/gcc-5646.tar.gz
APPLE_GNUMAKE_URL=http://www.opensource.apple.com/tarballs/gnumake/gnumake-126.2.tar.gz
APPLE_GDB_URL=http://www.opensource.apple.com/tarballs/gdb/gdb-1344.tar.gz
APPLE_LIBC_URL=http://www.opensource.apple.com/tarballs/Libc/Libc-594.9.4.tar.gz


ECHO=/bin/echo
BUILD=`pwd`/build
PREFIX=`pwd`/Distribution/Package_root

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


# GCC
#cd ${BUILD}
#get_tarball ${APPLE_GCC_URL}
#GCC_TARBALL=`basename ${APPLE_GCC_URL}`
#untar ${GCC_TARBALL}
#GCC_DIR=`echo ${GCC_TARBALL} | sed 's/.tar.gz//'`
#cd ${GCC_DIR}

# From README.Apple:
#mkdir -p build/obj build/dst build/sym
#gnumake install RC_OS=macos RC_ARCHS='ppc i386' TARGETS='i386 ppc' SRCROOT=`pwd` OBJROOT=`pwd`/build/obj DSTROOT=`pwd`/build/dst SYMROOT=`pwd`/build/sym
#ditto build/dst $PREFIX

# Make
cd ${BUILD}
get_tarball ${APPLE_GNUMAKE_URL}
GNUMAKE_TARBALL=`basename ${APPLE_GNUMAKE_URL}`
untar ${GNUMAKE_TARBALL}
GNUMAKE_DIR=`echo ${GNUMAKE_TARBALL} | sed 's/.tar.gz//'`
cd ${GNUMAKE_DIR}
gnumake install
ditto /tmp/gnumake/Release $PREFIX


# GDB
cd ${BUILD}
get_tarball ${APPLE_GDB_URL}
GDB_TARBALL=`basename ${APPLE_GDB_URL}`
untar ${GDB_TARBALL}
GDB_DIR=`echo ${GDB_TARBALL} | sed 's/.tar.gz//'`
cd ${GDB_DIR}

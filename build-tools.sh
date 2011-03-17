#!/bin/sh
set -e

ECHO=/bin/echo
BUILD=`pwd`/build
PREFIX=`pwd`/Distribution/Package_root
OSXBUILD=10J567

mkdir -p ${BUILD}

cd ${BUILD}
darwinbuild -init ${OSXBUILD}
darwinxref edit
to_build="autoconf automake bison flex gnumake glibtool bsdmake gcc gcc_select cctools distcc cvs gm4 m4 rcs svk openmpi nasm"
#headers_only="OpenSSL096"
for project in $to_build; do

    echo $project
    darwinbuild -nochroot $project
    ditto Roots/$project/*/ ${PREFIX}
done

for project in $headers_only; do

    echo $project
    darwinbuild -nochroot -headers $project
    ditto Roots/$project/*/ ${PREFIX}
done

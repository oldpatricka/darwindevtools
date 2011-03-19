#!/bin/sh
set -e

ECHO=/bin/echo
BUILD=`pwd`/build
PREFIX=`pwd`/Distribution/Package_root
INCLUDES=`pwd`/includes
OSXBUILD=10J567
#OSXBUILD=10H574
PROJECT_LIST=`pwd`/projects.list

mkdir -p ${BUILD}

cd ${BUILD}
if [ ! -d .build ] ; then
    darwinbuild -init ${OSXBUILD}
fi
#darwinxref edit
#to_build="autoconf automake bison flex gnumake glibtool bsdmake gcc gcc_select cctools distcc cvs gm4 m4 rcs svk openmpi nasm"
to_build=`cat $PROJECT_LIST`

for project in $to_build; do

    if [ "$project" = "ld64" ] ; then

        install_ld64_includes
    fi

    echo "Building $project..."
    darwinbuild -nochroot $project
    ditto Roots/$project/*/ ${PREFIX}
done


# Special cases:
function install_ld64_includes {
    echo "Copying the following to /usr/local/include/ you may want to delete them later"
    ls $INCLUDES/libunwind/include/
    cp -R $INCLUDES/libunwind/include/* /usr/local/include/
}

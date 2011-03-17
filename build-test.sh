#!/bin/sh

PREFIX=./Distribution/Package_root
TESTS=./tests

GCC_TEST=${TESTS}/gcc4.2.pkg.contents
DEVTOOLS_TEST=${TESTS}/DeveloperToolsCLI.pkg.contents


echo "Test GCC..."
for file in `cat ${GCC_TEST}` ; do

        ls $PREFIX/$file >/dev/null 2>&1
        EXISTS=$?
        if [ $EXISTS -ne 0 ]; then
            echo "$PREFIX/$file is missing"
        else
            echo "$PREFIX/$file is OK"
        fi
done

echo "Test DevToolsCLI..."
for file in `cat ${DEVTOOLS_TEST}` ; do

        ls $PREFIX/$file >/dev/null 2>&1
        EXISTS=$?
        if [ $EXISTS -ne 0 ]; then
            echo "$PREFIX/$file is missing"
        else
            echo "$PREFIX/$file is OK"
        fi
done

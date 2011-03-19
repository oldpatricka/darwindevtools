#!/bin/sh

INCLUDES=includes/

mkdir $INCLUDES
cd $INCLUDES


# libunwind for ld64
svn co http://llvm.org/svn/llvm-project/lldb/trunk/source/Plugins/Process/Utility/libunwind@115426 libunwind
curl 'http://opensource.apple.com/source/dyld/dyld-132.13/include/mach-o/dyld_priv.h?txt&dummy=:dyld' > dyld_priv.h
curl 'http://opensource.apple.com/source/cctools/cctools-782/include/mach-o/arm/reloc.h?txt&dummy=:cctools' > reloc.h
curl 'http://svn.macports.org/repository/macports/trunk/dports/devel/ld64/files/patch-lldb_private-libunwind.diff' > patch-lldb_private-libunwind.diff
mkdir -p libunwind/include/mach-o/arm
mv libunwind/src libunwind/include/libunwind
mv dyld_priv.h libunwind/include/mach-o/
mv reloc.h libunwind/include/mach-o/arm/
patch -p1 < patch-lldb_private-libunwind.diff
gsed -i 's/lldb_private/libunwind/' libunwind/include/libunwind/*.h*
gsed -i 's/lldb_private/libunwind/' libunwind/include/mach-o/*.h*

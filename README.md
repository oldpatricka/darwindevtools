# Mac Dev Tools Installer Builder

This is a quick set of scripts to automatically build a set of development
tools, which is normally included with Xcode. The resulting installer is for
people who for whatever reason don't want to install Apple's Xcode package.

Right now, you can get started by running 'build-all.sh' which will create a skeleton for Installer Builder.

This is still really incomplete, but if you're interested, try it out!

Tools derived from the Xcode 3.2.4 release, available at (with membership):
http://developer.apple.com/ios/download.action?path=/ios/ios_sdk_4.1__final/xcode_3.2.4_and_ios_sdk_4.1.dmg

Source from:
http://www.opensource.apple.com/release/developer-tools-324/


## Notes:

Some things need some special jiggery-pokery to get running. 

### ld64 The tarball from opensource.apple.com doesn't compile at all. You'll
get build errors complaining about libunwind, and arm headers. So, we need to
patch this to get it running. The Macports Portfile was a big help in getting
this build. See:
http://svn.macports.org/repository/macports/trunk/dports/devel/ld64/Portfile

More details about Apple's reluctance to release their modified libunwind
sources at: http://openradar.appspot.com/7216959

First, we'll fix the libunwind problems. To do this, we get a specific revision
of part of the llvm project that has the modified libunwind, then patch it, as
the portfile does. You can see how this is done in 'build-includes.sh'. Next,
we copy these headers into /usr/local/include . It would obviously be better to
just add another directory to darwinbuild's include path, but I've had trouble
getting this to work reliably. (Patches accepted!)

#!/bin/bash

#clean up
# echo cleaning debs
#find ./debs -type f -name '*.deb' -delete
#rm -r Packages.bz2

#packages
# dpkg-scanpackages -m ./debs > Packages
# bzip2 -fks Packages

#build debs
echo building debs
# dpkg-deb -bZlzma Projects/<projectname> <output folder>
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/motuumls/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/fastdel/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/flatfields/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/intelligentpower/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/nodropsheet/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/predictionstickaround/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/sera/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/libCSWeather/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/foresight/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/switcherRadii/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/alwaysPlaying/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/selectivecontrols/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/libCSColorPicker/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/libCSPreferences/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/pulltoclear/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/Consolidation/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/reachalert/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/copyvideourl/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/attibutionless/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/ToothModule/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/switcherRadiiXI/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/stretcher/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/shuffle/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/ebullience/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/simmerdown/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/crux/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/covert/.theos/_ debs
# dpkg-deb -bZlzma /Volumes/data/Projects/Git/bubbles/.theos/_ debs
# dpkg-deb -b /Volumes/data/Projects/Git/addrepo/.theos/_ debs

#packages
echo building Packages
dpkg-scanpackages -m ./debs > Packages

#compress
echo compressing Packages
bzip2 -fks Packages

#git
git add .

msg="rebuilding Packages"
# git commit -m "$msg"
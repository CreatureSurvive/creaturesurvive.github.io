#!/bin/bash

#clean up
# echo cleaning debs
#find ./debs -type f -name '*.deb' -delete
#rm -r Packages.bz2

#packages
dpkg-scanpackages -m ./debs > Packages
bzip2 -fks Packages

#build debs
echo building debs
# dpkg-deb --bZlzma Projects/<projectname> <output folder>
# dpkg-deb -bZlzma $TWEAKS/motuumls/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/fastdel/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/flatfields/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/intelligentpower/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/nodropsheet/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/predictionstickaround/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/sera/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/libCSWeather/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/foresight/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/switcherRadii/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/alwaysPlaying/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/selectivecontrols/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/cscolorpicker/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/libcspreferences/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/pulltoclear/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/Consolidation/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/reachalert/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/copyvideourl/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/attibutionless/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/ToothModule/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/switcherRadiiXI/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/stretcher/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/shuffle/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/ebullience/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/simmerdown/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/crux/.theos/_ debs
# dpkg-deb -bZlzma $TWEAKS/covert/.theos/_ debs

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
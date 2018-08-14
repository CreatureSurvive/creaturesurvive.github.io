# @Author: Dana Buehre <creaturesurvive>
# @Date:   20-03-2017 2:10:27
# @Email:  dbuehre@me.com
# @Filename: update-local.sh
# @Last modified by:   creaturesurvive
# @Last modified time: 02-10-2017 3:21:46
# @Copyright: Copyright © 2014-2017 CreatureSurvive


#!/bin/bash

#clean up
#find ./debs -type f -name '*.deb' -delete
#rm -r Packages.bz2

#debs
# dpkg-deb --bZlzma Projects/<projectname> <output folder>
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/motuumls/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/fastdel/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/flatfields/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/intelligentpower/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/nodropsheet/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/predictionstickaround/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/sera/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/libCSWeather/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/foresight/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/switcherRadii/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/alwaysPlaying/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/selectivecontrols/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/cscolorpicker/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/libcspreferences/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/pulltoclear/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/Consolidation/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/reachalert/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/copyvideourl/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/attibutionless/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/ToothModule/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/switcherRadiiXI/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/stretcher/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/shuffle/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/ebullience/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/simmerdown/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/crux/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/covert/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/bubbles/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/cyground/.theos/_ debs
# dpkg-deb -bZlzma ~/Projects/Theos/tweaks/wtfeclipse/.theos/_ debs


#packages
dpkg-scanpackages -m ./debs > Packages
bzip2 -fks Packages

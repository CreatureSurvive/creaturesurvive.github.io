#!/bin/bash

#checks for root
if [ `id -u` != 0 ]; then echo ""Run this as root""; exit 0; fi

#build debs
echo building debs
dpkg-deb -b /var/mobile/dev/Repositories/ReachCC/.theos/_ ./debs

#packages
echo building Packages
dpkg-scanpackages -m . /dev/null >Packages

#compress
echo compressing Packages
bzip2 -fks Packages

#git
git add .

msg="rebuilding Packages"
if [$# -eq 1]
	then msg="$1"
fi
git commit -m "$msg"
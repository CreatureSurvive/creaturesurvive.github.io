#!/bin/sh

did_update_file() {
    local filename=$1
    local start=$2
    [ $(( $(date -r $filename +%s) - $start )) -gt "0" ]
}

cd ~/Projects/Git/creaturesurvive.github.io/

starttime=$(date +%s)

#packages
echo building package list
dpkg-scanpackages -m debs > Packages

echo bzip compressing
bzip2 -5fk Packages > Packages.bz2

echo xz compressing
xz -5fke Packages > Packages.xz

echo lzma compressing
xz -5fke --format=lzma Packages > Packages.lzma

if did_update_file Packages $starttime && did_update_file Packages.bz2 $starttime && did_update_file Packages.xz $starttime && did_update_file Packages.lzma $starttime; then
    echo "finished updating successfully"
else
    echo 'finished updating with error compressing Packages'
fi

exit 0;
# @Author: Dana Buehre <creaturesurvive>
# @Email:  support@creaturecoding.com
# @Filename: update-cli.sh
# @Copyright: Copyright © 2014-2018 CreatureCoding

#!/bin/bash

CLEAR='\033[0m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'

function usage() {
  if [ -n "$1" ]; then
    echo -e "${RED}•••> $1${CLEAR}\n";
  fi
  echo "Usage: $0 [-m --commit-message] [-p --project-directory] "
  echo "  -m, --commit-message      The git commit message "
  echo "  -g, --git-commit          If passed, then commit changes "
  echo "  -p, --project-directory   the theos project directory "
  echo "  -t, --tweaks-directory    pass tewak directory as arg if you dont have it exported in your environment "
  echo "  -c, --clean-debs          remove old debs i.e. no downgrade option "
  echo "  -h, -help                 display this help message "
  echo ""
  echo "Example: $0 --commit-message 'rebuild packages' --project-directory my_tweak "
  exit 1
}

# parse params
while [[ "$#" > 0 ]]; do case $1 in
  -m|--commit-message) COMMIT_MESSAGE="$2"; shift;shift;;
  -g|--git-commit) GIT_COMMIT="$2"; shift;shift;;
  -p|--project-directory) DIRECTORY="$2";shift;shift;;
  -t|--tweaks-directory) TWEAKS="$2";shift;shift;;
  -c|--clean-debs) CLEAN=1;shift;shift;;
  -h|-help) usage; shift; shift;;
  *) usage "Unknown parameter passed: $1"; shift; shift;;
esac; done

# verify params
if [ -z "$DIRECTORY" ]; then usage "Project directory is not set."; fi;
if [ -z "$TWEAKS" ]; 
	then echo -e "${RED}TWEAKS not defined, ${YELLOW}use [-t, -tweaks-directory ~/tweaks/directory] or export TWEAKS=/path/to/tweaks/folder ${RED}in your environment and try again. "; 
	exit 1
fi;

#clean up
if [ -z "$CLEAN" ]; 
	then echo -e "${YELLOW}skip cleaning${CLEAR}"; 
else
	echo -e "${BLUE}cleaning debs${CLEAR}"
	#find ./debs -type f -name '*.deb' -delete
	#rm -r Packages.bz2
	echo -e "${GREEN}Done: cleaning debs${CLEAR}"
fi;

#build debs
echo -e "${BLUE}building debs${CLEAR}"
dpkg-deb -bZlzma $TWEAKS/$DIRECTORY/.theos/_ debs
echo -e "${GREEN}Done: building debs${CLEAR}"

#packages
echo -e "${BLUE}building Packages${CLEAR}"
dpkg-scanpackages -m ./debs > Packages
echo -e "${GREEN}Done: building Packages${CLEAR}"

#compress
echo -e "${BLUE}compressing Packages${CLEAR}"
bzip2 -fks Packages
echo -e "${GREEN}Done: compressing Packages${CLEAR}"

#git
if [ -z "$GIT_COMMIT" ]; 
	then echo -e "${YELLOW}skip commit${CLEAR}";
else
	git add .

	if [ -z "$COMMIT_MESSAGE" ];
		then COMMIT_MESSAGE="Rebuilt Packages for: $DIRECTORY";
	fi;
	echo $COMMIT_MESSAGE
	git commit -m "$COMMIT_MESSAGE"
fi;

#done
echo -e "${GREEN}Complete${CLEAR}"
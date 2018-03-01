#!/bin/bash

CWD=$(pwd)
read -e -p "Enter the folder where to save the Extracted Features files: [$CWD] " DEST
DEST=${DEST:-$CWD}

if [ ! -d "$DEST" ]; then
   read -e -p "Folder [$DEST] does not exist - create? [Y/n] " YN
   YN=${YN:-Y}
   case $YN in
      [yY][eE][sS]|[yY])
         mkdir -p "$DEST" || exit $?
         ;;
      *)
         echo "Aborting."
         exit 2
         ;;
   esac
fi

cat << 'EOF' | rsync -avh --no-perms --no-owner --stats --files-from=- data.analytics.hathitrust.org::features "$DEST"
hvd/pairtree_root/hn/1s/bm/hn1sbm/hvd.hn1sbm.json.bz2
uva/pairtree_root/x0/00/09/47/91/x000094791/uva.x000094791.json.bz2
uc1/pairtree_root/b5/30/09/85/b5300985/uc1.b5300985.json.bz2
pst/pairtree_root/00/00/12/11/16/33/000012111633/pst.000012111633.json.bz2
EOF
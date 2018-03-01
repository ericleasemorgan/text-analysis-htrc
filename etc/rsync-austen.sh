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
mdp/pairtree_root/39/01/50/04/07/56/62/39015004075662/mdp.39015004075662.json.bz2
mdp/pairtree_root/39/01/50/07/02/87/00/39015007028700/mdp.39015007028700.json.bz2
mdp/pairtree_root/39/01/50/01/79/65/00/39015001796500/mdp.39015001796500.json.bz2
mdp/pairtree_root/39/01/50/91/62/76/07/39015091627607/mdp.39015091627607.json.bz2
mdp/pairtree_root/39/01/50/66/07/60/12/39015066076012/mdp.39015066076012.json.bz2
mdp/pairtree_root/39/01/50/91/62/75/73/39015091627573/mdp.39015091627573.json.bz2
EOF
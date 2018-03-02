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
uc2/pairtree_root/ar/k+/=1/39/60/=t/0c/v4/hx/90/ark+=13960=t0cv4hx90/uc2.ark+=13960=t0cv4hx90.json.bz2
wu/pairtree_root/89/01/71/00/93/4/89017100934/wu.89017100934.json.bz2
mdp/pairtree_root/39/01/50/30/70/80/88/39015030708088/mdp.39015030708088.json.bz2
hvd/pairtree_root/32/04/40/04/35/92/04/32044004359204/hvd.32044004359204.json.bz2
coo1/pairtree_root/ar/k+/=1/39/60/=t/53/f5/b9/4k/ark+=13960=t53f5b94k/coo1.ark+=13960=t53f5b94k.json.bz2
umn/pairtree_root/31/95/10/02/40/83/36/w/31951002408336w/umn.31951002408336w.json.bz2
loc/pairtree_root/ar/k+/=1/39/60/=t/8x/92/qh/8h/ark+=13960=t8x92qh8h/loc.ark+=13960=t8x92qh8h.json.bz2
nc01/pairtree_root/ar/k+/=1/39/60/=t/7j/q2/1k/0q/ark+=13960=t7jq21k0q/nc01.ark+=13960=t7jq21k0q.json.bz2
wu/pairtree_root/89/01/71/00/92/6/89017100926/wu.89017100926.json.bz2
uc1/pairtree_root/$b/62/05/74/$b620574/uc1.$b620574.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/7g/q7/5d/9r/ark+=13960=t7gq75d9r/uc2.ark+=13960=t7gq75d9r.json.bz2
uc1/pairtree_root/b3/47/76/44/b3477644/uc1.b3477644.json.bz2
nc01/pairtree_root/ar/k+/=1/39/60/=t/0d/v2/nn/46/ark+=13960=t0dv2nn46/nc01.ark+=13960=t0dv2nn46.json.bz2
uiug/pairtree_root/30/11/20/46/52/19/90/30112046521990/uiug.30112046521990.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/28/91/4q/1v/ark+=13960=t28914q1v/uc2.ark+=13960=t28914q1v.json.bz2
uc1/pairtree_root/b4/59/36/27/b4593627/uc1.b4593627.json.bz2
inu/pairtree_root/39/00/00/05/84/92/73/39000005849273/inu.39000005849273.json.bz2
nyp/pairtree_root/33/43/30/86/98/58/88/33433086985888/nyp.33433086985888.json.bz2
EOF
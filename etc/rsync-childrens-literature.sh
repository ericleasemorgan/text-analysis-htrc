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
pst/pairtree_root/00/00/14/27/44/11/000014274411/pst.000014274411.json.bz2
uc1/pairtree_root/b0/00/32/19/12/b000321912/uc1.b000321912.json.bz2
aeu/pairtree_root/ar/k+/=1/39/60/=t/6g/17/17/86/ark+=13960=t6g171786/aeu.ark+=13960=t6g171786.json.bz2
hvd/pairtree_root/32/04/40/86/87/79/33/32044086877933/hvd.32044086877933.json.bz2
mdp/pairtree_root/39/01/50/66/95/37/31/39015066953731/mdp.39015066953731.json.bz2
uc1/pairtree_root/c0/36/89/02/31/c036890231/uc1.c036890231.json.bz2
hvd/pairtree_root/hw/jw/3h/hwjw3h/hvd.hwjw3h.json.bz2
uva/pairtree_root/x0/04/76/31/84/x004763184/uva.x004763184.json.bz2
hvd/pairtree_root/hn/2k/p1/hn2kp1/hvd.hn2kp1.json.bz2
uc1/pairtree_root/$b/62/05/74/$b620574/uc1.$b620574.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/7g/q7/5d/9r/ark+=13960=t7gq75d9r/uc2.ark+=13960=t7gq75d9r.json.bz2
uc1/pairtree_root/c0/20/49/72/22/c020497222/uc1.c020497222.json.bz2
hvd/pairtree_root/hw/jw/3g/hwjw3g/hvd.hwjw3g.json.bz2
nc01/pairtree_root/ar/k+/=1/39/60/=t/2m/62/kx/1c/ark+=13960=t2m62kx1c/nc01.ark+=13960=t2m62kx1c.json.bz2
njp/pairtree_root/32/10/10/66/12/08/15/32101066120815/njp.32101066120815.json.bz2
hvd/pairtree_root/hw/jw/3i/hwjw3i/hvd.hwjw3i.json.bz2
EOF
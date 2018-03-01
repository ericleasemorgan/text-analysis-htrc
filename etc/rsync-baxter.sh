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
loc/pairtree_root/ar/k+/=1/39/60/=t/2d/80/nm/55/ark+=13960=t2d80nm55/loc.ark+=13960=t2d80nm55.json.bz2
uc1/pairtree_root/31/17/50/35/52/43/73/31175035524373/uc1.31175035524373.json.bz2
hvd/pairtree_root/32/04/40/02/44/49/58/32044002444958/hvd.32044002444958.json.bz2
uiug/pairtree_root/30/11/21/14/01/83/41/30112114018341/uiug.30112114018341.json.bz2
aeu/pairtree_root/ar/k+/=1/39/60/=t/4v/h6/fv/15/ark+=13960=t4vh6fv15/aeu.ark+=13960=t4vh6fv15.json.bz2
nyp/pairtree_root/33/43/30/82/34/70/83/33433082347083/nyp.33433082347083.json.bz2
hvd/pairtree_root/32/04/40/55/06/89/51/32044055068951/hvd.32044055068951.json.bz2
osu/pairtree_root/32/43/50/02/92/25/32/32435002922532/osu.32435002922532.json.bz2
nnc1/pairtree_root/00/36/69/88/06/0036698806/nnc1.0036698806.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/7f/r0/s6/8d/ark+=13960=t7fr0s68d/dul1.ark+=13960=t7fr0s68d.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/0v/q3/ts/1n/ark+=13960=t0vq3ts1n/dul1.ark+=13960=t0vq3ts1n.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/00/z8/2c/1q/ark+=13960=t00z82c1q/dul1.ark+=13960=t00z82c1q.json.bz2
uc1/pairtree_root/31/17/50/35/24/44/69/31175035244469/uc1.31175035244469.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/87/h2/f5/16/ark+=13960=t87h2f516/dul1.ark+=13960=t87h2f516.json.bz2
njp/pairtree_root/32/10/10/55/45/76/32/32101055457632/njp.32101055457632.json.bz2
hvd/pairtree_root/32/04/40/02/06/43/43/32044002064343/hvd.32044002064343.json.bz2
uc1/pairtree_root/31/17/50/35/16/20/18/31175035162018/uc1.31175035162018.json.bz2
mdp/pairtree_root/39/01/50/84/59/64/39/39015084596439/mdp.39015084596439.json.bz2
mdp/pairtree_root/39/01/50/80/03/08/96/39015080030896/mdp.39015080030896.json.bz2
yale/pairtree_root/39/00/20/02/37/58/07/39002002375807/yale.39002002375807.json.bz2
njp/pairtree_root/32/10/10/67/67/85/71/32101067678571/njp.32101067678571.json.bz2
mdp/pairtree_root/39/01/50/63/54/33/60/39015063543360/mdp.39015063543360.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/05/x3/6t/7d/ark+=13960=t05x36t7d/dul1.ark+=13960=t05x36t7d.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/2v/41/mj/4d/ark+=13960=t2v41mj4d/dul1.ark+=13960=t2v41mj4d.json.bz2
mdp/pairtree_root/39/01/50/74/70/56/02/39015074705602/mdp.39015074705602.json.bz2
nyp/pairtree_root/33/43/30/82/36/67/03/33433082366703/nyp.33433082366703.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/7n/p2/zg/61/ark+=13960=t7np2zg61/dul1.ark+=13960=t7np2zg61.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/82/j7/b6/6h/ark+=13960=t82j7b66h/dul1.ark+=13960=t82j7b66h.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/1j/h4/fj/46/ark+=13960=t1jh4fj46/dul1.ark+=13960=t1jh4fj46.json.bz2
nyp/pairtree_root/33/43/30/70/29/70/68/33433070297068/nyp.33433070297068.json.bz2
uc1/pairtree_root/b3/65/37/23/b3653723/uc1.b3653723.json.bz2
uc1/pairtree_root/31/17/50/35/14/76/05/31175035147605/uc1.31175035147605.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/3b/z7/30/1r/ark+=13960=t3bz7301r/dul1.ark+=13960=t3bz7301r.json.bz2
nyp/pairtree_root/33/43/30/68/26/11/91/33433068261191/nyp.33433068261191.json.bz2
uc1/pairtree_root/31/17/50/35/14/76/13/31175035147613/uc1.31175035147613.json.bz2
nyp/pairtree_root/33/43/30/68/26/96/24/33433068269624/nyp.33433068269624.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/3p/v7/cx/17/ark+=13960=t3pv7cx17/dul1.ark+=13960=t3pv7cx17.json.bz2
njp/pairtree_root/32/10/10/36/89/51/57/32101036895157/njp.32101036895157.json.bz2
njp/pairtree_root/32/10/10/36/89/50/25/32101036895025/njp.32101036895025.json.bz2
mdp/pairtree_root/39/01/50/64/36/99/89/39015064369989/mdp.39015064369989.json.bz2
mdp/pairtree_root/39/01/50/64/36/94/01/39015064369401/mdp.39015064369401.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/5s/76/8c/1q/ark+=13960=t5s768c1q/dul1.ark+=13960=t5s768c1q.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/5s/76/8d/2n/ark+=13960=t5s768d2n/dul1.ark+=13960=t5s768d2n.json.bz2
uc1/pairtree_root/31/17/50/35/14/76/39/31175035147639/uc1.31175035147639.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/0h/t3/ht/2s/ark+=13960=t0ht3ht2s/dul1.ark+=13960=t0ht3ht2s.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/9s/18/vv/67/ark+=13960=t9s18vv67/dul1.ark+=13960=t9s18vv67.json.bz2
uc1/pairtree_root/31/17/50/35/14/76/21/31175035147621/uc1.31175035147621.json.bz2
hvd/pairtree_root/32/04/40/55/06/89/69/32044055068969/hvd.32044055068969.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/5f/b5/zh/4s/ark+=13960=t5fb5zh4s/dul1.ark+=13960=t5fb5zh4s.json.bz2
njp/pairtree_root/32/10/10/36/89/50/33/32101036895033/njp.32101036895033.json.bz2
uiug/pairtree_root/30/11/20/64/59/45/15/30112064594515/uiug.30112064594515.json.bz2
nyp/pairtree_root/33/43/30/68/25/18/04/33433068251804/nyp.33433068251804.json.bz2
hvd/pairtree_root/hn/64/3s/hn643s/hvd.hn643s.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/2p/56/g2/45/ark+=13960=t2p56g245/dul1.ark+=13960=t2p56g245.json.bz2
hvd/pairtree_root/32/04/40/20/67/01/88/32044020670188/hvd.32044020670188.json.bz2
dul1/pairtree_root/ar/k+/=1/39/60/=t/00/01/1j/8m/ark+=13960=t00011j8m/dul1.ark+=13960=t00011j8m.json.bz2
njp/pairtree_root/32/10/10/64/14/39/42/32101064143942/njp.32101064143942.json.bz2
wu/pairtree_root/89/07/09/52/50/2/89070952502/wu.89070952502.json.bz2
EOF
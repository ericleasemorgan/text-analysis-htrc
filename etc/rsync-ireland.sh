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
nyp/pairtree_root/33/43/30/74/78/82/37/33433074788237/nyp.33433074788237.json.bz2
hvd/pairtree_root/32/04/40/10/53/30/57/32044010533057/hvd.32044010533057.json.bz2
loc/pairtree_root/ar/k+/=1/39/60/=t/7n/p2/x8/7d/ark+=13960=t7np2x87d/loc.ark+=13960=t7np2x87d.json.bz2
njp/pairtree_root/32/10/10/74/35/30/85/32101074353085/njp.32101074353085.json.bz2
nyp/pairtree_root/33/43/30/69/33/64/14/33433069336414/nyp.33433069336414.json.bz2
nyp/pairtree_root/33/43/30/69/33/66/12/33433069336612/nyp.33433069336612.json.bz2
loc/pairtree_root/ar/k+/=1/39/60/=t/30/29/c3/13/ark+=13960=t3029c313/loc.ark+=13960=t3029c313.json.bz2
mdp/pairtree_root/39/01/50/63/88/31/96/39015063883196/mdp.39015063883196.json.bz2
hvd/pairtree_root/hx/ju/iu/hxjuiu/hvd.hxjuiu.json.bz2
wu/pairtree_root/89/03/55/12/87/0/89035512870/wu.89035512870.json.bz2
bc/pairtree_root/ar/k+/=1/39/60/=t/3f/x7/sb/2k/ark+=13960=t3fx7sb2k/bc.ark+=13960=t3fx7sb2k.json.bz2
nyp/pairtree_root/33/43/30/69/33/66/46/33433069336646/nyp.33433069336646.json.bz2
hvd/pairtree_root/hw/p4/sf/hwp4sf/hvd.hwp4sf.json.bz2
mdp/pairtree_root/39/01/50/08/35/51/02/39015008355102/mdp.39015008355102.json.bz2
yale/pairtree_root/39/00/20/14/98/59/16/39002014985916/yale.39002014985916.json.bz2
bc/pairtree_root/ar/k+/=1/39/60/=t/5t/72/wz/9f/ark+=13960=t5t72wz9f/bc.ark+=13960=t5t72wz9f.json.bz2
chi/pairtree_root/19/73/61/91/19736191/chi.19736191.json.bz2
umn/pairtree_root/31/95/10/01/51/32/53/k/31951001513253k/umn.31951001513253k.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/2d/79/6v/4h/ark+=13960=t2d796v4h/uc2.ark+=13960=t2d796v4h.json.bz2
bc/pairtree_root/ar/k+/=1/39/60/=t/9v/12/dn/13/ark+=13960=t9v12dn13/bc.ark+=13960=t9v12dn13.json.bz2
uva/pairtree_root/x0/01/69/00/09/x001690009/uva.x001690009.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/1p/g1/k4/66/ark+=13960=t1pg1k466/uc2.ark+=13960=t1pg1k466.json.bz2
hvd/pairtree_root/32/04/40/81/27/84/83/32044081278483/hvd.32044081278483.json.bz2
hvd/pairtree_root/hn/zn/vj/hnznvj/hvd.hnznvj.json.bz2
loc/pairtree_root/ar/k+/=1/39/60/=t/2n/59/25/0f/ark+=13960=t2n59250f/loc.ark+=13960=t2n59250f.json.bz2
hvd/pairtree_root/32/04/40/20/57/32/75/32044020573275/hvd.32044020573275.json.bz2
loc/pairtree_root/ar/k+/=1/39/60/=t/06/w9/vx/9t/ark+=13960=t06w9vx9t/loc.ark+=13960=t06w9vx9t.json.bz2
hvd/pairtree_root/32/04/40/24/41/22/07/32044024412207/hvd.32044024412207.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/53/f5/0x/6g/ark+=13960=t53f50x6g/uc2.ark+=13960=t53f50x6g.json.bz2
loc/pairtree_root/ar/k+/=1/39/60/=t/8w/95/pk/4w/ark+=13960=t8w95pk4w/loc.ark+=13960=t8w95pk4w.json.bz2
nyp/pairtree_root/33/43/30/69/33/47/99/33433069334799/nyp.33433069334799.json.bz2
hvd/pairtree_root/32/04/40/81/28/06/95/32044081280695/hvd.32044081280695.json.bz2
mdp/pairtree_root/39/01/50/07/01/42/05/39015007014205/mdp.39015007014205.json.bz2
hvd/pairtree_root/hx/jr/r7/hxjrr7/hvd.hxjrr7.json.bz2
bc/pairtree_root/ar/k+/=1/39/60/=t/5t/72/ww/44/ark+=13960=t5t72ww44/bc.ark+=13960=t5t72ww44.json.bz2
bc/pairtree_root/ar/k+/=1/39/60/=t/4k/m1/sb/0r/ark+=13960=t4km1sb0r/bc.ark+=13960=t4km1sb0r.json.bz2
nyp/pairtree_root/33/43/30/69/33/64/30/33433069336430/nyp.33433069336430.json.bz2
mdp/pairtree_root/39/01/50/56/10/88/17/39015056108817/mdp.39015056108817.json.bz2
hvd/pairtree_root/hn/61/fz/hn61fz/hvd.hn61fz.json.bz2
bc/pairtree_root/ar/k+/=1/39/60/=t/20/c5/fv/8g/ark+=13960=t20c5fv8g/bc.ark+=13960=t20c5fv8g.json.bz2
bc/pairtree_root/ar/k+/=1/39/60/=t/0v/q5/7t/3s/ark+=13960=t0vq57t3s/bc.ark+=13960=t0vq57t3s.json.bz2
mdp/pairtree_root/39/01/50/08/52/42/93/39015008524293/mdp.39015008524293.json.bz2
bc/pairtree_root/ar/k+/=1/39/60/=t/1r/f8/76/5d/ark+=13960=t1rf8765d/bc.ark+=13960=t1rf8765d.json.bz2
loc/pairtree_root/ar/k+/=1/39/60/=t/7t/m7/p7/7t/ark+=13960=t7tm7p77t/loc.ark+=13960=t7tm7p77t.json.bz2
EOF
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
hvd/pairtree_root/32/04/40/52/75/05/44/32044052750544/hvd.32044052750544.json.bz2
hvd/pairtree_root/32/04/40/11/65/86/14/32044011658614/hvd.32044011658614.json.bz2
hvd/pairtree_root/ah/4j/k1/ah4jk1/hvd.ah4jk1.json.bz2
hvd/pairtree_root/32/04/40/54/76/47/66/32044054764766/hvd.32044054764766.json.bz2
hvd/pairtree_root/32/04/40/81/81/07/80/32044081810780/hvd.32044081810780.json.bz2
hvd/pairtree_root/32/04/40/81/80/97/58/32044081809758/hvd.32044081809758.json.bz2
hvd/pairtree_root/hw/jr/an/hwjran/hvd.hwjran.json.bz2
hvd/pairtree_root/hn/63/ra/hn63ra/hvd.hn63ra.json.bz2
hvd/pairtree_root/32/04/41/05/53/08/69/32044105530869/hvd.32044105530869.json.bz2
hvd/pairtree_root/32/04/40/77/93/16/81/32044077931681/hvd.32044077931681.json.bz2
hvd/pairtree_root/32/04/40/13/68/85/77/32044013688577/hvd.32044013688577.json.bz2
hvd/pairtree_root/32/04/40/29/83/49/42/32044029834942/hvd.32044029834942.json.bz2
hvd/pairtree_root/ah/3c/kz/ah3ckz/hvd.ah3ckz.json.bz2
hvd/pairtree_root/32/04/40/16/89/63/34/32044016896334/hvd.32044016896334.json.bz2
hvd/pairtree_root/32/04/40/54/76/45/68/32044054764568/hvd.32044054764568.json.bz2
hvd/pairtree_root/ah/5e/48/ah5e48/hvd.ah5e48.json.bz2
hvd/pairtree_root/32/04/40/54/76/48/40/32044054764840/hvd.32044054764840.json.bz2
hvd/pairtree_root/hw/t7/7g/hwt77g/hvd.hwt77g.json.bz2
hvd/pairtree_root/32/04/40/77/90/46/39/32044077904639/hvd.32044077904639.json.bz2
hvd/pairtree_root/ah/4q/ny/ah4qny/hvd.ah4qny.json.bz2
hvd/pairtree_root/ah/21/9e/ah219e/hvd.ah219e.json.bz2
hvd/pairtree_root/32/04/40/81/81/00/79/32044081810079/hvd.32044081810079.json.bz2
hvd/pairtree_root/ah/5g/bp/ah5gbp/hvd.ah5gbp.json.bz2
hvd/pairtree_root/hn/zn/wn/hnznwn/hvd.hnznwn.json.bz2
hvd/pairtree_root/32/04/40/54/76/48/73/32044054764873/hvd.32044054764873.json.bz2
hvd/pairtree_root/ah/47/ca/ah47ca/hvd.ah47ca.json.bz2
hvd/pairtree_root/ah/4k/3w/ah4k3w/hvd.ah4k3w.json.bz2
hvd/pairtree_root/hn/3m/lc/hn3mlc/hvd.hn3mlc.json.bz2
hvd/pairtree_root/ah/21/q1/ah21q1/hvd.ah21q1.json.bz2
hvd/pairtree_root/ah/21/9b/ah219b/hvd.ah219b.json.bz2
hvd/pairtree_root/32/04/40/77/90/17/00/32044077901700/hvd.32044077901700.json.bz2
hvd/pairtree_root/hw/jn/33/hwjn33/hvd.hwjn33.json.bz2
hvd/pairtree_root/hw/rr/fm/hwrrfm/hvd.hwrrfm.json.bz2
hvd/pairtree_root/32/04/40/81/81/05/33/32044081810533/hvd.32044081810533.json.bz2
hvd/pairtree_root/ah/5e/4d/ah5e4d/hvd.ah5e4d.json.bz2
hvd/pairtree_root/ah/63/cw/ah63cw/hvd.ah63cw.json.bz2
hvd/pairtree_root/ah/4j/jy/ah4jjy/hvd.ah4jjy.json.bz2
hvd/pairtree_root/32/04/40/51/07/93/90/32044051079390/hvd.32044051079390.json.bz2
hvd/pairtree_root/32/04/40/17/19/17/19/32044017191719/hvd.32044017191719.json.bz2
hvd/pairtree_root/32/04/40/54/74/72/66/32044054747266/hvd.32044054747266.json.bz2
hvd/pairtree_root/ah/4a/tl/ah4atl/hvd.ah4atl.json.bz2
hvd/pairtree_root/ah/4l/bu/ah4lbu/hvd.ah4lbu.json.bz2
hvd/pairtree_root/32/04/40/50/66/47/39/32044050664739/hvd.32044050664739.json.bz2
hvd/pairtree_root/ah/5t/kz/ah5tkz/hvd.ah5tkz.json.bz2
hvd/pairtree_root/32/04/40/16/89/72/82/32044016897282/hvd.32044016897282.json.bz2
hvd/pairtree_root/32/04/40/81/80/89/90/32044081808990/hvd.32044081808990.json.bz2
hvd/pairtree_root/32/04/40/23/35/58/94/32044023355894/hvd.32044023355894.json.bz2
hvd/pairtree_root/32/04/40/77/88/14/07/32044077881407/hvd.32044077881407.json.bz2
hvd/pairtree_root/32/04/40/81/81/07/23/32044081810723/hvd.32044081810723.json.bz2
hvd/pairtree_root/32/04/40/48/21/36/49/32044048213649/hvd.32044048213649.json.bz2
hvd/pairtree_root/32/04/40/54/76/69/44/32044054766944/hvd.32044054766944.json.bz2
hvd/pairtree_root/ah/4k/3m/ah4k3m/hvd.ah4k3m.json.bz2
hvd/pairtree_root/32/04/40/24/49/20/01/32044024492001/hvd.32044024492001.json.bz2
hvd/pairtree_root/32/04/40/54/74/72/58/32044054747258/hvd.32044054747258.json.bz2
hvd/pairtree_root/hn/58/9j/hn589j/hvd.hn589j.json.bz2
hvd/pairtree_root/hw/jr/mp/hwjrmp/hvd.hwjrmp.json.bz2
hvd/pairtree_root/ah/4k/44/ah4k44/hvd.ah4k44.json.bz2
hvd/pairtree_root/hw/t7/7f/hwt77f/hvd.hwt77f.json.bz2
hvd/pairtree_root/32/04/40/48/25/71/33/32044048257133/hvd.32044048257133.json.bz2
hvd/pairtree_root/32/04/40/19/07/96/56/32044019079656/hvd.32044019079656.json.bz2
hvd/pairtree_root/32/04/40/48/22/95/95/32044048229595/hvd.32044048229595.json.bz2
hvd/pairtree_root/32/04/40/77/89/12/40/32044077891240/hvd.32044077891240.json.bz2
hvd/pairtree_root/32/04/40/51/08/00/00/32044051080000/hvd.32044051080000.json.bz2
hvd/pairtree_root/ah/5n/ce/ah5nce/hvd.ah5nce.json.bz2
hvd/pairtree_root/32/04/40/81/81/04/75/32044081810475/hvd.32044081810475.json.bz2
hvd/pairtree_root/32/04/40/19/96/81/30/32044019968130/hvd.32044019968130.json.bz2
hvd/pairtree_root/32/04/40/77/89/27/27/32044077892727/hvd.32044077892727.json.bz2
hvd/pairtree_root/hw/1y/s8/hw1ys8/hvd.hw1ys8.json.bz2
hvd/pairtree_root/ah/68/zy/ah68zy/hvd.ah68zy.json.bz2
hvd/pairtree_root/32/04/40/23/32/90/63/32044023329063/hvd.32044023329063.json.bz2
hvd/pairtree_root/ah/22/6c/ah226c/hvd.ah226c.json.bz2
hvd/pairtree_root/ah/6a/lw/ah6alw/hvd.ah6alw.json.bz2
hvd/pairtree_root/32/04/40/54/74/56/09/32044054745609/hvd.32044054745609.json.bz2
hvd/pairtree_root/32/04/40/54/76/29/27/32044054762927/hvd.32044054762927.json.bz2
hvd/pairtree_root/32/04/40/81/81/05/41/32044081810541/hvd.32044081810541.json.bz2
hvd/pairtree_root/32/04/40/09/61/39/28/32044009613928/hvd.32044009613928.json.bz2
hvd/pairtree_root/ah/3a/j3/ah3aj3/hvd.ah3aj3.json.bz2
hvd/pairtree_root/ah/4k/3r/ah4k3r/hvd.ah4k3r.json.bz2
EOF
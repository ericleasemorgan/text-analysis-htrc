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
uc2/pairtree_root/ar/k+/=1/39/60/=t/6s/x6/6s/8t/ark+=13960=t6sx66s8t/uc2.ark+=13960=t6sx66s8t.json.bz2
pst/pairtree_root/00/00/06/71/11/08/000006711108/pst.000006711108.json.bz2
mdp/pairtree_root/39/01/50/63/96/31/39/39015063963139/mdp.39015063963139.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/38/05/00/9b/ark+=13960=t3805009b/uc2.ark+=13960=t3805009b.json.bz2
nyp/pairtree_root/33/43/30/74/90/26/63/33433074902663/nyp.33433074902663.json.bz2
coo/pairtree_root/31/92/40/13/52/57/40/31924013525740/coo.31924013525740.json.bz2
mdp/pairtree_root/39/01/50/30/32/68/16/39015030326816/mdp.39015030326816.json.bz2
nyp/pairtree_root/33/43/30/74/95/06/05/33433074950605/nyp.33433074950605.json.bz2
hvd/pairtree_root/32/04/40/86/83/11/12/32044086831112/hvd.32044086831112.json.bz2
aeu/pairtree_root/ar/k+/=1/39/60/=t/6g/17/17/86/ark+=13960=t6g171786/aeu.ark+=13960=t6g171786.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/13/n2/2q/6f/ark+=13960=t13n22q6f/uc2.ark+=13960=t13n22q6f.json.bz2
nc01/pairtree_root/ar/k+/=1/39/60/=t/8p/c4/0q/4v/ark+=13960=t8pc40q4v/nc01.ark+=13960=t8pc40q4v.json.bz2
nyp/pairtree_root/33/43/30/74/95/06/13/33433074950613/nyp.33433074950613.json.bz2
mdp/pairtree_root/39/01/50/04/23/08/38/39015004230838/mdp.39015004230838.json.bz2
nyp/pairtree_root/33/43/30/74/92/99/97/33433074929997/nyp.33433074929997.json.bz2
aeu/pairtree_root/ar/k+/=1/39/60/=t/0t/q6/8b/7x/ark+=13960=t0tq68b7x/aeu.ark+=13960=t0tq68b7x.json.bz2
osu/pairtree_root/32/43/50/05/61/16/45/32435005611645/osu.32435005611645.json.bz2
njp/pairtree_root/32/10/10/67/64/54/30/32101067645430/njp.32101067645430.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/7m/p4/wc/1w/ark+=13960=t7mp4wc1w/uc2.ark+=13960=t7mp4wc1w.json.bz2
pst/pairtree_root/00/00/06/71/10/92/000006711092/pst.000006711092.json.bz2
nyp/pairtree_root/33/43/30/74/93/10/01/33433074931001/nyp.33433074931001.json.bz2
nyp/pairtree_root/33/43/30/75/72/98/91/33433075729891/nyp.33433075729891.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/6g/15/wj/1f/ark+=13960=t6g15wj1f/uc2.ark+=13960=t6g15wj1f.json.bz2
aeu/pairtree_root/ar/k+/=1/39/60/=t/5j/97/58/11/ark+=13960=t5j975811/aeu.ark+=13960=t5j975811.json.bz2
uva/pairtree_root/x0/30/57/67/77/x030576777/uva.x030576777.json.bz2
mdp/pairtree_root/39/01/50/35/55/02/46/39015035550246/mdp.39015035550246.json.bz2
njp/pairtree_root/32/10/10/63/58/25/38/32101063582538/njp.32101063582538.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/7j/q0/vw/6t/ark+=13960=t7jq0vw6t/uc2.ark+=13960=t7jq0vw6t.json.bz2
nyp/pairtree_root/33/43/30/75/75/09/39/33433075750939/nyp.33433075750939.json.bz2
nyp/pairtree_root/33/43/30/74/95/05/48/33433074950548/nyp.33433074950548.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/3j/w8/h1/1q/ark+=13960=t3jw8h11q/uc2.ark+=13960=t3jw8h11q.json.bz2
nyp/pairtree_root/33/43/30/74/93/12/58/33433074931258/nyp.33433074931258.json.bz2
nyp/pairtree_root/33/43/30/74/95/05/55/33433074950555/nyp.33433074950555.json.bz2
nyp/pairtree_root/33/43/30/74/94/19/43/33433074941943/nyp.33433074941943.json.bz2
uiuo/pairtree_root/ar/k+/=1/39/60/=t/7j/q1/qg/5p/ark+=13960=t7jq1qg5p/uiuo.ark+=13960=t7jq1qg5p.json.bz2
coo/pairtree_root/31/92/40/13/52/57/16/31924013525716/coo.31924013525716.json.bz2
hvd/pairtree_root/hw/jw/3h/hwjw3h/hvd.hwjw3h.json.bz2
osu/pairtree_root/32/43/50/03/52/48/99/32435003524899/osu.32435003524899.json.bz2
nyp/pairtree_root/33/43/30/74/87/88/89/33433074878889/nyp.33433074878889.json.bz2
nyp/pairtree_root/33/43/30/74/95/05/97/33433074950597/nyp.33433074950597.json.bz2
mdp/pairtree_root/39/01/50/63/55/27/75/39015063552775/mdp.39015063552775.json.bz2
uiug/pairtree_root/30/11/20/52/94/14/96/30112052941496/uiug.30112052941496.json.bz2
pst/pairtree_root/00/00/06/71/10/85/000006711085/pst.000006711085.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/6q/z2/b2/1w/ark+=13960=t6qz2b21w/uc2.ark+=13960=t6qz2b21w.json.bz2
bc/pairtree_root/ar/k+/=1/39/60/=t/19/k4/r1/0s/ark+=13960=t19k4r10s/bc.ark+=13960=t19k4r10s.json.bz2
nyp/pairtree_root/33/43/30/75/72/77/88/33433075727788/nyp.33433075727788.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/35/14/b7/3r/ark+=13960=t3514b73r/uc2.ark+=13960=t3514b73r.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/3k/w5/9x/2j/ark+=13960=t3kw59x2j/uc2.ark+=13960=t3kw59x2j.json.bz2
nyp/pairtree_root/33/43/30/74/95/06/39/33433074950639/nyp.33433074950639.json.bz2
mdp/pairtree_root/39/01/50/35/55/01/96/39015035550196/mdp.39015035550196.json.bz2
mdp/pairtree_root/39/01/50/12/31/24/95/39015012312495/mdp.39015012312495.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/9f/47/rt/25/ark+=13960=t9f47rt25/uc2.ark+=13960=t9f47rt25.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/09/w0/dj/15/ark+=13960=t09w0dj15/uc2.ark+=13960=t09w0dj15.json.bz2
hvd/pairtree_root/hx/q8/e4/hxq8e4/hvd.hxq8e4.json.bz2
uc1/pairtree_root/l0/06/37/91/32/1/l0063791321/uc1.l0063791321.json.bz2
njp/pairtree_root/32/10/10/64/91/43/34/32101064914334/njp.32101064914334.json.bz2
nyp/pairtree_root/33/43/30/74/87/10/17/33433074871017/nyp.33433074871017.json.bz2
uiuo/pairtree_root/ar/k+/=1/39/60/=t/7k/p8/rc/4w/ark+=13960=t7kp8rc4w/uiuo.ark+=13960=t7kp8rc4w.json.bz2
nyp/pairtree_root/33/43/30/74/94/00/69/33433074940069/nyp.33433074940069.json.bz2
nyp/pairtree_root/33/43/30/74/86/47/07/33433074864707/nyp.33433074864707.json.bz2
uc1/pairtree_root/b3/32/25/65/b3322565/uc1.b3322565.json.bz2
nyp/pairtree_root/33/43/30/74/94/18/10/33433074941810/nyp.33433074941810.json.bz2
mdp/pairtree_root/39/01/50/21/01/11/20/39015021011120/mdp.39015021011120.json.bz2
mdp/pairtree_root/39/01/50/63/95/26/94/39015063952694/mdp.39015063952694.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/6q/z2/g8/2q/ark+=13960=t6qz2g82q/uc2.ark+=13960=t6qz2g82q.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/0t/q5/rz/9c/ark+=13960=t0tq5rz9c/uc2.ark+=13960=t0tq5rz9c.json.bz2
njp/pairtree_root/32/10/10/65/83/53/71/32101065835371/njp.32101065835371.json.bz2
uc1/pairtree_root/b3/58/15/68/b3581568/uc1.b3581568.json.bz2
mdp/pairtree_root/39/01/50/35/55/01/62/39015035550162/mdp.39015035550162.json.bz2
coo/pairtree_root/31/92/40/13/51/64/59/31924013516459/coo.31924013516459.json.bz2
uc1/pairtree_root/b3/32/25/64/b3322564/uc1.b3322564.json.bz2
nyp/pairtree_root/33/43/30/74/95/05/63/33433074950563/nyp.33433074950563.json.bz2
nyp/pairtree_root/33/43/30/74/86/98/39/33433074869839/nyp.33433074869839.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/3z/s2/tr/8n/ark+=13960=t3zs2tr8n/uc2.ark+=13960=t3zs2tr8n.json.bz2
pst/pairtree_root/00/00/06/71/10/61/000006711061/pst.000006711061.json.bz2
ucw/pairtree_root/ar/k+/=1/39/60/=t/4s/j1/qx/16/ark+=13960=t4sj1qx16/ucw.ark+=13960=t4sj1qx16.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/47/p8/wx/1b/ark+=13960=t47p8wx1b/uc2.ark+=13960=t47p8wx1b.json.bz2
njp/pairtree_root/32/10/10/67/17/89/29/32101067178929/njp.32101067178929.json.bz2
nyp/pairtree_root/33/43/30/74/95/05/89/33433074950589/nyp.33433074950589.json.bz2
mdp/pairtree_root/39/01/50/63/93/86/36/39015063938636/mdp.39015063938636.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/08/w3/9f/1d/ark+=13960=t08w39f1d/uc2.ark+=13960=t08w39f1d.json.bz2
osu/pairtree_root/32/43/50/54/63/15/51/32435054631551/osu.32435054631551.json.bz2
njp/pairtree_root/32/10/10/65/76/29/06/32101065762906/njp.32101065762906.json.bz2
uiuo/pairtree_root/ar/k+/=1/39/60/=t/0f/t9/9n/55/ark+=13960=t0ft99n55/uiuo.ark+=13960=t0ft99n55.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/03/x8/4s/6x/ark+=13960=t03x84s6x/uc2.ark+=13960=t03x84s6x.json.bz2
nyp/pairtree_root/33/43/30/74/95/06/21/33433074950621/nyp.33433074950621.json.bz2
hvd/pairtree_root/hn/1s/rb/hn1srb/hvd.hn1srb.json.bz2
uc2/pairtree_root/ar/k+/=1/39/60/=t/31/26/59/4x/ark+=13960=t3126594x/uc2.ark+=13960=t3126594x.json.bz2
nyp/pairtree_root/33/43/30/74/87/08/11/33433074870811/nyp.33433074870811.json.bz2
osu/pairtree_root/32/43/50/06/45/60/16/32435006456016/osu.32435006456016.json.bz2
hvd/pairtree_root/hw/jw/3g/hwjw3g/hvd.hwjw3g.json.bz2
mdp/pairtree_root/39/01/50/30/32/68/32/39015030326832/mdp.39015030326832.json.bz2
nyp/pairtree_root/33/43/30/74/95/05/71/33433074950571/nyp.33433074950571.json.bz2
njp/pairtree_root/32/10/10/66/12/08/15/32101066120815/njp.32101066120815.json.bz2
hvd/pairtree_root/hw/jw/3i/hwjw3i/hvd.hwjw3i.json.bz2
EOF
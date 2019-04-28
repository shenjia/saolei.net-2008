#!/bin/bash
REPO=/www/saolei.net/deploy/saolei.net-2008
LOG=/www/saolei.net/deploy/git.log

echo "-------------------------------------" >> $LOG
date >> $LOG
cd $REPO
#OLD_COMMIT=`git log|head -n 1|sed 's/commit //'`
#git pull origin test >> $LOG 2>&1
#NEW_COMMIT=`git log|head -n 1|sed 's/commit //'`

OLD_COMMIT=7d769a3eeb4cb14d5296230d00fdd3a8916552f1
NEW_COMMIT=c2e4f9a7407f570a1ba30f925d64fa6d714f81a8

if [ "$OLD_COMMIT" = "$NEW_COMMIT" ];then
    echo "no new commit!"
else
    echo "$OLD_COMMIT -> $NEW_COMMIT"
    git diff $OLD_COMMIT $NEW_COMMIT --name-only

fi
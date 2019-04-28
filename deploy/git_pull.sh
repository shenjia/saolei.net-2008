#!/bin/bash
REPO=/www/saolei.net/deploy/saolei.net-2008
LOG=/www/saolei.net/deploy/git.log

echo "-------------------------------------" >> $LOG
date >> $LOG
cd $REPO
OLD_COMMIT=`git log|head -n 1|sed 's/commit //'`
git pull origin test >> $LOG 2>&1
NEW_COMMIT=`git log|head -n 1|sed 's/commit //'`

if [ "$OLD_COMMIT" = "$NEW_COMMIT" ];then
    echo "no new commit!"
else
    echo "$OLD_COMMIT -> $NEW_COMMIT"
fi
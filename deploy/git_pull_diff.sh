#!/bin/bash
REPO=/www/saolei.net/deploy/saolei.net-2008
DEPLOY_LOG=/www/saolei.net/deploy/deploy.log
GIT_LOG=/www/saolei.net/deploy/git.log
NOW=`date +%Y.%m.%d_%H:%m:%S`

cd $REPO

#OLD_COMMIT=`git log|head -n 1|sed 's/commit //'`
#git pull origin test >> $GIT_LOG 2>&1
#NEW_COMMIT=`git log|head -n 1|sed 's/commit //'`

OLD_COMMIT=c2e4f9a7407f570a1ba30f925d64fa6d714f81a8
NEW_COMMIT=b2e91369198fb3de1a7173b7a09702a752112efc

if [ "$OLD_COMMIT" != "$NEW_COMMIT" ];then
    echo "-----[ $NOW ]-----" >> $DEPLOY_LOG
    echo "(${OLD_COMMIT:0:6}) -> (${NEW_COMMIT:0:6}) " | tee $DEPLOY_LOG
    git diff $OLD_COMMIT $NEW_COMMIT --name-only | tee $DEPLOY_LOG
fi
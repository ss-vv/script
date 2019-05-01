#!/bin/bash
#frank

ENV="/var/gb/op-out-adm-env"
cd $ENV
chown -R gb:gb /var/gb/op-out-adm-env
su gb << EOSU
ENV="/var/gb/op-out-adm-env"
cd $ENV
echo "git reset --hard"
git reset --hard
echo "git fetch --all"
git fetch --all
git checkout .
echo "git pull"
git pull
echo "done"
EOSU

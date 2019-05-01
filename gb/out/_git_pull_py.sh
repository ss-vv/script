#!/bin/bash
#frank
#用途：用于pull外围防御脚本

ENV="/var/gb/op-py"
cd $ENV
chown -R gb:gb /var/gb/op-py
su gb << EOSU
ENV="/var/gb/op-py"
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

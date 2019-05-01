#!/bin/bash

echo $1
file=/var/gb/op-out-$1-env/build/tengine-$1/script/access.lua
echo $file
echo "开启维护页面"
sed -i "24s/false/true/g" $file 


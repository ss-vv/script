#!/bin/bash
SITE_ACCESS=/var/gb/op-out-site-env/build/tengine-site/script/access.lua
ADMIN_ACCESS=/var/gb/build/tengine-adm/script/script/access.lua
echo "取消维护页面"
sed -i "24s/true/false/g" $SITE_ACCESS
sed -i "24s/true/false/g" $ADMIN_ACCESS
echo "nginx reload."
source /var/gb/script/out/nginxReload.sh
echo "done."


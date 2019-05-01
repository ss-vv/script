#!/bin/bash
#frank
#用途：外围所有服务器nginx -s reload
#示例：sh nginxReload.sh site 或 sh nginxReload.sh adm
pssh -h /etc/pssh/$1 -P -I</var/gb/script/out/_nginxReload.sh

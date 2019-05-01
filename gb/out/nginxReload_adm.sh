#!/bin/bash
#frank
#用途：外围所有服务器nginx -s reload
pssh -h /etc/pssh/adm -P -I</var/gb/script/out/_nginxReload_adm.sh

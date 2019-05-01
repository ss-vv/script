#!/bin/bash
#jeff
pssh -h /etc/pssh/$1 -I</var/gb/script/out/_cancel_maintenance.sh
pssh -h /etc/pssh/$1 -I</var/gb/script/out/nginxReload.sh

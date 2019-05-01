#!/bin/bash
if [[ $1 == "cancel" ]]
then
   pssh -H out-test:6343 -I</var/gb/script/out/cancel_maintenance.sh
else
   pssh -H out-test:6343 -I</var/gb/script/out/open_maintenance.sh
fi

pssh -H out-test:6343 -I</var/gb/script/out/nginxReload.sh


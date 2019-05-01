#!/bin/bash
#frank
#用途：所有外围git pull
#示例：sh git_pull.sh site 或sh git_pull.sh adm
pssh -h /etc/pssh/$1 -P -I</var/gb/script/out/_git_pull.sh -t 0


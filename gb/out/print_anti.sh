#!/bin/bash
#frank
#用途：查看外围python防攻击脚本是否有执行
pssh -h /etc/pssh/site -P -I</var/gb/script/out/_print_anti.sh -t 0

#!/bin/bash
#frank
#用途：外围服务器统一docker build
pssh -h /etc/pssh/site -P -I</var/gb/script/out/_out_build.sh -t 0

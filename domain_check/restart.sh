#!/usr/bin/env bash

#cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
#sh $cur_dir/stop.sh
#sleep(3)
#sh $cur_dir/start.sh


# 批量重启
pssh -h /etc/pssh/domain_check -t 10 -i 'supervisorctl  restart domain-check '

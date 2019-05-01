#!/usr/bin/env bash
#建庫後需要執行此腳本刷新數據源以及重新註冊MQ消費者,要不然會影響注單回來。
cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/_variable.sh
RSGB=""
DSGB=""
ASGB="service api service-api"
source $cur_dir/../../common/gb_init_site.sh

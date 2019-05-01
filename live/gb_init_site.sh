#!/usr/bin/env bash
#建庫後需要執行此腳本刷新數據源以及重新註冊MQ消費者,要不然會影響注單回來。
source /var/gb/script/live/_variable.sh
RSGB=""
DSGB=""
ASGB="service api service-api"
source /var/gb/script/common/gb_init_site.sh

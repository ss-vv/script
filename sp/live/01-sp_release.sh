#!/usr/bin/env bash

cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/../../common/color-to-node.sh
source $cur_dir/_variable.sh

# 使用帮助

# 键入回车确认等待
_enter_go_on(){
    _h2 "-----------------------------------------"
    read -p "        请按回车继续..." var
    _h2 "-----------------------------------------"
}

_enter_ok_go_on(){
unset ok
while [[ ! "$ok" == "ok" ]]; do
    read -p "请输入'ok' ,按回车继续：" ok
done
}

line=$1
options_srv='manager service mdcenter schedule
	settlement'
options_app='gather-server play api central'
options_all="$options_srv $options_app"

ITEM=1

# ============= 反注册dubbo，停止tomcat start ===============
_h2 "[ Step ${ITEM} ]: 反注册 APP 的 dubbo 服务..."; let ITEM+=1
_enter_ok_go_on
#source $cur_dir/service_stop_new.sh $line $options_all


_h2 "[ Step ${ITEM} ]: 停止tomcat... "; let ITEM+=1
_enter_ok_go_on
source $cur_dir/tomcat_stop_new.sh $line $options_all


# ---------------- 当更新line3的时候，更新rcenter ---------------------
# sr1 sr2 rcenter共用,只需推送到sr1
if [[ "$line" == "sa3" ]]; then
    _h2 "[ Step ${ITEM} ]: 推送&解压rcenter.war包..."; let ITEM+=1
    _enter_ok_go_on
    source $cur_dir/app_update_new.sh sr1 rcenter
fi


_h2 "[ Step ${ITEM} ]: 推送&解压war包..."; let ITEM+=1
_enter_ok_go_on
source $cur_dir/app_update_new.sh  $line $options_all


_h2 "[ Step ${ITEM} ]: 开启tomcat... $line $options_srv"; let ITEM+=1

_enter_ok_go_on
source $cur_dir/tomcat_start_new.sh $line $options_srv

_h2 "[ Step ${ITEM} ]: 开启tomcat... $line $options_app"; let ITEM+=1
_enter_ok_go_on

source $cur_dir/tomcat_start_new.sh $line $options_app

#!/usr/bin/env bash

cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/../../common/color-to-node.sh
source $cur_dir/_variable.sh

# 使用帮助
_usage_my() {
    _error "" "${1}"
    _info "全量更新指定线别的APP,仅需指定线别。"
    _usage \
        "      ${cur_dir}/$(basename $0)   <WORK_LINE> " "" \
}

# 键入回车确认等待
_enter_go_on(){
    _h2 "--------"
    read -p "请按回车继续..." var
    _h2 "--------"
}


ITEM=1

# ============= 反注册dubbo，停止tomcat start ===============
_h2 "[ Step ${ITEM} ]: 反注册 APP 的 dubbo 服务..."; let ITEM+=1
_enter_go_on
source $cur_dir/service_stop_new.sh $@


_h2 "[ Step ${ITEM} ]: 停止tomcat... "; let ITEM+=1
_enter_go_on
source $cur_dir/tomcat_stop_new.sh $@

# 更新 center
if [[ "$HOSTNAME" == "c" ]]; then
    r_list="r1 r2 r3 r4"
elif [[ "$HOSTNAME" == "cc" ]]; then
    r_list="rr1 rr2 "
fi
for i in $r_list; do
    source $cur_dir/app_update_new.sh $i rcenter
done

#
_h2 "[ Step ${ITEM} ]: 推送&解压war包...==>  "; let ITEM+=1

_enter_go_on
source $cur_dir/app_update_new.sh $@ api-impl-jars


_h2 "[ Step ${ITEM} ]: 开启tomcat...==>   "; let ITEM+=1

_enter_go_on
source $cur_dir/tomcat_start_new.sh $1 cp-schedule schedule service service-api api mdcenter

_enter_go_on

source $cur_dir/tomcat_start_new.sh $1 acenter boss ccenter tcenter mcenter msites lottery-mobile lottery mobile pcenter
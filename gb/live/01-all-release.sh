#!/usr/bin/env bash

cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/../../common/color-to-node.sh
source $cur_dir/_variable.sh

# 使用帮助
_usage_my() {
    _error "" "${1}"
    _info "全量更新指定线别的APP"
    _usage \
        "      /PATH/$(basename $0)   <WORK_LINE> " "" \
        "<WORK_LINE>:    ${ALL_LINES}" ""
}

# 键入回车确认等待
_enter_go_on(){
    _h2 "--------"
    read -p "请按回车继续..." var
    _h2 "--------"
}


# 参数判断，_variable.sh文件的 ALL_LINES 定义现有线别
if [ -z "$1" ];then
    _usage_my "请输入要更新的线别："
    exit 1
fi
if ! echo "$ALL_LINES" | grep -wq "$1" &>/dev/null; then
    _usage_my "${1}: 未知的线别"
    exit 2
fi


ITEM=1
WORK_LINE=a${1}
RCENTER_LINE=r${1}

service_app="schedule service service-api api mdcenter"
work_app="acenter boss ccenter tcenter mcenter msites lottery-mobile lottery mobile pcenter"


# ============= 反注册dubbo，停止tomcat start ===============
_h2 "[ Step ${ITEM} ]: 反注册 APP 的 dubbo 服务...==>$WORK_LINE"; let ITEM+=1
_bold "source $cur_dir/service_stop_new.sh $WORK_LINE"
_enter_go_on
       source $cur_dir/service_stop_new.sh $WORK_LINE



_h2 "[ Step ${ITEM} ]: 停止tomcat...==>$WORK_LINE  "; let ITEM+=1
_bold "source $cur_dir/tomcat_stop_new.sh $WORK_LINE "
_enter_go_on
       source $cur_dir/tomcat_stop_new.sh $WORK_LINE
# ============= end ===============


# ========== rcenter 推送 ==========
_h2 "[ Step ${ITEM} ]: rcenter 发往r全线...==> all "; let ITEM+=1
for i in r1 r2 r3 r4;do
    _bold "source $cur_dir/app_update_new.sh $i rcenter"
    _enter_go_on
           source $cur_dir/app_update_new.sh $i rcenter
done

# ========== 全线包 推送 ==========
_h2 "[ Step ${ITEM} ]: 推送APP...==> all "; let ITEM+=1
    _bold "source $cur_dir/app_update_new.sh $i "
    _enter_go_on
           source $cur_dir/app_update_new.sh $i rcenter

_h2 "[ Step ${ITEM} ]: 推送&解压war包...==>  $WORK_LINE $RCENTER_LINE "; let ITEM+=1
_bold "source $cur_dir/gb_update.sh $WORK_LINE $RCENTER_LINE"
_enter_go_on
       source $cur_dir/gb_update.sh $WORK_LINE $RCENTER_LINE


_h2 "[ Step ${ITEM} ]: 开启tomcat...==> $WORK_LINE  "; let ITEM+=1
_bold "source $cur_dir/gb_tomcat_start.sh $WORK_LINE "
_enter_go_on
       source $cur_dir/gb_tomcat_start.sh $WORK_LINE 



#!/usr/bin/env bash


cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/../../common/color-to-node.sh
source $cur_dir/_variable.sh

_enter_go_on(){
    _h2 "----" "$1" "----"
    read -p "请按回车继续..." var
}


# 停 app 服务
_enter_go_on "\
    source $cur_dir/pb_server_stop.sh $@"
    source $cur_dir/pb_server_stop.sh $@

# 停 tomcat 应用
_enter_go_on "\
    source $cur_dir/pb_tomcat_stop.sh $@"
    source $cur_dir/pb_tomcat_stop.sh $@

# 更新应用包
_enter_go_on "\
    source $cur_dir/pb_update.sh $@"
    source $cur_dir/pb_update.sh $@

# 开启 tomcat 应用
_enter_go_on "\
    source $cur_dir/pb_tomcat_start.sh $@"
    source $cur_dir/pb_tomcat_start.sh $@

#source $cur_dir/pb_web_index.sh $@

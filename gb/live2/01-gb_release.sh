#!/usr/bin/env bash

#
#
#
# ========== variable ==========
cur_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $cur_dir/../../common_B/color-to-node.sh
source $cur_dir/_variable.sh

# ========== function ==========
_usage_my() {
    _error "" "${1}"
    _info "全量更新指定线别的APP"
    _usage \
        "      /PATH/$(basename $0)   <WORK_LINE> " "" \
        "<WORK_LINE>:    ${A_LINES}" ""
}

_enter_go_on(){
    _h2 "----" "$1" "----"
    read -p "请按回车继续..." var
}
# ==========  _main_  ==========
if [ -z "$1" ];then
    _usage_my "请输入要更新的线别："
    exit 1
fi

if ! echo "$A_LINES" | grep -wq "$1" &>/dev/null; then
    _usage_my "${1}: 未知的线别"
    exit 2
fi

ITEM=1

_h1 "[ Step ${ITEM} ]: Stop tomcat服务... ==> Line ${1}"; let ITEM+=1
_enter_go_on "\
source $cur_dir/../../common_B/tomcat-stop-start.sh stop $1 all"
source $cur_dir/../../common_B/tomcat-stop-start.sh stop $1 all

_h1 "[ Step ${ITEM} ]: 推送war包，并解压... ==> Line ${1}"; let ITEM+=1
_enter_go_on "\
source $cur_dir/../../common_B/app-update.sh d $1 ${apps_path}/release"
source $cur_dir/../../common_B/app-update.sh d $1 ${apps_path}/release


# ========== 单独发  测试线 rcenter 部署在cc上 start ==========
if [[ "$HOSTNAME" == "cc" ]]; then
    if [[ $1 == "3" ]]; then
        if [[ -f /var/env/apps/gb/release/rcenter.war ]]; then
            _h2 "[ Step ${ITEM} ]: 单发测试的rcenter...==> cc "; let ITEM+=1
            _bold "unzip -qo /var/env/apps/gb/release/rcenter.war  -d  /var/gb/apps/rcenter"
            _enter_go_on
            rm -rf /var/gb/apps/rcenter/*
            unzip -qo /var/env/apps/gb/release/rcenter.war  -d  /var/gb/apps/rcenter/
        fi
    fi
fi
# ========== 单独发  测试线 rcenter 部署在cc上 stop ==========


_h1 "[ Step ${ITEM} ]: Start tomcat服务... ==> Line ${1}"; let ITEM+=1
_enter_go_on "\
source $cur_dir/../../common_B/tomcat-stop-start.sh start $1 all"
source $cur_dir/../../common_B/tomcat-stop-start.sh start $1 all

_h1 "[ Step ${ITEM} ]: 额外重启 gb_gather-server 和 gb_gather-client 服务... ==> Line ${1}"; let ITEM+=1
ansible a -m shell -a 'rectn gb_gather-server'
ansible t -m shell -a 'rectn gb_gather-client'


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


host_list=$1
file_name='/var/sp/apps/gather-client/WEB-INF/lib/processor-1218-SNAPSHOT.jar'

# 判断推送主机列表
if [[ "$host_list" == "sp-gc" ]]; then
    dest='/var/sp/apps/gc/WEB-INF/lib/processor-1218-SNAPSHOT.jar'
elif [[ "$host_list" == "sp-T-gc" ]]; then
    dest='/var/sp/apps/gc-T/WEB-INF/lib/processor-1218-SNAPSHOT.jar'
else
    echo "Error"
    echo "Usage: $0  <sp-gc|sp-T-gc>"
    exit 1
fi

# 执行推送
if [[ -f $file_name ]]; then
    echo ansible $host_list -m copy -a \'src=$file_name dest=$dest\'
    _enter_go_on
         ansible $host_list -m copy -a  "src=$file_name dest=$dest"
else
    echo "Error：$file_name: 文件不存在。"
fi


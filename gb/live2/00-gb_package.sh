#!/usr/bin/env bash

#
#
#
# ========== variable ==========
cur_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $cur_dir/../../common_B/color-to-node.sh
source $cur_dir/_variable.sh

# 非全量更新，需要设置与旧版本一致
#dubbo_version=`date "+%m%d"`
#rcVersion=`date "+%m%d"`
# ========== function ==========
_enter_go_on(){
    _h2 "----" "$1" "----"
    read -p "请按回车继续..." var
}

# ==========  _main_  ==========
_enter_go_on "source $cur_dir/../../common_B/package.sh"
source $cur_dir/../../common_B/package.sh

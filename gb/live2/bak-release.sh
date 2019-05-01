#!/usr/bin/env bash

# 备份
# ${dist_base_path}/apps/ --> ${dist_base_path}/apps-bak

# ========== variable ==========
cur_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $cur_dir/../../common_B/color-to-node.sh
source $cur_dir/_variable.sh

# ========== function ==========
_usage_my() {
    _error "" "${1}"
    _info "备份指定线别的APP"
    _usage \
        "      /PATH/$(basename $0)   <WORK_LINE> " "" \
        "<WORK_LINE>:    ${A_LINES}" ""
}


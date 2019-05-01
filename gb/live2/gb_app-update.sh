#!/usr/bin/env bash

#
#
#

# ========== variable ==========

# ========== function ==========

# ==========  _main_  ==========
cur_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $cur_dir/../../common_B/color-to-node.sh
source $cur_dir/_variable.sh

source $cur_dir/../../common_B/app-update.sh "$@"

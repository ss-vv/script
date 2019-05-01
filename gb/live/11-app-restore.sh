#!/usr/bin/env bash

#
#
#
cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd )
source $cur_dir/../../common/color-to-node.sh
source $cur_dir/_variable.sh


_bold "source $cur_dir/../../common/app-restore.sh $1 "
       source $cur_dir/../../common/app-restore.sh $1


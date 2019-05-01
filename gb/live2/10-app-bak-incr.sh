#!/usr/bin/env bash

#
#
#
cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd )
source $cur_dir/../../common_B/color-to-node.sh
source $cur_dir/_variable.sh


_bold "" "source $cur_dir/../../common_B/app-bak-incr.sh $1 "
       source $cur_dir/../../common_B/app-bak-incr.sh $1

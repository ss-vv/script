#!/usr/bin/env bash
# -*- coding:utf-8 -*-

# Author: Tim
#
cur_dir="$( cd $(dirname ${BASH_SOURCE[0]}) && pwd )"
# 导入项目变量
source $cur_dir/_variable.sh

source $cur_dir/../../common/app_update_new.sh $@

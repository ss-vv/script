#!/usr/bin/env bash

cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
rcVersion=`date "+%Y%m%d%H%M%S"`
source $cur_dir/_variable.sh

dubbo_version=`date "+%m%d%H"`
# dubbo_version=090614
source $cur_dir/package_batch.sh

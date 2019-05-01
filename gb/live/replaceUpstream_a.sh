#!bin/bash
#frank
#用途：用于关闭a-->>R线路
#使用方法：sh replaceUpstream_a.sh c 1 关闭线路,sh replaceUpstream_a.sh o 1
cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/_variable.sh
source $cur_dir/../../common/replaceUpstream_a.sh
$cur_dir/gb_reload.sh $AS

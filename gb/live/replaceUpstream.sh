#frank
#用途：用于关闭R或T到A上面的请求
#使用方法：c 1
cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/_variable.sh
source $cur_dir/../../common/replaceUpstream.sh
source $cur_dir/tengine_reload.sh $RS
source $cur_dir/tengine_reload.sh $TS

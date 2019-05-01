cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/_variable.sh
source $cur_dir/../../common/replaceUpstream.sh
source $cur_dir/tengine_reload.sh $RS
source $cur_dir/tengine_reload.sh $TS

cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/_variable.sh
RSRP=$3
RSTG=$3
source $cur_dir/../../common/replaceUpstream.sh $@
source $cur_dir/../../common/tengine_reload.sh $RS
source $cur_dir/../../common/tengine_reload.sh $TS


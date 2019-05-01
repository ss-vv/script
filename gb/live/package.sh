cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
dubbo_version=`date "+%m%d%H"`
#dubbo_version=081515
rcVersion=`date "+%Y%m%d%H%M%S"`
source $cur_dir/_variable.sh
source $cur_dir/package_batch.sh

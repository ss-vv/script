cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
dubbo_version=`date "+pb-%Y%m%d%H%M%S"`
rcVersion=$dubbo_version
source $cur_dir/_variable.sh
source $cur_dir/package_batch.sh

cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
dubbo_version=`date "+pb-%m%d%H"`
rcVersion=$dubbo_version
source $cur_dir/_variable.sh
source $cur_dir/package_batch.sh

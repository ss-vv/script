cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/dev/_variable.sh
source $cur_dir/dev/package_batch.sh
source $cur_dir/dev/gb_tomcat_stop.sh $@
source $cur_dir/dev/gb_update.sh $@
source $cur_dir/dev/gb_tomcat_start.sh $@

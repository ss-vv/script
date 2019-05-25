cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/_variable.sh
source $cur_dir/service_stop_new.sh $@
source $cur_dir/tomcat_stop_new.sh $@
source $cur_dir/sp_update.sh $@
source $cur_dir/tomcat_start_new.sh $@
#source $cur_dir/sp_web_index.sh $@


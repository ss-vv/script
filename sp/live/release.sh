cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/_variable.sh
source $cur_dir/sp_server_stop.sh $@
source $cur_dir/sp_tomcat_stop.sh $@
source $cur_dir/sp_update.sh $@
source $cur_dir/sp_tomcat_start.sh $@
#source $cur_dir/sp_web_index.sh $@

cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/_variable.sh
#source $cur_dir/pb_server_stop.sh $@
source $cur_dir/pb_tomcat_stop.sh $@
source $cur_dir/pb_update.sh $@
source $cur_dir/pb_tomcat_start.sh $@
#source $cur_dir/pb_web_index.sh $@

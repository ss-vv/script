#Use:用于stop T上面的gather-client
#Time：2017-10-24
#Author：Frank
#source /var/gb/script/$env/_variable.sh

cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/_variable.sh
source $cur_dir/../../common/gather_client_tomcat_stop.sh

cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/_variable.sh
source $cur_dir/../../common/gb_update_one.sh $@
echo "等待8秒钟"
sleep 8 
source $cur_dir/gb_web_index_one.sh $@

source /var/gb/script/pro/_variable.sh
source /var/gb/script/pro/gb_server_stop_one.sh $@
source /var/gb/script/common/gb_update_one.sh $@
echo "等待8秒钟"
sleep 8
source /var/gb/script/pro/gb_web_index_one.sh $@

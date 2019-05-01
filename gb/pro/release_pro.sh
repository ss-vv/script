source /var/gb/script/pro/_variable.sh
source /var/gb/script/pro/gb_server_stop.sh $@
source /var/gb/script/pro/gb_tomcat_stop.sh $@
source /var/gb/script/pro/gb_update.sh $@
source /var/gb/script/pro/gb_tomcat_start.sh $@
source /var/gb/script/pro/gb_web_index.sh $@

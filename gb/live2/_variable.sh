base_path='/var/env'
dist_base_path='/var/gb'
username="root"
env="live2"
project="gb"
port="22"
gb_create_path=$base_path'/script/gb/live/gb_create.sh '
tengine_create_path=$base_path'/script/gb/live/tengine_create.sh '
gb_restart_path=$base_path'/script/gb/live/gb_restart.sh'
tengine_restart_path=$base_path'/script/gb/live/tengine_restart.sh'
trd_create_path=$base_path'/script/gb/live/'

RS="rr1 rr2"
DS="dd1 dd2 dd3"
AS="aa1 aa2 aa3"
TS="tt1 tt2"
RSIP=(rr1 rr2)
DSIP=(dd1 dd2 dd3)
ASIP=(aa1 aa2 aa3)
TSIP=(tt1 tt2)
RSGB="fserver"
DSGB=""
ASGB="ccenter msites pcenter acenter tcenter mcenter boss mdcenter cp-schedule\
    schedule service api gather-server mobile service-api lottery lottery-mobile"
TSGB="gather-client"
DSPKG=""

RSTG="ccenter msites pcenter acenter tcenter mcenter boss \
    mdcenter rcenter fserver mobile lottery lottery-mobile"
RSRP="ccenter msites pcenter acenter tcenter mcenter boss \
    mdcenter rcenter fserver mobile lottery lottery-mobile"
TSRP="api-callback api gather"
RSTC="nginx-api nginx-inner nginx-inner-$env nginx-msite \
    nginx-pay nginx-rcenter nginx-gather mobile lottery lottery-mobile"
ASTC="nginx-api nginx-msite nginx-pay"

# App package
#  pay-impl-jars 独立，增量脚本 app-bak-incr.sh app-update.sh 用到
ASPKG_EX="pay-impl-jars"
ASPKG="ccenter msites pcenter acenter tcenter mcenter boss mdcenter \
    schedule service api gather-server api-impl-jars \
    mobile service-api lottery lottery-mobile cp-schedule"
RSPKG="fserver rcenter"
TSPKG="gather-client"
ALLPKG="acenter api boss ccenter fserver mcenter mdcenter msites \
    pcenter schedule service tcenter gather-server gather-client \
    mobile service-api lottery lottery-mobile cp-schedule"

DS3RD="postgres redis zookeeper"
AS3RD="mongo mq"


####################### docker 17.06 swarm mode #######################
# 判断使用docker版本,主要是容器名问题，
docker_new='true'

# for package.sh
apps_path="$base_path/apps/$project"

# for ngx-upstream.sh
NGX_CFG_DIR="${dist_base_path}/conf"
UPSTREAM_FILE="http_backhost.conf"

A_LINES="1 2 3"
R_LINES="r"
T_LINES="t"
# tomcat
A_SERVICE="api boss-cta-center gather-server lottery lottery-mobile cp-schedule \
    mcenter mdcenter mobile msites pcenter service service-api schedule"
R_SERVICE="fserver rcenter"
T_SERVICE="gather-client"
# nginx
R_NGX="tcenter-ngx mobile-ngx mdcenter-ngx lottery-mobile-ngx ccenter-ngx \
    rcenter-ngx pcenter-ngx msites-ngx mcenter-ngx lottery-ngx fserver-ngx \
    boss-ngx acenter-ngx"
T_NGX="api-callback-ngx gather-tngx pay-ngx api-ngx"


####################### tomcat APP #######################
# ,分隔
REDIS_INFO='rd_dd1-m:6379,rd_dd1-s:6379,rd_dd2-m:6379,rd_dd2-s:6379,rd_dd3-m:6379,rd_dd3-s:6379'
# ,分隔
ZOO_INFO='zk_zoo-dd1:2181,zk_zoo-dd2:2181,zk_zoo-dd3:2181'
# ；分隔  注意！！！
MQ_INFO="mq_aa1-m:9876;mq_aa1-s:9876;mq_aa2-m:9876;mq_aa2-s:9876;mq_aa3-m:9876;mq_aa3-s:9876"
FSERVER='http://fserver-ngx:80'

# ================= api =================
gather_zookeeper_node_prefix='inner'

# ================= gather =================
gather_version='1.0'
# ,分隔
gather_zookeeper_url_client='182.16.67.252:92,182.16.62.161:92'
gather_zookeeper_url_server="${ZOO_INFO}"
# 空格分隔 注意！！！
gather_zookeeper_node_nginx='182.16.67.252:61 182.16.67.252:62 182.16.67.252:63 182.16.62.161:61 182.16.62.161:62 182.16.62.161:63'

# duboo
zookeeper_url="${ZOO_INFO}"
dubbo_version=`date "+%m%d%H"`


# ================= fserver =================
filesite_url="${FSERVER}/fserver"
file_upload_tmp='/data/upload/tmp'
file_upload_data='/data/upload/data'

# web
dubbo_port='30001'
dubbo_provider_delay='30000'
website_uri='{site.context.path}'
ressite_uri='/rcenter${site.res}'
comressite_uri='/rcenter/common'
imgsite_uri='/fserver'
mdsite_uri='{site.context.path}/mdcenter/${mdsite.comet}.comet'
mdsite_ip='gb-mdcenter'
freemaker_template_root_path="${FSERVER}/ftl/"

# ================= rocketmq =================
rocketMQ_namesrvAddr="${MQ_INFO}"
rdb_dir='/var/data/mq/rdb'

# ================= redis =================
# 单机配置；单机集群不能并存
data_redis_host=''
pageCache_redis_host=''
shiro_session_host=''
shiro_auth_host=''
gameApi_redis_host=''
gather_redis_host=''
# 集群配置
data_redis_hosts="${REDIS_INFO}"
pageCache_redis_hosts="${REDIS_INFO}"
shiro_session_hosts="${REDIS_INFO}"
shiro_auth_hosts="${REDIS_INFO}"
gameApi_redis_hosts="${REDIS_INFO}"
gather_redis_hosts="${REDIS_INFO}"

# ================= postgresql =================
password_decrypt='true'

# boss
bossDataSource_url='jdbc:postgresql://60.199.165.130:5407/gb-boss?characterEncoding=UTF-8'
bossDataSource_username='gb-boss'
bossDataSource_password='j6k2hd4Er36YNVOD0CzexhIFGtTQuwGipZHcaaaEAHvugQ9fFHXs/Mi/nDa/99EGtogNxN6lMWhQ3iS/oW5aTQ=='

# companies
mainsiteDataSource_url='jdbc:postgresql://60.199.165.130:5407/gb-companies?characterEncoding=UTF-8'
mainsiteDataSource_username='gb-companies'
mainsiteDataSource_password='FejXJM95G9u/j2fD5z22yZLk66ynz+nm3y5TLSX9uhKMnyirOzMTf2f2aqN4GTFBYVbA0CLneiEpkTWn4kJT9g=='

# stat
statDataSource_url='jdbc:postgresql://60.199.165.130:5407/gb-stat?characterEncoding=UTF-8'
statDataSource_username='gb-stat'
statDataSource_password='X1xkkQQoboVPlp37LLDJ66GeR1krgGb7ySOG+iYzNhTSj2ma/8PPm/EhdWEoagA9Iek0kC+BgBJWoK/XQ6QKAA=='

# apiLog
apiLogDataSource_url='jdbc:postgresql://60.199.165.130:5407/gb-boss?characterEncoding=UTF-8'
apiLogDataSource_username='gb-boss'
apiLogDataSource_password='j6k2hd4Er36YNVOD0CzexhIFGtTQuwGipZHcaaaEAHvugQ9fFHXs/Mi/nDa/99EGtogNxN6lMWhQ3iS/oW5aTQ=='

# history
historyDataSource_url='jdbc:postgresql://60.199.165.130:5407/gamebox-history?characterEncoding=UTF-8'
historyDataSource_username='postgres'
historyDataSource_password='postgresqltest'

# backup
backupDataSource_url='jdbc:postgresql://60.199.165.130:5407/gamebox-backup?characterEncoding=UTF-8'
backupDataSource_username='postgres'
backupDataSource_password='postgresqltest'

# ================= mongodb =================
mongodb_url='127.0.0.1:27017'
mongodb_host='127.0.0.1'
mongodb_port='27017'

# ================= IDC归属地 =================
belong_idc='B'
IDC_LOW='b'

# idc间同步数据url
sync_idc_url='https://gbboss.com:1344/boss/sync/idc.html'

# ---------- web-ds-conf.properties  Start 20171014----------
#彩票试玩模式
ds_id_model_lottery='70'
#站长模拟帐号模式
ds_id_model_mock_account='64'
#综合站试玩模式
ds_id_model_platform='63'
# ---------- web-ds-conf.properties  End 20171014----------

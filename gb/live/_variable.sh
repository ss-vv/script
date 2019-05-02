base_path='/var/env'
dist_base_path='/var/gb'
username="root"
env="live"
project="gb"
port="22"
gb_create_path=$base_path'/script/gb/live/gb_create.sh '
tengine_create_path=$base_path'/script/gb/live/tengine_create.sh '
gb_restart_path=$base_path'/script/gb/live/gb_restart.sh'
tengine_restart_path=$base_path'/script/gb/live/tengine_restart.sh'
trd_create_path=$base_path'/script/gb/live/'

RS="r1 r2 r3 r4"
DS="d1 d2 d3 d4 d5 d6"
AS="a1 a2 a3 a4 a5 a6"
TS="t1 t2"
RSIP=(r1 r2 r3 r4)
# 仅为 schedule
DSIP=(d1 d2 d3 d4 d5 d6)
ASIP=(a1 a2 a3 a4 a5 a6)
ALL_LINES='1 2 3 4 5 6'
TSIP=(t1 t2)
RSGB="fserver"
DSGB="schedule cp-schedule"
ASGB="msites pcenter mcenter boss-cta-center mdcenter gather-server mobile api service-api service lottery lottery-mobile schedule cp-schedule"
TSGB="api-callback"
RSPKG="fserver rcenter"
DSPKG=""
TSGC="gather-client"

#  pay-impl-jars 独立，增量脚本 app-bak-incr.sh 用到
ASPKG_EX="pay-impl-jars schedule cp-schedule"
ASPKG="ccenter msites pcenter acenter tcenter mcenter boss mdcenter api-impl-jars gather-server mobile api service-api service lottery lottery-mobile schedule cp-schedule"
TSPKG="api-callback gather-client"
RSTG="acenter boss ccenter fserver lottery-mobile lottery mcenter mdcenter mobile msites pcenter rcenter tcenter"
RSRP="ccenter msites pcenter acenter tcenter mcenter boss mdcenter api api-callback rcenter fserver mobile lottery lottery-mobile"
RSTC="nginx-api nginx-inner nginx-inner-$env nginx-msite nginx-pay nginx-rcenter nginx-gather mobile lottery lottery-mobile"
ASTC="nginx-api nginx-msite nginx-pay"
TSTC="api-callback api gather"
ALLPKG="ROOT msites mobile-api  acenter boss-api ccenter fserver main-service message-service pcenter service-activity tengine-fserver api boss-service consumer-service lottery mcenter mobile mreport-service service-api zook boss cache-service cp-schedule lt-service mdcenter schedule tcenter lottery-mobile"
DS3RD="postgres redis zookeeper"
AS3RD="mongo mq"


# ----------------------------------------------------





# fserver
filesite_url='http://gb-fserver:80/fserver'
file_upload_tmp='/data/upload/tmp'
file_upload_data='/data/upload/data'

# duboo
# d1,d2,d3
#zookeeper_url='zookeeper-gb.d11:2181,zookeeper-gb.d12:2181,zookeeper-gb.d21:2181,zookeeper-gb.d22:2181,zookeeper-gb.d31:2181,zookeeper-gb.d32:2181'
# d5,d5,d7
zookeeper_url='zookeeper-gb.d51:2181,zookeeper-gb.d52:2181,zookeeper-gb.d61:2181,zookeeper-gb.d62:2181,zookeeper-gb.d71:2181,zookeeper-gb.d72:2181'
#dubbo_version=`date "+%Y%m%d%H%M%S"`
#dubbo_version='3030303030'

# redis
data_redis_host=''
pageCache_redis_host=''
shiro_session_host=''
shiro_auth_host=''
gameApi_redis_host=''
gather_redis_host=''

#d1,d2,d3
#data_redis_hosts='redis-gb.d1m:6379,redis-gb.d1s1:6379,redis-gb.d1s2:6379,redis-gb.d2m:6379,redis-gb.d2s1:6379,redis-gb.d2s2:6379,redis-gb.d3m:6379,redis-gb.d3s1:6379,redis-gb.d3s2:6379'
#pageCache_redis_hosts='redis-gb.d1m:6379,redis-gb.d1s1:6379,redis-gb.d1s2:6379,redis-gb.d2m:6379,redis-gb.d2s1:6379,redis-gb.d2s2:6379,redis-gb.d3m:6379,redis-gb.d3s1:6379,redis-gb.d3s2:6379'
#shiro_session_hosts='redis-gb.d1m:6379,redis-gb.d1s1:6379,redis-gb.d1s2:6379,redis-gb.d2m:6379,redis-gb.d2s1:6379,redis-gb.d2s2:6379,redis-gb.d3m:6379,redis-gb.d3s1:6379,redis-gb.d3s2:6379'
#shiro_auth_hosts='redis-gb.d1m:6379,redis-gb.d1s1:6379,redis-gb.d1s2:6379,redis-gb.d2m:6379,redis-gb.d2s1:6379,redis-gb.d2s2:6379,redis-gb.d3m:6379,redis-gb.d3s1:6379,redis-gb.d3s2:6379'
#gameApi_redis_hosts='redis-gb.d1m:6379,redis-gb.d1s1:6379,redis-gb.d1s2:6379,redis-gb.d2m:6379,redis-gb.d2s1:6379,redis-gb.d2s2:6379,redis-gb.d3m:6379,redis-gb.d3s1:6379,redis-gb.d3s2:6379'
#gather_redis_hosts='redis-gb.d1m:6379,redis-gb.d1s1:6379,redis-gb.d1s2:6379,redis-gb.d2m:6379,redis-gb.d2s1:6379,redis-gb.d2s2:6379,redis-gb.d3m:6379,redis-gb.d3s1:6379,redis-gb.d3s2:6379'

#d5,d6,d7
data_redis_hosts='redis-gb.d5m:6379,redis-gb.d5s1:6379,redis-gb.d5s2:6379,redis-gb.d6m:6379,redis-gb.d6s1:6379,redis-gb.d6s2:6379,redis-gb.d7m:6379,redis-gb.d7s1:6379,redis-gb.d7s2:6379'
pageCache_redis_hosts='redis-gb.d5m:6379,redis-gb.d5s1:6379,redis-gb.d5s2:6379,redis-gb.d6m:6379,redis-gb.d6s1:6379,redis-gb.d6s2:6379,redis-gb.d7m:6379,redis-gb.d7s1:6379,redis-gb.d7s2:6379'
shiro_session_hosts='redis-gb.d5m:6379,redis-gb.d5s1:6379,redis-gb.d5s2:6379,redis-gb.d6m:6379,redis-gb.d6s1:6379,redis-gb.d6s2:6379,redis-gb.d7m:6379,redis-gb.d7s1:6379,redis-gb.d7s2:6379'
shiro_auth_hosts='redis-gb.d5m:6379,redis-gb.d5s1:6379,redis-gb.d5s2:6379,redis-gb.d6m:6379,redis-gb.d6s1:6379,redis-gb.d6s2:6379,redis-gb.d7m:6379,redis-gb.d7s1:6379,redis-gb.d7s2:6379'
gameApi_redis_hosts='redis-gb.d5m:6379,redis-gb.d5s1:6379,redis-gb.d5s2:6379,redis-gb.d6m:6379,redis-gb.d6s1:6379,redis-gb.d6s2:6379,redis-gb.d7m:6379,redis-gb.d7s1:6379,redis-gb.d7s2:6379'
gather_redis_hosts='redis-gb.d5m:6379,redis-gb.d5s1:6379,redis-gb.d5s2:6379,redis-gb.d6m:6379,redis-gb.d6s1:6379,redis-gb.d6s2:6379,redis-gb.d7m:6379,redis-gb.d7s1:6379,redis-gb.d7s2:6379'


# web
dubbo_port='30001'
dubbo_provider_delay='30000'
website_uri='{site.context.path}'
ressite_uri='/rcenter${site.res}'
comressite_uri='/rcenter/common'
imgsite_uri='/fserver'
mdsite_uri='{site.context.path}/mdcenter/${mdsite.comet}.comet'
mdsite_ip='gb-mdcenter'
freemaker_template_root_path=http://gb-fserver:80/ftl/

# postgresql
password_decrypt='true'

# boss
bossDataSource_url='jdbc:postgresql://pg-mx.d7:5432/gb-boss?characterEncoding=UTF-8'
bossDataSource_username='gb-boss'
bossDataSource_password='j6k2hd4Er36YNVOD0CzexhIFGtTQuwGipZHcaaaEAHvugQ9fFHXs/Mi/nDa/99EGtogNxN6lMWhQ3iS/oW5aTQ=='

# companies
mainsiteDataSource_url='jdbc:postgresql://pg-mx.d7:5432/gb-companies?characterEncoding=UTF-8'
mainsiteDataSource_username='gb-companies'
mainsiteDataSource_password='FejXJM95G9u/j2fD5z22yZLk66ynz+nm3y5TLSX9uhKMnyirOzMTf2f2aqN4GTFBYVbA0CLneiEpkTWn4kJT9g=='

# stat
statDataSource_url='jdbc:postgresql://pg-mx.d7:5432/gb-stat?characterEncoding=UTF-8'
statDataSource_username='gb-stat'
statDataSource_password='X1xkkQQoboVPlp37LLDJ66GeR1krgGb7ySOG+iYzNhTSj2ma/8PPm/EhdWEoagA9Iek0kC+BgBJWoK/XQ6QKAA=='

# apiLog
apiLogDataSource_url='jdbc:postgresql://pg-mx.d7:5432/gb-companies?characterEncoding=UTF-8'
apiLogDataSource_username='gb-companies'
apiLogDataSource_password='FejXJM95G9u/j2fD5z22yZLk66ynz+nm3y5TLSX9uhKMnyirOzMTf2f2aqN4GTFBYVbA0CLneiEpkTWn4kJT9g=='

# history
historyDataSource_url='jdbc:postgresql://pg-mx.d7:5432/gamebox-history?characterEncoding=UTF-8'
historyDataSource_username='postgres'
historyDataSource_password='postgresqltest'

# backup
backupDataSource_url='jdbc:postgresql://pg-mx.d7:5432/gamebox-backup?characterEncoding=UTF-8'
backupDataSource_username='postgres'
backupDataSource_password='postgresqltest'

# mongodb
mongodb_url='127.0.0.1:27017'
mongodb_host='127.0.0.1'
mongodb_port='27017'

# rocketmq
rocketMQ_namesrvAddr='rocketmq-namesrv.a1:9876;rocketmq-namesrv.a2:9876;rocketmq-namesrv.a3:9876'
rdb_dir='/var/data/mq/rdb'

# gather
gather_version='1.0'
gather_zookeeper_url_client='60.199.195.2:92,60.199.195.145:92'
#gather_zookeeper_url_server='zookeeper-gb.d11:2181,zookeeper-gb.d12:2181,zookeeper-gb.d21:2181,zookeeper-gb.d22:2181,zookeeper-gb.d31:2181,zookeeper-gb.d32:2181'
gather_zookeeper_url_server='zookeeper-gb.d51:2181,zookeeper-gb.d52:2181,zookeeper-gb.d61:2181,zookeeper-gb.d62:2181,zookeeper-gb.d71:2181,zookeeper-gb.d72:2181'
gather_zookeeper_node_nginx='60.199.195.2:61 60.199.195.2:62 60.199.195.2:63 60.199.195.145:61 60.199.195.145:62 60.199.195.145:63'

# api
gather_zookeeper_node_prefix='inner'

#IDC归属地
belong_idc='A'

# idc间同步数据url
sync_idc_url='https://second.gbboss.com:1344/boss/sync/idc.html'

# ---------- web-ds-conf.properties  Start 20171014----------
#彩票试玩模式
ds_id_model_lottery='116'
#站长模拟帐号模式
ds_id_model_mock_account='62'
#综合站试玩模式
ds_id_model_platform='61'
# ---------- web-ds-conf.properties  End 20171014----------


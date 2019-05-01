base_path='/var/gb'
dist_base_path='/var/gb'
username="root"
env="pro"
port="22"
gb_create_path='/var/gb/script/gb_create.sh '
tengine_create_path='/var/gb/script/tengine_create.sh '
gb_restart_path='/var/gb/script/gb_restart.sh'
tengine_restart_path='/var/gb/script/tengine_restart.sh'
trd_create_path='/var/gb/script/'

RS="r1 r2"
DS="d1 d2 d3"
AS="a1 a2 a3"
RSIP=(r1 r2)
DSIP=(d1 d2 d3)
ASIP=(a1 a2 a3)
RSGB="fserver gather-client"
DSGB="schedule monitor"
ASGB="ccenter msites pcenter acenter tcenter mcenter boss mdcenter service api  gather-server service-api mobile"
RSPKG="fserver ftl rcenter gather-client"
DSPKG="schedule monitor sql"
ASPKG="ccenter msites pcenter acenter tcenter mcenter boss mdcenter service api api-impl-jars pay-impl-jars gather-server service-api mobile"
RSTG="ccenter msites pcenter acenter tcenter mcenter boss mdcenter api rcenter fserver api-pay-outer outer  gather-server mobile"
RSTC="nginx-api nginx-api-pay-outer-$env nginx-inner nginx-inner-$env nginx-msite nginx-outer-$env nginx-pay nginx-rcenter  nginx-gather mobile"
ALLPKG="acenter api boss ccenter fserver mcenter mdcenter monitor msites pcenter schedule service tcenter gather-server  gather-client service-api mobile"
DS3RD="postgres redis zookeeper"
AS3RD="mongo mq"


# fserver
filesite_url='http://gb-fserver:80/fserver'
file_upload_tmp='/data/upload/tmp'
file_upload_data='/data/upload/data'

# duboo
zookeeper_url='zookeeper-gb.d11:2181,zookeeper-gb.d12:2181,zookeeper-gb.d21:2181,zookeeper-gb.d22:2181,zookeeper-gb.d31:2181,zookeeper-gb.d32:2181'

# redis
data_redis_host=''
pageCache_redis_host=''
shiro_session_host=''
shiro_auth_host=''
gameApi_redis_host=''

data_redis_hosts='redis-gb.d1m:6379,redis-gb.d1s1:6379,redis-gb.d1s2:6379,redis-gb.d2m:6379,redis-gb.d2s1:6379,redis-gb.d2s2:6379,redis-gb.d3m:6379,redis-gb.d3s1:6379,redis-gb.d3s2:6379'
pageCache_redis_hosts='redis-gb.d1m:6379,redis-gb.d1s1:6379,redis-gb.d1s2:6379,redis-gb.d2m:6379,redis-gb.d2s1:6379,redis-gb.d2s2:6379,redis-gb.d3m:6379,redis-gb.d3s1:6379,redis-gb.d3s2:6379'
shiro_session_hosts='redis-gb.d1m:6379,redis-gb.d1s1:6379,redis-gb.d1s2:6379,redis-gb.d2m:6379,redis-gb.d2s1:6379,redis-gb.d2s2:6379,redis-gb.d3m:6379,redis-gb.d3s1:6379,redis-gb.d3s2:6379'
shiro_auth_hosts='redis-gb.d1m:6379,redis-gb.d1s1:6379,redis-gb.d1s2:6379,redis-gb.d2m:6379,redis-gb.d2s1:6379,redis-gb.d2s2:6379,redis-gb.d3m:6379,redis-gb.d3s1:6379,redis-gb.d3s2:6379'
gameApi_redis_hosts='redis-gb.d1m:6379,redis-gb.d1s1:6379,redis-gb.d1s2:6379,redis-gb.d2m:6379,redis-gb.d2s1:6379,redis-gb.d2s2:6379,redis-gb.d3m:6379,redis-gb.d3s1:6379,redis-gb.d3s2:6379'

# web
dubbo_port='30001'
dubbo_provider_delay='30000'
website_uri='http://{0}:80{site.context.path}'
ressite_uri='http://{0}:80/rcenter${site.res}'
comressite_uri='http://{0}:80/rcenter/common'
imgsite_uri='http://{0}:80/fserver'
mdsite_uri='http://{0}:80{site.context.path}/mdcenter/${mdsite.comet}.comet'
mdsite_ip='gb-mdcenter'
freemaker_template_root_path=http://gb-fserver:80/ftl/

# postgresql
password_decrypt='false'

# boss
bossDataSource_url='jdbc:postgresql://postgres-gb.d1:5432/gb-boss?characterEncoding=UTF-8'
bossDataSource_username='gb-boss'
bossDataSource_password='j6k2hd4Er36YNVOD0CzexhIFGtTQuwGipZHcaaaEAHvugQ9fFHXs/Mi/nDa/99EGtogNxN6lMWhQ3iS/oW5aTQ=='

# companies
mainsiteDataSource_url='jdbc:postgresql://postgres-gb.d1:5432/gb-companies?characterEncoding=UTF-8'
mainsiteDataSource_username='gb-companies'
mainsiteDataSource_password='FejXJM95G9u/j2fD5z22yZLk66ynz+nm3y5TLSX9uhKMnyirOzMTf2f2aqN4GTFBYVbA0CLneiEpkTWn4kJT9g=='

# stat
statDataSource_url='jdbc:postgresql://postgres-gb.d1:5432/gb-stat?characterEncoding=UTF-8'
statDataSource_username='gb-stat'
statDataSource_password='X1xkkQQoboVPlp37LLDJ66GeR1krgGb7ySOG+iYzNhTSj2ma/8PPm/EhdWEoagA9Iek0kC+BgBJWoK/XQ6QKAA=='

# history
historyDataSource_url='jdbc:postgresql://postgres-gb.d1:5432/gamebox-history?characterEncoding=UTF-8'
historyDataSource_username='postgres'
historyDataSource_password='postgresqltest'

# backup
backupDataSource_url='jdbc:postgresql://postgres-gb.d1:5432/gamebox-backup?characterEncoding=UTF-8'
backupDataSource_username='postgres'
backupDataSource_password='postgresqltest'

# mongodb
mongodb_url='192.168.33.4:27017'
mongodb_host='192.168.33.4'
mongodb_port='27017'

# rocketmq
rocketMQ_namesrvAddr='rocketmq-namesrv.a1:9876;rocketmq-namesrv.a2:9876;rocketmq-namesrv.a3:9876'
rdb_dir='/var/data/mq/rdb'

# gather
gather_version='1.0'
gather_zookeeper_url_client='192.168.0.104:92,192.168.0.105:92'
gather_zookeeper_url_server='zookeeper-gb.d11:2181,zookeeper-gb.d12:2181,zookeeper-gb.d21:2181,zookeeper-gb.d22:2181,zookeeper-gb.d31:2181,zookeeper-gb.d32:2181'
gather_zookeeper_node_nginx='192.168.0.104:61 192.168.0.104:62 192.168.0.104:63 192.168.0.105:61 192.168.0.105:62 192.168.0.105:63'

# api
gather_zookeeper_node_prefix='inner'

#彩票试玩模式
ds.id.model.lottery=1

#站长模拟帐号模式
ds.id.model.mock.account=1

#综合站试玩模式
ds.id.model.platform=1

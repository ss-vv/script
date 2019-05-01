base_path='/var/env'
dist_base_path='/var/gb'
username="root"
env="test"
project="gb"
port="6343"
gb_create_path=$base_path'/script/gb/test/gb_create.sh '
tengine_create_path=$base_path'/script/gb/test/tengine_create.sh '
gb_restart_path=$base_path'/script/gb/test/gb_restart.sh'
tengine_restart_path=$base_path'/script/gb/test/tengine_restart.sh'
trd_create_path=$base_path'/script/gb/test/'

RS="r1"
DS="d1"
AS="a1"
RSIP=(test)
DSIP=(test)
ASIP=(test91)
RSGB="fserver gather-client"
DSGB=""
ASGB="ccenter msites pcenter acenter tcenter mcenter boss mdcenter service api  gather-server service-api mobile lottery lottery-mobile schedule cp-schedule"
RSPKG="fserver rcenter gather-client"
DSPKG="sql"
ASPKG="ccenter msites pcenter acenter tcenter mcenter boss mdcenter service api api-impl-jars pay-impl-jars gather-server service-api mobile lottery lottery-mobile schedule cp-schedule"
RSTG="ccenter msites pcenter acenter tcenter mcenter boss mdcenter api rcenter fserver api-pay-outer outer  gather-server mobile lottery lottery-mobile"
RSTC="nginx-api nginx-api-pay-outer-$env nginx-inner nginx-inner-$env nginx-msite nginx-outer-$env nginx-pay nginx-rcenter nginx-gather mobile"
ALLPKG="acenter api boss ccenter fserver mcenter mdcenter msites pcenter service tcenter gather-server gather-client service-api mobile lottery lottery-mobile schedule cp-schedule"
DS3RD="postgres redis zookeeper"
AS3RD="mongo mq"


# fserver
filesite_url='http://gb-fserver:80/fserver'
file_upload_tmp='/data/upload/tmp'
file_upload_data='/data/upload/data'

# duboo
zookeeper_url='zookeeper-gb.d1:2181'
dubbo_version='1.0.0.0'

# redis
data_redis_host='redis-gb.d1m'
pageCache_redis_host='redis-gb.d1m'
shiro_session_host='redis-gb.d1m'
shiro_auth_host='redis-gb.d1m'
gameApi_redis_host='redis-gb.d1m'

data_redis_hosts=''
pageCache_redis_hosts=''
shiro_session_hosts=''
shiro_auth_hosts=''
gameApi_redis_hosts=''

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
bossDataSource_url='jdbc:postgresql://pg-gb.test:5432/gb-boss?characterEncoding=UTF-8'
bossDataSource_username='gb-boss'
bossDataSource_password='kn/tL9oSogpf9UdunDBNQ6ctA2UDOnQKWQqMLjb6ofyIJ/rxEjWly+7l0HSBePneWFSk1snOsyLkdHVusg9qvg=='

# companies
mainsiteDataSource_url='jdbc:postgresql://pg-gb.test:5432/gb-companies?characterEncoding=UTF-8'
mainsiteDataSource_username='gb-companies'
mainsiteDataSource_password='dX8Ht1x+9bWSLXSoX+DCN6oewkMyWuwvHkY2UWydn0gT37hWJq3GBvysEzECyO5jL3XkVwLU/IVcE8gCRX0u1Q=='

# companies
apiLogDataSource_url='jdbc:postgresql://pg-gb.test:5432/gb-companies?characterEncoding=UTF-8'
apiLogDataSource_username='gb-companies'
apiLogDataSource_password='dX8Ht1x+9bWSLXSoX+DCN6oewkMyWuwvHkY2UWydn0gT37hWJq3GBvysEzECyO5jL3XkVwLU/IVcE8gCRX0u1Q=='

# stat
statDataSource_url='jdbc:postgresql://pg-gb.test:5432/gb-stat?characterEncoding=UTF-8'
statDataSource_username='gb-stat'
statDataSource_password='i6E2tk9WHKTWLOtJuKJopvvclfgWXCQTekNXupN9vfQ5OiYgQ0S5/3IEMa2vS6+p6BUw65piHvLBDvK83Su2/A=='

# history
historyDataSource_url='jdbc:postgresql://pg-gb.test:5432/gamebox-history?characterEncoding=UTF-8'
historyDataSource_username='postgres'
historyDataSource_password='postgresqltest'

# backup
backupDataSource_url='jdbc:postgresql://pg-gb.test:5432/gamebox-backup?characterEncoding=UTF-8'
backupDataSource_username='postgres'
backupDataSource_password='postgresqltest'

# mongodb
mongodb_url='192.168.33.4:27017'
mongodb_host='192.168.33.4'
mongodb_port='27017'

# rocketmq
rocketMQ_namesrvAddr='rocketmq-gb.a1:9876'
rdb_dir='/var/data/mq/rdb'

# gather
gather_version='1.0'
gather_zookeeper_url_client='192.168.0.92:92'
gather_zookeeper_url_server='zookeeper-gb.d1:2181'
gather_zookeeper_node_nginx='192.168.0.92:61'

# api
gather_zookeeper_node_prefix='inner'

# idc间同步数据url
sync_idc_url='http://boss.test.so/boss/sync/idc.html'

#Water add begin 171011
#彩票试玩模式
ds_id_model_lottery='22'

#站长模拟帐号模式
ds_id_model_mock_account='22'

#综合站试玩模式
ds_id_model_platform='22'

#Water add end 171011

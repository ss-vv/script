base_path='/var/gb'
username="root"
env="dev"
port="22"
gb_create_path='/var/gb/script/gb_create.sh '
tengine_create_path='/var/gb/script/tengine_create.sh '
gb_restart_path='/var/gb/script/gb_restart.sh'
tengine_restart_path='/var/gb/script/tengine_restart.sh'
trd_create_path='/var/gb/script/'

RS="r1"
DS="d1"
AS="a1"
RSIP=(s88)
DSIP=(s88)
ASIP=(s88)
RSGB="fserver gather-client"
DSGB="schedule monitor"
ASGB="ccenter msites pcenter acenter tcenter mcenter boss mdcenter service api  gather-server service-api mobile"
RSPKG="fserver ftl rcenter gather-client"
DSPKG="schedule monitor sql"
ASPKG="ccenter msites pcenter acenter tcenter mcenter boss mdcenter service api api-impl-jars pay-impl-jars gather-server service-api mobile"
RSTG="ccenter msites pcenter acenter tcenter mcenter boss mdcenter api rcenter fserver api-pay-outer outer  gather-server mobile"
RSTC="nginx-api nginx-api-pay-outer-$env nginx-inner nginx-inner-$env nginx-msite nginx-outer-$env nginx-pay nginx-rcenter nginx-gather mobile"
ALLPKG="acenter api boss ccenter fserver mcenter mdcenter monitor msites pcenter schedule service tcenter gather-server gather-client service-api mobile"
DS3RD="postgres redis zookeeper"
AS3RD="mongo mq"


# fserver
filesite_url='http://192.168.0.101:80/fserver'
file_upload_tmp='/data/upload/tmp'
file_upload_data='/data/upload/data'

# duboo
zookeeper_url='192.168.0.88:2181'
dubbo_version='APITEST'

# redis
data_redis_host='192.168.0.88'
pageCache_redis_host='192.168.0.88'
shiro_session_host='192.168.0.88'
shiro_auth_host='192.168.0.88'
gameApi_redis_host='192.168.0.88'

data_redis_hosts=''
pageCache_redis_hosts=''
shiro_session_hosts=''
shiro_auth_hosts=''
gameApi_redis_hosts=''

# web
dubbo_port='30001'
dubbo_provider_delay='30000'
website_uri='http://{0}:80{site.context.path}'
ressite_uri='http://{0}:80/rcenter${site.res}'
comressite_uri='http://{0}:80/rcenter/common'
imgsite_uri='/fserver'
mdsite_uri='http://{0}:80{site.context.path}/mdcenter/${mdsite.comet}.comet'
mdsite_ip='gb-mdcenter'
freemaker_template_root_path=http://192.168.0.101:80/ftl/

# postgresql
password_decrypt='true'

# boss
bossDataSource_url='jdbc:postgresql://192.168.0.88:5432/gb-boss?characterEncoding=UTF-8'
bossDataSource_username='gb-boss'
bossDataSource_password='j6k2hd4Er36YNVOD0CzexhIFGtTQuwGipZHcaaaEAHvugQ9fFHXs/Mi/nDa/99EGtogNxN6lMWhQ3iS/oW5aTQ=='

# companies
mainsiteDataSource_url='jdbc:postgresql://192.168.0.88:5432/gb-companies?characterEncoding=UTF-8'
mainsiteDataSource_username='gb-companies'
mainsiteDataSource_password='FejXJM95G9u/j2fD5z22yZLk66ynz+nm3y5TLSX9uhKMnyirOzMTf2f2aqN4GTFBYVbA0CLneiEpkTWn4kJT9g=='

# stat
statDataSource_url='jdbc:postgresql://192.168.0.88:5432/gb-stat?characterEncoding=UTF-8'
statDataSource_username='gb-stat'
statDataSource_password='X1xkkQQoboVPlp37LLDJ66GeR1krgGb7ySOG+iYzNhTSj2ma/8PPm/EhdWEoagA9Iek0kC+BgBJWoK/XQ6QKAA=='

# history
historyDataSource_url='jdbc:postgresql://192.168.0.88:5432/gamebox-history?characterEncoding=UTF-8'
historyDataSource_username='postgres'
historyDataSource_password='postgresqltest'

# backup
backupDataSource_url='jdbc:postgresql://192.168.0.88:5432/gamebox-backup?characterEncoding=UTF-8'
backupDataSource_username='postgres'
backupDataSource_password='postgresqltest'

# mongodb
mongodb_url='192.168.0.88:27017'
mongodb_host='192.168.0.88'
mongodb_port='27017'

# rocketmq
rocketMQ_namesrvAddr='192.168.0.88:9876'
rdb_dir='/var/data/mq/rdb'

# gather
gather_version='1.0'
gather_zookeeper_url_client='192.168.0.88:2181'
gather_zookeeper_url_server='192.168.0.88:2181'
gather_zookeeper_node_nginx='192.168.0.101:61'

# api
gather_zookeeper_node_prefix='inner'

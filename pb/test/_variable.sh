base_path='/var/env'
dist_base_path='/var/pb'
username="root"
env="test"
project="pb"
port="22"
gb_create_path=$base_path'/script/pb/test/pb_create.sh '
tengine_create_path=$base_path'/script/pb/test/tengine_create.sh '
gb_restart_path=$base_path'/script/pb/test/pb_restart.sh'
tengine_restart_path=$base_path'/script/pb/test/tengine_restart.sh'
trd_create_path=$base_path'/script/pb/test/'

TS="t1"
RS="r1"
DS="d1"
AS="a1"
TSIP=(test)
RSIP=(test)
DSIP=(test)
ASIP=(test91)
RSGB=""
DSGB=""
ASGB="site center boss mdcenter service"
RSPKG="rcenter"
DSPKG=""
ASPKG="ROOT paycenter payboss mdcenter service pay-impl-jars"
RSTG="site center boss pay"
RSTC=""
ALLPKG="ROOT paycenter payboss mdcenter service rcenter"
DS3RD=""
AS3RD=""
CPPKG="sql.war rcenter.war pay-impl-jars.war"


# fserver
filesite_url='http://gb-fserver:80/fserver'
file_upload_tmp='/data/upload/tmp'
file_upload_data='/data/upload/data'

# duboo
zookeeper_url='zookeeper-gb.d1:2181'
dubbo_version='pb-1.0.0.0'

# redis
data_redis_host='redis-gb.d1m'
shiro_session_host='redis-gb.d1m'
shiro_auth_host='redis-gb.d1m'
redis_port=6379

# web
dubbo_port='30001'
dubbo_provider_delay='30000'
website_uri='http://{0}:80{site.context.path}'
ressite_uri='http://{0}:80/rcenter${site.res}'
comressite_uri='http://{0}:80/rcenter/common'
imgsite_uri='/fserver'
mdsite_uri='http://{0}:80{site.context.path}/mdcenter/${mdsite.comet}.comet'
mdsite_ip='pb-mdcenter'

# postgresql
password_decrypt='true'

# boss
bossDataSource_url='jdbc:postgresql://pg-pb:5432/pb-boss?characterEncoding=UTF-8'
bossDataSource_username='pb-boss'
bossDataSource_password='B0dz0kOfuH68VFtKvyuB5FXVBLAhGGh76+w3qUyrFYsOYjzJ+QhUG+dW8MtjhQDwpywfe+H64TYpmu36NwOjRg=='

# stat
statDataSource_url='jdbc:postgresql://pg-pb:5432/pb-stat?characterEncoding=UTF-8'
statDataSource_username='pb-stat'
statDataSource_password='dOesSIB/ubLscSXB1is115NuzlCJeDEHGz/881xmnb9W1W987xFaIPrtIaLu6QzJzzXni5W5CRVhhjlKBAgN/Q=='

# rocketmq
rocketMQ_namesrvAddr='rocketmq-gb.a1:9876'
rdb_dir='/var/data/mq/rdb'


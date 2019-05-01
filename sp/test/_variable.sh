base_path='/var/env'
dist_base_path='/var/sp'
username="root"
env="test"
project="sp"
port="6343"
gb_create_path=$base_path'/script/sp/test/sp_create.sh '
tengine_create_path=$base_path'/script/sp/test/tengine_create.sh '
gb_restart_path=$base_path'/script/sp/test/sp_restart.sh'
tengine_restart_path=$base_path'/script/sp/test/tengine_restart.sh'
trd_create_path=$base_path'/script/sp/test/'

TS="t1"
RS="r1"
DS="d1"
AS="a1"
TSIP=(pb)
RSIP=(pb)
DSIP=(pb)
ASIP=(pb)
RSGB=""
DSGB=""
ASGB="play manager api service"
RSPKG="rcenter"
DSPKG=""
ASPKG="ROOT manager api service"
RSTG="play manager rcenter"
RSTC=""
ALLPKG="ROOT manager api service rcenter"
DS3RD=""
AS3RD=""
CPPKG="sql.war rcenter.war"


# fserver
filesite_url='http://{0}/gb-fserver/fserver'
file_upload_tmp='/data/upload/tmp'
file_upload_data='/data/upload/data'

# duboo
zookeeper_url='zookeeper-gb.d1:2181'
dubbo_version='sp-1.0.0.0'

# redis
data_redis_host='redis-gb.d1m'
pageCache_redis_host='redis-gb.d1m'
shiro_session_host='redis-gb.d1m'
shiro_auth_host='redis-gb.d1m'

# web
dubbo_port='30001'
dubbo_provider_delay='30000'
website_uri='http://{0}{site.context.path}'
ressite_uri='http://{0}/rcenter${site.res}'
comressite_uri='http://{0}/rcenter/common'
imgsite_uri='/fserver'
mdsite_uri='http://{0}{site.context.path}/mdcenter/${mdsite.comet}.comet'
mdsite_ip='sp-mdcenter'

# postgresql
password_decrypt='false'

# boss
bossDataSource_url='jdbc:postgresql://pg-sp.d1:5432/sp-boss?characterEncoding=UTF-8'
bossDataSource_username='sp-boss'
bossDataSource_password='8qv6UI6Rg0!yNgi1QnIgRNsCgeho$cy6'

# stat
statDataSource_url='jdbc:postgresql://pg-sp.d1:5432/sp-stat?characterEncoding=UTF-8'
statDataSource_username='sp-stat'
statDataSource_password='QVsPN7uRsyBreoNLF83qzud7U559pdLTOFnToKdosflh4Yexq/VARqeTP9e3LNy4O5sfOk8O82LshHfe7eGPsg=='

# rocketmq
rocketMQ_namesrvAddr='rocketmq-gb.a1:9876'
rdb_dir='/var/data/mq/rdb'

# sports play
sports_CollectorURL=http://45.248.69.142:1234/WebService.asmx
data_push_uri=
data_push_domain=
redis_port=6379

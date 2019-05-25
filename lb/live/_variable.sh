base_path='/var/env'
dist_base_path='/var/lb'
username="root"
env="live"
project="lb"
port="22"

RS="sr1 sr2"
DS="sd1 sd2"
AS="sa1 sa2 sa3"
RSIP=(sr1 sr2)
DSIP=(sd1 sd2)
ASIP=(sa1 sa2 sa3)
RSGB=""
DSGB=""
ASGB="hall manager api server cache-service schedule game-schedule mdcenter"
RSPKG="rcenter"
DSPKG=""
ASPKG="hall manager api server cache-service schedule game-schedule mdcenter"
RSTG="play manager rcenter mdcenter"
RSTC=""
ALLPKG="hall manager api server cache-service schedule game-schedule mdcenter"
DS3RD=""
AS3RD=""
CPPKG="sql.war rcenter.war"

# --------------------------------------
docker_new=false

# fserver
filesite_url='http://lb-tengine-fserver/fserver/'
file_upload_tmp='/data/upload/tmp'
file_upload_data='/data/upload/data'

# duboo
zookeeper_url='lb-zook:2181'
dubbo_version='lb-1.0.0.0'

# redis
data_redis_host=''
pageCache_redis_host=''
shiro_session_host=''
shiro_auth_host=''
odds_redis_host=''
api_redis_host=''

# ------------------------------- redis cluster 1 -------------------------------
data_redis_host='lb-redis'
pageCache_redis_host='lb-redis'
shiro_session_host='lb-redis'
shiro_auth_host='lb-redis'
gather_redis_host='lb-redis'
api_redis_host='lb-redis'
# ------------------------------- redis cluster 2 -------------------------------
odds_redis_host='lb-redis'

# web
dubbo_port='30001'
dubbo_provider_delay='30000'
website_uri='{site.context.path}'
ressite_uri='/rcenter${site.res}'
comressite_uri='/rcenter/common'
imgsite_uri='/fserver'
mdsite_uri='{site.context.path}/mdcenter/${mdsite.comet}.comet'
mdsite_ip='lb-mdcenter'

# postgresql
password_decrypt='false'

# boss
bossDataSource_url='jdbc:postgresql://pg-lb:5432/lb-boss?characterEncoding=UTF-8'
bossDataSource_username='lb-manager'
bossDataSource_password='asfwqefadfafWDFwewEFFFwefe'

# stat
statDataSource_url='jdbc:postgresql://pg-lb:5432/lb-stat?characterEncoding=UTF-8'
statDataSource_username='lb-stat'
statDataSource_password='asfwqefadfafWDFwewEFFFwefe'

# rocketmq
rocketMQ_namesrvAddr='lb-mq:9876'
rdb_dir='/var/data/mq/rdb'

data_chain_init=30
data_chain_min=30
data_chain_max=40
command_chain_init=10
data_auto_control=false

base_path='/var/env'
dist_base_path='/var/pb'
username="root"
env="live"
project="pb"
port="22"
gb_create_path=$base_path'/script/pb/test/pb_create.sh '
tengine_create_path=$base_path'/script/pb/test/tengine_create.sh '
gb_restart_path=$base_path'/script/pb/test/pb_restart.sh'
tengine_restart_path=$base_path'/script/pb/test/tengine_restart.sh'
trd_create_path=$base_path'/script/pb/test/'

TS="t1 t2"
RS="r1 r2 r3 r4"
DS="d7"
AS="a1 a2 a3 a4 a5 a6"
TSIP=(t1 t2)
RSIP=(r1 r2 r3 r4)
DSIP=(d7)
ASIP=(a1 a2 a3 a4 a5 a6)
RSGB=""
DSGB=""
ASGB="site center boss mdcenter service"
RSPKG="rcenter"
DSPKG=""
ASPKG_EX='pay-impl-jars'
ASPKG="ROOT paycenter payboss mdcenter service"
RSTG="site center boss rcenter"
RSTC=""
ALLPKG="ROOT paycenter payboss mdcenter service rcenter"
DS3RD=""
AS3RD=""
#  pay-impl-jars.war
CPPKG="sql.war rcenter.warc"


# ========== ngx confi ==========
A_LINES="4 5 6"
# for ngx-upstream.sh
NGX_CFG_DIR="${dist_base_path}/conf"
UPSTREAM_FILE="http_backhost.conf"


# ========== App config ==========
# fserver
filesite_url='http://gb-fserver/fserver'
file_upload_tmp='/data/upload/tmp'
file_upload_data='/data/upload/data'

# duboo
zookeeper_url='zookeeper-gb.d51:2181,zookeeper-gb.d52:2181,zookeeper-gb.d61:2181,zookeeper-gb.d62:2181,zookeeper-gb.d71:2181,zookeeper-gb.d72:2181'
#dubbo_version='pb-1.0.0.0'

# redis
redis_port='6379'
data_redis_hosts='redis-gb.d5m:6379,redis-gb.d5s1:6379,redis-gb.d5s2:6379,redis-gb.d6m:6379,redis-gb.d6s1:6379,redis-gb.d6s2:6379,redis-gb.d7m:6379,redis-gb.d7s1:6379,redis-gb.d7s2:6379'
shiro_session_hosts='redis-gb.d5m:6379,redis-gb.d5s1:6379,redis-gb.d5s2:6379,redis-gb.d6m:6379,redis-gb.d6s1:6379,redis-gb.d6s2:6379,redis-gb.d7m:6379,redis-gb.d7s1:6379,redis-gb.d7s2:6379'
shiro_auth_hosts='redis-gb.d5m:6379,redis-gb.d5s1:6379,redis-gb.d5s2:6379,redis-gb.d6m:6379,redis-gb.d6s1:6379,redis-gb.d6s2:6379,redis-gb.d7m:6379,redis-gb.d7s1:6379,redis-gb.d7s2:6379'

# web
dubbo_port='30001'
dubbo_provider_delay='30000'
website_uri='{site.context.path}'
ressite_uri='/rcenter${site.res}'
comressite_uri='/rcenter/common'
imgsite_uri='/fserver'
mdsite_uri='{site.context.path}/mdcenter/${mdsite.comet}.comet'
mdsite_ip='pb-mdcenter'

# postgresql
password_decrypt='true'

# boss
bossDataSource_url='jdbc:postgresql://pg-pb.d7:5432/pb-boss?characterEncoding=UTF-8'
bossDataSource_username='pb-boss'
bossDataSource_password='chVx+UAoGee2Pm+B1eNKcQTEjLNEqHotFyRSWhWkYkuMdAe012vbLTt0OfoV87yW4pWGOHiVs5TJUvTu/bnrRg=='

# stat
statDataSource_url='jdbc:postgresql://pg-pb.d7:5432/pb-stat?characterEncoding=UTF-8'
statDataSource_username='pb-stat'
statDataSource_password='chVx+UAoGee2Pm+B1eNKcQTEjLNEqHotFyRSWhWkYkuMdAe012vbLTt0OfoV87yW4pWGOHiVs5TJUvTu/bnrRg=='

# rocketmq
rocketMQ_namesrvAddr='rocketmq-namesrv.a1:9876;rocketmq-namesrv.a2:9876;rocketmq-namesrv.a3:9876'
rdb_dir='/var/data/mq/rdb'

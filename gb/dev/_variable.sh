base_path='/var/env'
dist_base_path='/var/gb'
username="root"
env="dev"
project="gb"
port="22"

RS="sr1 sr2"
DS="sd1 sd2"
AS="sa1 sa2 sa3"
RSIP=(sr1 sr2)
DSIP=(sd1 sd2)
ASIP=(sa1 sa2 sa3)
RSGB=""
DSGB=""
ASGB="msites acenter boss-api ccenter fserver main-service message-service pcenter service-activity api boss-service consumer-service lottery mcenter mobile mreport-service service-api boss cache-service cp-schedule lt-service mdcenter mobile-api schedule tcenter lottery-mobile"
RSPKG="rcenter"
DSPKG=""
ASPKG="msites acenter boss-api ccenter fserver main-service message-service pcenter service-activity api boss-service consumer-service lottery mcenter mobile mreport-service service-api boss cache-service cp-schedule lt-service mdcenter mobile-api schedule tcenter"
RSTG="play manager rcenter mdcenter"
RSTC=""
ALLPKG="msites mobile-api  acenter boss-api ccenter fserver main-service message-service pcenter service-activity api boss-service consumer-service lottery mcenter mobile mreport-service service-api boss cache-service cp-schedule lt-service mdcenter schedule tcenter lottery-mobile"
DS3RD=""
AS3RD=""
CPPKG="sql.war rcenter.war"

# --------------------------------------
docker_new=false

# fserver
filesite_url='http://gb-tengine-fserver/fserver'
file_upload_tmp='/data/upload/tmp'
file_upload_data='/data/upload/data'

# duboo
zookeeper_url='gb-zook:2181'
dubbo_version='gb-1.0.0.0'

# redis
data_redis_host=''
pageCache_redis_host=''
shiro_session_host=''
shiro_auth_host=''
odds_redis_host=''
api_redis_host=''

# ------------------------------- redis cluster 1 -------------------------------
data_redis_host='gb-redis'
pageCache_redis_host='gb-redis'
shiro_session_host='gb-redis'
shiro_auth_host='gb-redis'
gather_redis_host='gb-redis'
api_redis_host='gb-redis'
gameApi_redis_host='gb-redis'
# ------------------------------- redis cluster 2 -------------------------------
odds_redis_host='gb-redis'

# web
dubbo_port='30001'
dubbo_provider_delay='30000'
website_uri='{site.context.path}'
ressite_uri='/rcenter${site.res}'
comressite_uri='/rcenter/common'
imgsite_uri='/fserver'
mdsite_uri='{site.context.path}/mdcenter/${mdsite.comet}.comet'
mdsite_ip='gb-mdcenter'

# postgresql
password_decrypt='false'

# boss
bossDataSource_url='jdbc:postgresql://pg-gb.d1:5432/gb-boss?characterEncoding=UTF-8'
bossDataSource_username='gb-boss'
bossDataSource_password='fasdfDAfsfKULHLhlhlHKG'

# companies
mainsiteDataSource_url='jdbc:postgresql://pg-gb.d1:5432/gb-companies?characterEncoding=UTF-8'
mainsiteDataSource_username='gb-companies'
mainsiteDataSource_password='fasdfDAfsfKULHLhlhlHKG'

# stat
statDataSource_url='jdbc:postgresql://pg-gb.d1:5432/gb-stat?characterEncoding=UTF-8'
statDataSource_username='gb-stat'
statDataSource_password='fasdfDAfsfKULHLhlhlHKG'

# rocketmq
rocketMQ_namesrvAddr='gb-mq:9876'
rdb_dir='/var/data/mq/rdb'

# sports play
sports_CollectorURL=http://45.248.69.142:1234/WebService.asmx
data_push_uri=
data_push_domain=
redis_port=6379
redis_odds_key='gb-central'

#采集版本号
gather_version=gb_1.0
#采集系统Zookeeper配置
# gather
gather_version='1.0'
gather_zookeeper_url_client='gb-zook:2181'
#gather_zookeeper_url_server='gb-zook:2181'
gather_zookeeper_url_server='gb-zook:2181'
gather_zookeeper_node_nginx='60.199.195.2:61 60.199.195.2:62 60.199.195.2:63 60.199.195.145:61 60.199.195.145:62 60.199.195.145:63'

#外部通道是否走nginx作反向代理
gather_zookeeper_node='gb-central'

#是否在nginx内部_[true,false]
gather_nginx_channel=true

#发布的节点为:公网(public),内部(inner)
gather_zookeeper_node_prefix='inner'

#gather-client
gather_zookeeper_url_client='gb-zook:2181'
gather_zookeeper_node_prefix_client='public'

#Nginx中代理节点_如果有多个节点请配置多个，节点之间以‘ ’空隔分隔。
#原则上一个服务节点，Nginx中需要启一个TCP 端口与之对应。
#值格式：domain(ip):port
#gather_zookeeper_node_nginx='data2.sports-hg.com:61 data2.sports-hg.com:62 data2.sports-hg.com:63'

#gather_zookeeper_node_nginx='182.16.67.84:61 103.100.140.89:61 103.100.140.86:61 182.16.67.84:62 103.100.140.89:62 103.100.140.86:62 182.16.67.84:63 103.100.140.89:63 103.100.140.86:63'
#gather_zookeeper_node_nginx='182.16.67.84:61 103.100.140.89:62 103.100.140.86:63'
gather_zookeeper_node_nginx='10.0.2.100:9000;140.237.187.175:61'


data_chain_init=30
data_chain_min=30
data_chain_max=40
command_chain_init=10
data_auto_control=false

#集群组信息
gather_cluster_group='central'
gather_user='mutual'
gather_password='mutual'

#包含采集类型_应用于团队开发,可以设置私人测试的采集类型_
#多个类型时,以空格隔开
include_category=102
#用户自定义流程信息
user_flow_list_ids=''

processor_jar_url='file:/usr/local/gather-client/WEB-INF/lib/processor-1218-SNAPSHOT.jar'

protocol=https

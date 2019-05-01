base_path='/var/env'
dist_base_path='/var/sp'
username="root"
env="live"
project="sp"
port="22"

RS="sr1 sr2"
DS="sd1 sd2"
AS="sa1 sa2 sa3"
RSIP=(sr1 sr2)
DSIP=(sd1 sd2)
ASIP=(sa1 sa2 sa3)
RSGB=""
DSGB=""
ASGB="play manager api service mdcenter gather-server central schedule settlement"
RSPKG="rcenter"
DSPKG=""
ASPKG="ROOT manager api service mdcenter gather-server central schedule settlement"
RSTG="play manager rcenter mdcenter"
RSTC=""
ALLPKG="ROOT manager api service mdcenter gather-server gather-client central schedule settlement"
DS3RD=""
AS3RD=""
CPPKG="sql.war rcenter.war"

# --------------------------------------
docker_new=true

# fserver
filesite_url='http://{0}/gb-fserver/fserver'
file_upload_tmp='/data/upload/tmp'
file_upload_data='/data/upload/data'

# duboo
zookeeper_url='sp-zook:2181'
dubbo_version='sp-1.0.0.0'

# redis
data_redis_host=''
pageCache_redis_host=''
shiro_session_host=''
shiro_auth_host=''
odds_redis_host=''
api_redis_host=''

# ------------------------------- redis cluster 1 -------------------------------
data_redis_host='sp-redis'
pageCache_redis_host='sp-redis'
shiro_session_host='sp-redis'
shiro_auth_host='sp-redis'
gather_redis_host='sp-redis'
api_redis_host='sp-redis'
# ------------------------------- redis cluster 2 -------------------------------
odds_redis_host='sp-redis'

# web
dubbo_port='30001'
dubbo_provider_delay='30000'
website_uri='{site.context.path}'
ressite_uri='/rcenter${site.res}'
comressite_uri='/rcenter/common'
imgsite_uri='/fserver'
mdsite_uri='{site.context.path}/mdcenter/${mdsite.comet}.comet'
mdsite_ip='sp-mdcenter'

# postgresql
password_decrypt='false'

# boss
bossDataSource_url='jdbc:postgresql://pg-sp.d1:5432/sp-boss?characterEncoding=UTF-8'
bossDataSource_username='sp-manager'
bossDataSource_password='git clone git@git.gbboss.com:soul/soul'

# stat
statDataSource_url='jdbc:postgresql://pg-sp.d1:5432/sp-stat?characterEncoding=UTF-8'
statDataSource_username='sp-stat'
statDataSource_password='git clone git@git.gbboss.com:soul/soul'

# rocketmq
rocketMQ_namesrvAddr='sp-mq:9876'
rdb_dir='/var/data/mq/rdb'

# sports play
sports_CollectorURL=http://45.248.69.142:1234/WebService.asmx
data_push_uri=
data_push_domain=
redis_port=6379
redis_odds_key='sp-central'

#采集版本号
gather_version=sp_1.0
#采集系统Zookeeper配置
gather_zookeeper_url='sp-zook:2181'
#外部通道是否走nginx作反向代理
gather_zookeeper_node='sp-central'

#是否在nginx内部_[true,false]
gather_nginx_channel=true

#发布的节点为:公网(public),内部(inner)
gather_zookeeper_node_prefix='inner'

#gather-client
gather_zookeeper_url_client='data2.sports-hg.com:92'
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

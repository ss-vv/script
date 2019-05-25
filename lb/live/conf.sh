#!/bin/bash

WEBSITE=$1
app=$2
#source /var/gb/script/$env/_variable.sh
# [base-conf.properties]
if [ -f $WEBSITE"/base-conf.properties" ]; then
# 文件服务器地址
sed -i 's#^filesite.uri=.*$#filesite.uri='"$filesite_url"'#' $WEBSITE/base-conf.properties
fi

# [dubbo-conf.properties]
if [ -f $WEBSITE"/dubbo-conf.properties" ]; then
# Zookeeper的url及端口,多个用半角逗号分隔
sed -i "s/^zookeeper.url=.*$/zookeeper.url=$zookeeper_url/" $WEBSITE/dubbo-conf.properties
# dubbo服务版本号
sed -i "s/^#dubbo.version=.*$/dubbo.version=$dubbo_version/" $WEBSITE/dubbo-conf.properties
sed -i "s/^dubbo.version=.*$/dubbo.version=$dubbo_version/" $WEBSITE/dubbo-conf.properties
sed -i "s/^dubbo.version.api=.*$/dubbo.version.api=$dubbo_version/" $WEBSITE/dubbo-conf.properties
sed -i "s/^dubbo.provider.delay=.*$/dubbo.provider.delay=$dubbo_provider_delay/" $WEBSITE/dubbo-conf.properties

sed -i "s/^redis.odds.version=.*$/redis.odds.version=$redis_odds_key/" $WEBSITE/dubbo-conf.properties
fi

#删除多余的Dubbo Version配置文件
if [ -f $WEBSITE"/dubbo-version-conf.properties" ]; then
    rm -rf $WEBSITE/dubbo-version-conf.properties
fi


# [db.properties]
    # 用户密码是否需要解密
    sed -i 's#^password.decrypt=.*$#password.decrypt='"$password_decrypt"'#' $WEBSITE/db.properties
    # Boss库连接地址
    sed -i 's#^bossDataSource.url=.*$#bossDataSource.url='"$bossDataSource_url"'#' $WEBSITE/db.properties
    # Boss库用户名
    sed -i 's#^bossDataSource.username=.*$#bossDataSource.username='"$bossDataSource_username"'#' $WEBSITE/db.properties
    # Boss库用户密码
    sed -i 's#^bossDataSource.password=.*$#bossDataSource.password='"$bossDataSource_password"'#' $WEBSITE/db.properties




# [redis-conf.properties]
if [ -f $WEBSITE"/redis-conf.properties" ]; then
#echo "hosts $data_redis_hosts"
# 普通数据redis服务器地址
sed -i 's#^data.redis.hosts=.*$#data.redis.hosts='"$data_redis_hosts"'#' $WEBSITE/redis-conf.properties
# 页面静态化redis服务器地址
sed -i 's#^pageCache.redis.hosts=.*$#pageCache.redis.hosts='"$pageCache_redis_hosts"'#' $WEBSITE/redis-conf.properties
# api数据redis服务器地址
sed -i 's#^api.token.hosts=.*$#api.token.hosts='"$api_redis_hosts"'#' $WEBSITE/redis-conf.properties
# Web session redis服务器地址
sed -i 's#^shiro.session.hosts=.*$#shiro.session.hosts='"$shiro_session_hosts"'#' $WEBSITE/redis-conf.properties
# Shiro权限数据redis服务器地址
sed -i 's#^shiro.auth.hosts=.*$#shiro.auth.hosts='"$shiro_auth_hosts"'#' $WEBSITE/redis-conf.properties
# Gather数据redis服务器地址
sed -i 's#^gather.redis.hosts=.*$#gather.redis.hosts='"$gather_redis_hosts"'#' $WEBSITE/redis-conf.properties

# 体育赔率数据redis服务器地址
sed -i 's#^odds.redis.hosts=.*$#odds.redis.hosts='"$odds_redis_hosts"'#' $WEBSITE/redis-conf.properties

fi

# [redis-conf.properties]
if [ -f $WEBSITE"/redis-conf.properties" ]; then
#echo "host $data_redis_host"
# 普通数据redis服务器地址
sed -i 's#^data.redis.host=.*$#data.redis.host='"$data_redis_host"'#' $WEBSITE/redis-conf.properties
# 页面静态化redis服务器地址
sed -i 's#^pageCache.redis.host=.*$#pageCache.redis.host='"$pageCache_redis_host"'#' $WEBSITE/redis-conf.properties
# api数据redis服务器地址
sed -i 's#^api.token.host=.*$#api.token.host='"$api_redis_host"'#' $WEBSITE/redis-conf.properties
# Web session redis服务器地址
sed -i 's#^shiro.session.host=.*$#shiro.session.host='"$shiro_session_host"'#' $WEBSITE/redis-conf.properties
# Shiro权限数据redis服务器地址
sed -i 's#^shiro.auth.host=.*$#shiro.auth.host='"$shiro_auth_host"'#' $WEBSITE/redis-conf.properties
# Gather数据redis服务器地址
sed -i 's#^gather.redis.host=.*$#gather.redis.host='"$gather_redis_host"'#' $WEBSITE/redis-conf.properties

# 体育赔率数据redis服务器地址
sed -i 's#^odds.redis.host=.*$#odds.redis.host='"$odds_redis_host"'#' $WEBSITE/redis-conf.properties

fi

 
# [web-base-conf.properties]
if [ -f $WEBSITE"/web-base-conf.properties" ]; then
# Dubbo端口
sed -i 's#^dubbo.port=.*$#dubbo.port='"$dubbo_port"'#' $WEBSITE/web-base-conf.properties 
# 各站点地址模板
sed -i 's#^website.uri=.*$#website.uri='"$website_uri"'#' $WEBSITE/web-base-conf.properties 
# 静态资源地址模板
sed -i 's#^ressite.uri=.*$#ressite.uri='"$ressite_uri"'#' $WEBSITE/web-base-conf.properties
# 公共资源地址模板
sed -i 's#^comressite.uri=.*$#comressite.uri='"$comressite_uri"'#' $WEBSITE/web-base-conf.properties
# 图片上传资源地址
sed -i 's#^imgsite.uri=.*$#imgsite.uri='"$imgsite_uri"'#' $WEBSITE/web-base-conf.properties
# 消息中心comet地址模板
sed -i 's#^mdsite.uri=.*$#mdsite.uri='"$mdsite_uri"'#' $WEBSITE/web-base-conf.properties
# 消息中心地址
sed -i 's#^mdsite.ip=.*$#mdsite.ip='"$mdsite_ip"'#' $WEBSITE/web-base-conf.properties
# 资源文件版本
sed -i 's#^rcenter.version=.*$#rcenter.version='"$rcVersion"'#' $WEBSITE/web-base-conf.properties

# 站点(msites)页面模板文件存放的目录
sed -i 's#^freemaker.template.root.path=.*$#freemaker.template.root.path='"$freemaker_template_root_path"'#' $WEBSITE/web-base-conf.properties

fi

# [service-conf.properties]
if [ -f $WEBSITE"/service-conf.properties" ]; then
# mongoDb服务器地址和端口
sed -i 's#^mongodb.url=.*$#mongodb.url='"$mongodb_url"'#' $WEBSITE/service-conf.properties
# 消息队列服务器地址和端口
sed -i 's#^rocketMQ.namesrvAddr=.*$#rocketMQ.namesrvAddr='"$rocketMQ_namesrvAddr"'#' $WEBSITE/service-conf.properties
# 消息队列本地异常信息存放目录
sed -i 's#^local.store.db.home=.*$#local.store.db.home='"$rdb_dir"'#' $WEBSITE/service-conf.properties
#配置替换Api-Jar的目录为空
sed -i "s/^#gameboxApi.jarRootPath=.*$/gameboxApi.jarRootPath=/" $WEBSITE/service-conf.properties
# 机房编号
sed -i 's#^belong.idc=.*$#belong.idc='"$belong_idc"'#' $WEBSITE/service-conf.properties
fi


# [uploadConst.properties]
if [ -f $WEBSITE"/uploadConst.properties" ]; then
# 文件上传的临时目录
sed -i 's#^tempPath=.*$#tempPath='"$file_upload_tmp"'#' $WEBSITE/uploadConst.properties
# 文件上传的最终目录
sed -i 's#uploadPath=.*$#uploadPath='"$file_upload_data"'#' $WEBSITE/uploadConst.properties
fi

# 消息队列服务器地址和端口
if [ -f $WEBSITE"/boss-conf.properties" ]; then
sed -i 's#^rocketMQ.namesrvAddr=.*$#rocketMQ.namesrvAddr='"$rocketMQ_namesrvAddr"'#' $WEBSITE/boss-conf.properties
fi

# 消息队列服务器地址和端口
if [ -f $WEBSITE"/mdcenter-mq-conf.properties" ]; then
sed -i 's#^rocketMQ.namesrvAddr=.*$#rocketMQ.namesrvAddr='"$rocketMQ_namesrvAddr"'#' $WEBSITE/mdcenter-mq-conf.properties
fi

# [mongo-conf.properties]
if [ -f $WEBSITE"/mongo-conf.properties" ]; then
# mongoDb服务器地址
sed -i 's#^mongodb.host=.*$#mongodb.host='"$mongodb_host"'#' $WEBSITE/mongo-conf.properties
# mongoDb服务器端口
sed -i 's#^mongodb.port=.*$#mongodb.port='"$mongodb_port"'#' $WEBSITE/mongo-conf.properties
fi


# [monitor-conf.properties]
if [ -f $WEBSITE"/monitor-conf.properties" ]; then
# 消息队列服务器地址和端口
sed -i 's#^rocketMQ.namesrvAddr=.*$#rocketMQ.namesrvAddr='"$rocketMQ_namesrvAddr"'#' $WEBSITE/monitor-conf.properties
# 消息队列本地异常信息存放目录
sed -i 's#^local.store.db.home=.*$#local.store.db.home='"$rdb_dir"'#' $WEBSITE/monitor-conf.properties
fi

# [central-conf.properties]
if [ -f $WEBSITE"/central-conf.properties" ]; then
# 消息队列服务器地址和端口
sed -i 's#^rocketMQ.namesrvAddr=.*$#rocketMQ.namesrvAddr='"$rocketMQ_namesrvAddr"'#' $WEBSITE/central-conf.properties
# 消息队列本地异常信息存放目录
sed -i 's#^local.store.db.home=.*$#local.store.db.home='"$rdb_dir"'#' $WEBSITE/central-conf.properties
fi

# 结算容器配置
# [settlement-conf.properties]
if [ -f $WEBSITE"/settlement-conf.properties" ]; then
# 消息队列服务器地址和端口
sed -i 's#^rocketMQ.namesrvAddr=.*$#rocketMQ.namesrvAddr='"$rocketMQ_namesrvAddr"'#' $WEBSITE/settlement-conf.properties
# 消息队列本地异常信息存放目录
sed -i 's#^local.store.db.home=.*$#local.store.db.home='"$rdb_dir"'#' $WEBSITE/settlement-conf.properties
fi

#game-api采集器配置
# [gather-conf.properties]
if [ -f $WEBSITE"/gather-conf.properties" ]; then
# Zookeeper的url及端口,多个用半角空格分隔
if [ "$app" == "gather-client" ]; then
    #echo sed -i 's#^gather.zookeeper.url=.*$#gather.zookeeper.url='"$gather_zookeeper_url_client"'#' $WEBSITE/gather-conf.properties
    sed -i 's#^gather.zookeeper.url=.*$#gather.zookeeper.url='"$gather_zookeeper_url_client"'#' $WEBSITE/gather-conf.properties
    sed -i 's#^gather.zookeeper.node.prefix=.*$#gather.zookeeper.node.prefix='"$gather_zookeeper_node_prefix_client"'#' $WEBSITE/gather-conf.properties
    sed -i "s/^gather.zookeeper.node=.*$/gather.zookeeper.node="$gather_zookeeper_node"/" $WEBSITE/gather-conf.properties
    sed -i 's#^gather.user=.*$#gather.user='"$app"'#' $WEBSITE/gather-conf.properties
    sed -i "s/^gather.password=.*$/gather.password="$app"/" $WEBSITE/gather-conf.properties
    sed -i "s/^gather.cluster.group=.*$/gather.cluster.group="$app"/" $WEBSITE/gather-conf.properties
fi
if [ "$app" == "manager" ] || [ "$app" == "gather-server" ]  || [ "$app" == "service" ] || [ "$app" == "api" ]  || [ "$app" == "service-api" ]  || [ "$app" == "central" ] || [ "$app" == "schedule" ]; then
    #echo sed -i 's#^gather.zookeeper.url=.*$#gather.zookeeper.url='"$gather_zookeeper_url_server"'#' $WEBSITE/gather-conf.properties
    # Zookeeper的url及端口,多个用半角空格分隔
    sed -i 's#^gather.zookeeper.url=.*$#gather.zookeeper.url='"$gather_zookeeper_url"'#' $WEBSITE/gather-conf.properties
    sed -i 's#^gather.zookeeper.node.prefix=.*$#gather.zookeeper.node.prefix='"$gather_zookeeper_node_prefix"'#' $WEBSITE/gather-conf.properties
    sed -i "s/^gather.zookeeper.node=.*$/gather.zookeeper.node="$gather_zookeeper_node"/" $WEBSITE/gather-conf.properties
    sed -i 's#^gather.user=.*$#gather.user='"$app"'#' $WEBSITE/gather-conf.properties
    sed -i "s/^gather.password=.*$/gather.password="$app"/" $WEBSITE/gather-conf.properties
    sed -i "s/^gather.cluster.group=.*$/gather.cluster.group="$app"/" $WEBSITE/gather-conf.properties
fi

# 采集器版本号
sed -i 's#^gather.version=.*$#gather.version='"$gather_version"'#' $WEBSITE/gather-conf.properties
sed -i 's#^processor.jar.url=.*$#processor.jar.url='"$processor_jar_url"'#' $WEBSITE/gather-conf.properties
sed -i 's#^include.category=.*$#include.category='"$include_category"'#' $WEBSITE/gather-conf.properties
sed -i 's#^user.flow.list.ids=.*$#user.flow.list.ids='"$user_flow_list_ids"'#' $WEBSITE/gather-conf.properties

fi


# [base.properties]
if [ -f $WEBSITE"/base.properties" ]; then
sed -i 's#^dubbo.version=.*$#dubbo.version='"$dubbo_version"'#' $WEBSITE/base.properties
# 反向代理采集的nginx的地址
sed -i 's#^gather.zookeeper.node.nginx=.*$#gather.zookeeper.node.nginx='"$gather_zookeeper_node_nginx"'#' $WEBSITE/base.properties
# 是否由nginx反向代理
sed -i 's#^gather.nginx.channel=.*$#gather.nginx.channel='"true"'#' $WEBSITE/base.properties
# 访问级别
sed -i 's#^gather.zookeeper.node.prefix=.*$#gather.zookeeper.node.prefix='"inner"'#' $WEBSITE/base.properties
# zookeeper节点前缀
sed -i "s/^gather.service.port=.*$/gather.service.port=9000/" $WEBSITE/base.properties

sed -i "s/^data.chain.init=.*$/data.chain.init="$data_chain_init"/" $WEBSITE/base.properties
sed -i "s/^data.chain.min=.*$/data.chain.min="$data_chain_min"/" $WEBSITE/base.properties
sed -i "s/^data.chain.max=.*$/data.chain.max="$data_chain_max"/" $WEBSITE/base.properties
sed -i "s/^command.chain.init=.*$/command.chain.init="$command_chain_init"/" $WEBSITE/base.properties
sed -i "s/^gather.cluster.group=.*$/gather.cluster.group="$gather_cluster_group"/" $WEBSITE/base.properties
sed -i "s/^include.category=.*$/include.category="$include_category"/" $WEBSITE/base.properties

sed -i "s/^gather.version=.*$/gather.version="$gather_version"/" $WEBSITE/base.properties
sed -i "s/^gather.zookeeper.url=.*$/gather.zookeeper.url="$gather_zookeeper_url"/" $WEBSITE/base.properties
sed -i "s/^gather.zookeeper.node=.*$/gather.zookeeper.node="$gather_zookeeper_node"/" $WEBSITE/base.properties

#gather.password
sed -i "s|^gather.password=.*$|gather.password=$gather_password|" $WEBSITE/base.properties
#gather.user
sed -i "s|^gather.user=.*$|gather.user=$gather_user|" $WEBSITE/base.properties

fi

# [boss-conf.properties]
if [ -f $WEBSITE"/boss-conf.properties" ]; then
    # idc间同步数据的url
    sed -i 's#^sync.idc.url=.*$#sync.idc.url='"$sync_idc_url"'#' $WEBSITE/boss-conf.properties
fi

if [ -f $WEBSITE"/central-conf.properties" ]; then
    # mq cache
    sed -i 's#^local.store.db.home=.*$#local.store.db.home=/var/data/mq/rdb#' $WEBSITE/central-conf.properties
fi

# ---------- web-ds-conf.properties  Start 20171014----------
# [web-ds-conf.properties]
if [ -f $WEBSITE"/web-ds-conf.properties" ]; then
    sed -i "s|^ds.id.model.lottery=.*$|ds.id.model.lottery=${ds_id_model_lottery}|"  $WEBSITE/web-ds-conf.properties
    sed -i "s|^ds.id.model.mock.account=.*$|ds.id.model.mock.account=${ds_id_model_mock_account}|"  $WEBSITE/web-ds-conf.properties
    sed -i "s|^ds.id.model.platform=.*$|ds.id.model.platform=${ds_id_model_platform}|"  $WEBSITE/web-ds-conf.properties
fi
# ----------   web-ds-conf.properties  End 20171014 ----------


# [api-conf.properties]
if [ -f $WEBSITE"/api-conf.properties" ]; then
    sed -i "s|^protocol=.*$|protocol=${protocol}|"  $WEBSITE/api-conf.properties
fi
# ----------   api-conf.properties  End 20180217 ----------


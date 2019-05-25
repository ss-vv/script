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
if [ -f $WEBSITE"/db-conf.properties" ]; then
    # 用户密码是否需要解密
    sed -i 's#^password.decrypt=.*$#password.decrypt='"$password_decrypt"'#' $WEBSITE/db-conf.properties
    # Boss库连接地址
    sed -i 's#^bossDataSource.url=.*$#bossDataSource.url='"$bossDataSource_url"'#' $WEBSITE/db-conf.properties
    # Boss库用户名
    sed -i 's#^bossDataSource.username=.*$#bossDataSource.username='"$bossDataSource_username"'#' $WEBSITE/db-conf.properties
    # Boss库用户密码
    sed -i 's#^bossDataSource.password=.*$#bossDataSource.password='"$bossDataSource_password"'#' $WEBSITE/db-conf.properties
fi



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
if [ -f $WEBSITE"/mq-conf.properties" ]; then
sed -i 's#^rocketMQ.namesrvAddr=.*$#rocketMQ.namesrvAddr='"$rocketMQ_namesrvAddr"'#' $WEBSITE/boss-conf.properties
fi


# [base.properties]
if [ -f $WEBSITE"/base.properties" ]; then
sed -i 's#^dubbo.version=.*$#dubbo.version='"$dubbo_version"'#' $WEBSITE/base.properties
fi



cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
apps_path="$base_path/apps/$project"


dubbo_version=`date "+%Y%m%d%H%M%S"`
rcVersion=`date "+%Y%m%d%H%M%S"`
source $cur_dir/_variable.sh
source $cur_dir/package_batch.sh

rm -rf $apps_path/work/api/WEB-INF/classes/conf/service-conf.properties
rm -rf $apps_path/work/service/WEB-INF/classes/conf/service-conf.properties
rm -rf /var/gb/apps/dev/impl-jars/api/*
rm -rf /var/gb/apps/dev/impl-jars/pay/*
rm -rf /var/gb/apps/dev/rcenter/*


cp -rf $apps_path/work/service/*  /var/gb/apps/dev/1.service/
cp -rf $apps_path/work/api/*      /var/gb/apps/dev/2.api/
cp -rf $apps_path/work/boss/*     /var/gb/apps/dev/boss/
unzip -q $apps_path/packages/api-impl-jars.war     -d /var/gb/apps/dev/impl-jars/api/
unzip -q $apps_path/packages/pay-impl-jars.war     -d /var/gb/apps/dev/impl-jars/pay/
unzip -q $apps_path/packages/rcenter.war     -d /var/gb/apps/dev/rcenter/

docker exec gb-server.dev /bin/sh -c "/usr/local/sbin/restart.sh"

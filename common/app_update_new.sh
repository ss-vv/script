#!/usr/bin/env bash
# -*- coding:utf-8 -*-

# Author: Tim
#
cur_dir_com="$( cd $(dirname ${BASH_SOURCE[0]}) && pwd )"
# 导入脚本所在目录下存在函数功能文件function.sh，
source ${cur_dir_com}/function.sh


# 需要更新的服务器为host
host=$1
shift
# -------- 控制机的目录 --------
work_host="${username}@${host}:${port}"
apps_path="${base_path}/apps/${project}/release"

# -------- tomcat节点的目录 --------
# 获取线别 ${host: -1}
if [[ "$HOSTNAME" == "cc" ]] ||  [[ "$HOSTNAME" == "sc" ]]; then
    dist_app_dir="${dist_base_path}/apps/line${host: -1}"
    dist_bak_dir="${dist_base_path}/bak-app/line${host: -1}"
else
    dist_app_dir="${dist_base_path}/apps/"
    dist_bak_dir="${dist_base_path}/bak-app/"
fi
dist_war_dir="/tmp/packages/"
# ---------------------------------

# 清除目标host的 war 包目录
pssh_cmd="mkdir -p $dist_war_dir $dist_app_dir $dist_bak_dir && rm -f ${dist_war_dir}/*.war"
pssh_with_info

# 第一个参数被shift掉后， 只剩下后续的参数是APP，循环之，执行正确不显示输出信息，错误则输出
for app in $@;do
    (
	if [[ "$app" == 'play' ]]; then
            app='ROOT'
        fi
	if [[ "$app" == 'rcenter' ]] || [[ "$app" == 'gather-client' ]]; then
            dist_app_dir="${dist_base_path}/apps/"
            dist_bak_dir="${dist_base_path}/bak-app/"
        fi

        # 1. 从控制机scp war包到host；
        echo scp -P ${port} ${apps_path}/${app}.war   ${work_host%:*}:${dist_war_dir}/
             scp -P ${port} ${apps_path}/${app}.war   ${work_host%:*}:${dist_war_dir}/ > /dev/null

        # rcenter例外，会保留多个dubbo_version的历史版本；
        if [[ $app != "rcenter" ]]; then

            # 2. rsync备份APP；
            pssh_cmd="touch ${dist_app_dir}/${app}/bak_time_stamp  &&  rsync -a --delete ${dist_app_dir}/${app}/ ${dist_bak_dir}/${app}/"
            pssh_with_info

             # 3. 清空旧版本应用；
            pssh_cmd="rm -rf ${dist_app_dir}/${app}/*"
            pssh_with_info
        fi

        # 4. pssh到host，执行解压war；
        pssh_cmd="unzip -qod  ${dist_app_dir}/${app}/ ${dist_war_dir}/${app}.war"
        pssh_with_info
    ) &
    sleep 1
done
wait

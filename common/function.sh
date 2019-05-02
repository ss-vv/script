#!/usr/bin/env bash

#
# Author: Tim
#
# 通用函数

# --------------------------------------------
# 通过 host 和app 获取容器名
# 接受2个参数
function get_container_name(){
    host_name=$1
    app_name=$2
    project=${project:-gb}
    if [[ $HOSTNAME == "c" ]]; then
        if [[ $2 == boss ]] || [[ $2 == acenter ]] || [[ $2 == ccenter ]] || [[ $2 == tcenter ]]; then
            app_name="boss-cta-center"
        fi
    fi

    if [[ $docker_new == true ]]; then
         return_str="${project}_${app_name}-${host_name: -1}-b"
       # return_str="${project}-${app_name}"
    else
         return_str="${project}-${app_name}.${host_name}"
       # return_str="${project}-${app_name}"
    fi
    echo $return_str
}

# --------------------------------------------
# 通过 app 获取关闭 dubbo 的命令
function get_dubbo_off(){
    app_name=$1
    case $app_name in
        msites|mobile)
            ex_uri="/"
        ;;
        lottery-mobile)
            ex_uri=lottery
        ;;
        *)
            ex_uri=$1
        esac
    return_str="curl -s http://localhost:8080/${ex_uri}/destroy/serviceStop | grep success"
    echo $return_str
}

# --------------------------------------------
#
function pssh_with_info(){

    eval pssh -H $work_host -t 1000 -i   '${pssh_cmd}' > /dev/null
    if [[ $? == "0" ]]; then
        echo -e "\033[32m     " pssh -H $work_host -t 1000 -i \'${pssh_cmd}\' "\033[0m"
    else
        echo -e "\033[31m     " pssh -H $work_host -t 1000 -i \'${pssh_cmd}\' "\033[0m"
    fi
}
# --------------------------------------------

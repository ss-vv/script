#!/usr/bin/env bash
#用途：用于关闭R或T到A上面的请求
#使用方法：c 1
cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/../../common/color-to-node.sh
source $cur_dir/_variable.sh

#
#
#
# ========== function ==========
_usage_my() {
    _error "" "${1}"
    _info "注释/开启 nginx的upstream对应的App服务，需指定线别..."
    _usage \
        "      /PATH/$(basename $0)   <COMMAND>    <WORK_LINE>    <WORK_SRV>..." "" \
        "<COMMAND>:  仅支持 open|o 或 close|c " \
        "<WORK_LINE>:    ${A_LINES}"
}

# 重启ngx
_ngx_reload () {
    for var in "$@"; do
        cindex=0
        for   s  in   $RS; do
            if [ "$s" == "$var" ]; then
                server=${RSIP[$cindex]}
                for   app  in   $RSTG; do
                       if [[ $app != 'api' ]]; then
                           echo pssh -H $username@$server:$port -t 1000 -i 'docker exec pb-tengine-'$app'.'$var' /bin/sh -c "nginx -s reload"'
                                pssh -H $username@$server:$port -t 1000 -i 'docker exec pb-tengine-'$app'.'$var' /bin/sh -c "nginx -s reload"'
                       fi
                done
            fi
            cindex=$(($cindex+1))
        done
    
        tindex=0
        for   s  in   $TS; do
            if [ "$s" == "$var" ]; then
                server=${TSIP[$tindex]}
                for   app  in   $RSTG; do
                       if [[ $app == 'api' ]]; then
                           echo pssh -H $username@$server:$port -t 1000 -i 'docker exec pb-tengine-'$app'-callback.'$var' /bin/sh -c "nginx -s reload"'
                                pssh -H $username@$server:$port -t 1000 -i 'docker exec pb-tengine-'$app'-callback.'$var' /bin/sh -c "nginx -s reload"'
                       fi
                done
            fi
            tindex=$(($tindex+1))
        done
    done
}

# ==========  judge  ==========
if [[ $1 == open || $1 == o ]]; then
    CMD="打开"
    REPLACE="find ${NGX_CFG_DIR} -name ${UPSTREAM_FILE} -exec sed -i '/\.$2:/s|^#\+||' {} \;"
elif [[ $1 == close || $1 == c ]]; then
    CMD="关闭"
    REPLACE="find ${NGX_CFG_DIR} -name ${UPSTREAM_FILE} -exec sed -i '/\.$2:/s|^|#|' {} \;"
else
    _usage_my "${1}: 未知的子命令"
    exit 1
fi

echo $REPLACE

if echo "$A_LINES" | grep -wq "$2" &>/dev/null; then
    WORK_LINE=$2
else
    _usage_my "${2}: 未知的线别"
    exit 2
fi

# ==========  _main_  ==========
_bold "即将${CMD}的线别："
echo "    $WORK_LINE"

read -p "请按回车继续..." var
for server in `echo $TS $RS`; do
    echo pssh -H $username@$server:$port -t 1000 -i \" ${REPLACE}\"
    eval pssh -H $username@$server:$port -t 1000 -i \" ${REPLACE}\"
done

_ngx_reload $RS
_ngx_reload $TS

#!/usr/bin/env bash

#
#
#
# ========== function ==========
_usage_my() {
    _error "" "${1}"
    _info "注释/开启 nginx的upstream对应的App服务，需指定线别和app服务..."
    _usage \
        "      /PATH/$(basename $0)   <COMMAND>    <WORK_LINE>   <WORK_SRV>..." "" \
        "<COMMAND>:  仅支持 stop|start|c|o" \
        "<WORK_LINE>:    ${A_LINES}" \
        "<WORK_SRV>:    服务名包括： all（所有服务） ${A_SERVICE} "
}

# ==========  judge  ==========
if echo $1 | egrep -iwq 'stop|start|c|o' &>/dev/null; then
    CMD="$1"
    shift
else
    _usage_my "${1}: 未知的子命令"
    exit 1
fi

if echo "$A_LINES" | grep -wq "$1" &>/dev/null; then
    WORK_LINE=$1
    shift
else
    _usage_my "${1}: 未知的线别"
    exit 2
fi

if [[ "$#" -eq 0 ]]; then
    _usage_my "请指定service..."
    exit 3
fi

for SERVICE in $@; do
    if ! echo "$A_SERVICE" "all"| grep -wq "$SERVICE" &>/dev/null; then
        _usage_my "${SERVICE}: 未知的service..."
        exit 3
    fi
done

if [[ "$@" == "all" ]]; then
    WORK_SRV="$A_SERVICE"
else
    WORK_SRV="$@"
fi
# ==========  info  ==========
_bold "即将${CMD}服务的线别："
echo "    $WORK_LINE"
_bold "对应宿主机hostname是："
ansible ${R_LINES} --list-host
_bold "对应的center是："
echo "    $WORK_SRV"
_wait 1 "操作倒计时1s... " ""

# ==========  _main_  ==========
for SERVICE in ${WORK_SRV}; do
    DOCKER_SRV="${SERVICE}-${WORK_LINE}-${IDC_LOW}"
    _h2 "注释/开启 upstream... ==> ${DOCKER_SRV}:"
    if [[ $CMD == stop || $CMD == c ]]; then
        REPLACE="find ${NGX_CFG_DIR} -name ${UPSTREAM_FILE} -exec sed -i '/${DOCKER_SRV}/s|^|#|' {} \;"
    else
        REPLACE="find ${NGX_CFG_DIR} -name ${UPSTREAM_FILE} -exec sed -i '/${DOCKER_SRV}/s|^#\+||' {} \;"
    fi
    _wait 1 "ansible ${R_LINES} -m shell -a ${REPLACE} "
    eval ansible ${R_LINES} -m shell -a \"${REPLACE}\"
    _success "    ${CMD}...Success!"

# ================ 仅适用 IDC-B ======================
    # 重启对应容器
    _restar_ngx(){
        _h2 "reload NGX... ==> ${NGX_SRV}:"
        _wait 1 " ansible ${R_LINES} -m shell -a ' rectn ${NGX_SRV} restart.sh  '  "
             eval ansible ${R_LINES} -m shell -a \'rectn ${NGX_SRV} restart.sh\'
    }

    CONTAINER=${SERVICE}-ngx
    if echo $R_NGX | grep -wq ${CONTAINER}; then
        NGX_SRV="${project}_${CONTAINER}"
        _restar_ngx
    elif [[ "${CONTAINER}" == "boss-cta-center-ngx" ]]; then
        NGX_SRV_TMP="${project}_tcenter-ngx ${project}_ccenter-ngx ${project}_boss-ngx ${project}_acenter-ngx"
        for NGX_SRV in ${NGX_SRV_TMP}; do
            _restar_ngx
        done
    else
        true
    fi
done

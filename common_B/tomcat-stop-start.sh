# ========== variable ==========

# ========== function ==========
_usage_my() {
    _error "" "${1}"
    _info "start/stop 指定线别的指定app服务..."
    _usage \
        "      /PATH/$(basename $0)   <COMMAND>    <WORK_LINE>   <WORK_SRV>..." "" \
        "<COMMAND>:  仅支持 stop|start " \
        "<WORK_LINE>:    ${A_LINES}" \
        "<WORK_SRV>:    服务名包括： all（所有服务） ${A_SERVICE} "
}

_enter_go_on(){
    unset var
    _h2 "----" "$1" "----"
    while [[ ! "$var" == "ok" ]]; do
        read -p "请输入'ok' ,按回车继续：" var
    done
}
# Usage：    _dubbo_off <线别>  <容器服务名> <关闭的服务>
_dubbo_off(){
    # 反注册dubbo服务
    _wait 1 "ansible ${1} -m shell -a ' rectn $2 dubbo-off $3 ' "
    eval ansible ${1} -m shell -a \' rectn $2 dubbo-off ${3} \'
}
# Usage：    _stop_srv <线别>  <容器服务名> [-f或空]
_stop_srv(){
    # stop App服务, 不检查日志
    _wait 1 "ansible ${1} -m shell -a ' rectn $2 stop.sh ${3} ' "
    eval ansible ${1} -m shell -a \' rectn $2 stop.sh ${3}  \'
}

# Usage：    _start_srv <线别>  <容器服务名>
_start_srv(){
    _wait 1 "ansible ${1} -m shell -a ' rectn $2 start.sh '    "
    eval ansible ${1} -m shell -a \' rectn $2 start.sh \'
}

# ==========  judge  ==========
if echo $1 | egrep -wqi 'stop|start' &>/dev/null;then
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

fi

for SERVICE in $@;do
    if ! echo "$A_SERVICE" "$R_SERVICE" "$T_SERVICE" "all"| grep -wq "$SERVICE" &>/dev/null; then
        _usage_my "${SERVICE}: 未知的service..."
        exit 4
    fi
done

if [[ "$@" == "all" ]];then
    WORK_SRV="$A_SERVICE $R_SERVICE $T_SERVICE"
else
    WORK_SRV="$@"
fi

# ==========  _info_  ==========
_bold "即将${CMD}服务的线别："
echo "    $WORK_LINE"
_bold "对应宿主机hostname是："
ansible ${WORK_LINE} --list-host
_bold "对应的center是："
echo "    $WORK_SRV"
_wait 1 "操作倒计时1s... " ""

# ==========  _main_  ==========
# 先dubbo off, 再tomcat stop...
if echo $CMD | egrep -iwq 'stop';then
    #  ========== dubbo off ==========
    # 如过有，则先关闭schedule
    if echo $WORK_SRV | fgrep -qw schedule;then
        DOCKER_SRV="${project}_schedule-${WORK_LINE}-${IDC_LOW}"
        _dubbo_off ${WORK_LINE}  ${DOCKER_SRV} schedule
    fi
    for SERVICE in $WORK_SRV;do
        DOCKER_SRV="${project}_${SERVICE}-${WORK_LINE}-${IDC_LOW}"
        case $SERVICE in
        api|service|service-api)
            _dubbo_off ${WORK_LINE}  ${DOCKER_SRV} ${SERVICE} &
            ;;
        *)
            ;;
        esac
    done
    wait
    # 交互操作，手动确认
    _enter_go_on "请检查 service 日志，确认服务停止后，再进行下一步操作"

    # ========== tomcat stop ==========
    for SERVICE in $WORK_SRV;do
        DOCKER_SRV="${project}_${SERVICE}-${WORK_LINE}-${IDC_LOW}"
        case $SERVICE in
        fserver|gather-server|gather-client|rcenter)
            _warn "${SERVICE}： 请手动stop对应服务..."
            ;;
        *)
            # $4=-f,人工查看日志，不自动检查log， stop tomcat
            _stop_srv ${WORK_LINE}  ${DOCKER_SRV} "-f"
            ;;
        esac
    done
# tomcat start...
elif echo $CMD | egrep -wqi 'Start';then
    # 如过有schedule，则先启动service
    if echo $WORK_SRV | fgrep -qw schedule;then
        DOCKER_SRV="${project}_service-${WORK_LINE}-${IDC_LOW}"
        _start_srv ${WORK_LINE}  ${DOCKER_SRV}
    fi

    for SERVICE in $WORK_SRV;do
        DOCKER_SRV="${project}_${SERVICE}-${WORK_LINE}-${IDC_LOW}"
        case $SERVICE in
        fserver|gather-server|gather-client|rcenter)
            _warn "${SERVICE}： 请手动 start 对应服务..."
            ;;
        *)
            _start_srv ${WORK_LINE}  ${DOCKER_SRV}
            ;;
        esac
    done
fi

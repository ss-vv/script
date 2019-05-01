# ========== function ==========
_usage_my() {
    _error "" "${1}"
    _info "从控制机推送&解压war包到App节点..." \
    _usage \
        "      /PATH/$(basename $0)    <COMMAND>    <WORK_LINE>    </PATH/to/WAR/>" "" \
        "<COMMAND>:  仅支持d|i    （d=delete 删除原app   i=increase 增量更新）" \
        "WORK_LINE:    war包推送的线别：${A_LINES} " \
            "        注意：推往r和t的fserver.war rcenter.war gather-client.war，可任意填写${A_LINES}，脚本自动识别进行推送"\
        "</PATH/to/WAR/>:    指定更新war包的目录"
}

# Usage:  _up_cmd <1|2|3|r|t> </PATN/to/*.war> </remote/DEST/>
_up_cmd() {
    set -e
    if [[ "$CMD" == "d" ]];then
        _note "ansible $1 -m shell -a 'rm -rf ${3}/* '   "
        eval ansible $1 -m shell -a \'rm -rf ${3}/* \' &> /dev/null
    else
        _info "增量包内容为："
        unzip -l $2
    fi
    _node "ansible $1 -m unarchive -a 'src=${2} dest=${3}/ ' "
    eval ansible $1 -m unarchive -a \'src=${2} dest=${3}/ \' &> /dev/null
    _info "   ==> Line $1"
    _success "        ...Success!"
    set +e
}

# ==========  judge  ==========
if [ "$1" == "d" -o "$1" == "i" ];then
    CMD=$1
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

if ls ${1}/*.war &> /dev/null;then
    WAR_PATH="${1}"
else
    _usage_my "${1}: 目录不存在，或目录下没有.war包..."
    exit 3
fi
# ==========  _info_  ==========

_h2 "即将从控制机推送&解压war包到App节点..."
_bold "" "操作的线别是："
echo "    $WORK_LINE"
_bold "操作的节点hostname是："
ansible ${WORK_LINE} --list-host
_bold "war包目录是"
ls -d "${WAR_PATH}"
_bold "推送war有："
ls -l ${WAR_PATH}/*.war
_wait 5 "操作倒计时1s... " ""

# ==========  _main_  ==========
cd ${WAR_PATH}
for war in `ls *.war`;do
    (
    _bold "${WAR_PATH}/$war解压到相应主机..."
    if [ $war == "api-impl-jars.war" -o $war == "pay-impl-jars.war" ];then
        # ansible 定义全线host组为a
        # api-impl-jars pay-impl-jars 独立出来，发往全线。
        _up_cmd a ${WAR_PATH}/$war ${dist_base_path}/apps/${war%.*}
    elif echo $ASPKG | grep -wq ${war%.*} &> /dev/null;then
        _up_cmd ${WORK_LINE} ${WAR_PATH}/$war ${dist_base_path}/apps/${war%.*}
    elif echo $TSPKG | grep -wq ${war%.*} &> /dev/null;then
        _up_cmd t ${WAR_PATH}/$war ${dist_base_path}/apps/${war%.*}
    elif echo $RSPKG | grep -wq ${war%.*} &> /dev/null;then
        _up_cmd r ${WAR_PATH}/$war ${dist_base_path}/apps/${war%.*}
    else
        _warn "${war}:    未分类war包，请检查_variable.sh配置。（sql.war忽略）"
    fi
    )&
done
wait

#!/usr/bin/env bash

#
#
#
_usage_my() {
    _error "" "${1}" "${2}"
    _info "增量更新app，按app的各主机分别备份，并将增量文件推送到各主机" \
    _usage \
        "      /PATH/$(basename $0)    </PATH/to/*/updatefile>" "" \
        "</PATH/to/APP/DIR>:    指定更新APP包解压后的父目录，/*/updatefile"
}


RSPKG="rcenter ftl"
UPDATE_PATH="$1"
BACKUP_PATH="$1/../backupfile"
UP_FILE_LIST="$1/../backupfile/up_file_list"

if [ -d "$1" -a "$(basename $1)" == "updatefile" ];then
    true
else
    _usage_my "$1 : 目录不存在|不符合/*/updatefile"
    exit 1
fi

_h2 "更新目录 $UPDATE_PATH" "备份目录: $BACKUP_PATH"
cd $UPDATE_PATH

# 如果是c控制机，则执行/usr/bin/sendpkg ,将包推送到cc
if [[ `hostname` == "c" ]]; then
    echo -e "\n执行/usr/bin/sendpkg ,将包推送到cc\n"
    sendpkg
fi

# 解压war和zip包
if ls *.war &> /dev/null; then
    pkg_war=`ls *.war`
fi
if ls *.zip &> /dev/null; then
    pkg_zip=`ls *.zip`
fi
if [[ ! -z $pkg_zip ]] || [[ ! -z $pkg_war ]]; then
    for pkg in $pkg_zip  $pkg_war; do
        unzip -l $pkg
        unzip $pkg
        rm -f $pkg
    done
else
    _usage_my "Error : 找不到 *.war *.zip"
    exit 2
fi

# 判断解压后的目录
for i in `ls $UPDATE_PATH`;do
    if ! echo "${ASPKG} ${ASPKG_EX} ${RSPKG}" | grep -wq $i &>/dev/null;then
        _usage_my "$i : 未知的app更新，请确定${UPDATE_PATH}下的目录属于:" "   ${ASPKG} ${ASPKG_EX} ${RSPKG}"
        exit 3
    fi
done

# ====================== main ======================
# 遍历更新的 App
for APP in `ls ${UPDATE_PATH}`;do
    # 若更新 pay-impl-jars ，则开启信息提示，
    if [[ $APP == 'pay-impl-jars' ]]; then
        pay_info='true'
    fi
    # 根据 App 获取更新的主机
    if [ $APP == rcenter -o $APP == ftl ]; then
        WORK_HOST="$RS"
    else
        WORK_HOST="$AS"
    fi
    echo -e "\n增量更新包目录 ==> $APP\n备份的host ==> $WORK_HOST"
    # 遍历更新的主机
    HOST_COUNT=1
    for SERVER in `echo $WORK_HOST`;do
        _bold '----' "   ===> ${SERVER}"
        # 遍历文件进行备份
        _info '---- 备份文件中 ---'
        for FILE in `find ./${APP} -type f`;do
            BAK_FILE="${BACKUP_PATH}/${SERVER}/${FILE}"
            mkdir -p `dirname ${BAK_FILE}`

            if [[ ${HOST_COUNT} -eq 1 ]]; then
                # 第一次备份时，打印命令
                _info "scp -p ${username}@${SERVER}:${dist_base_path}/apps/${FILE}  ${BAK_FILE}" \
                    "----"
            fi
            # 备份
            eval       scp -p ${username}@${SERVER}:${dist_base_path}/apps/${FILE}  ${BAK_FILE}
        done

        _info '---- 推送更新中 ---'
        if [[ ${HOST_COUNT} -eq 1 ]]; then
            # 第一次推送时，将更新的文件名记录，保存到 ${UP_FILE_LIST}
            echo "${dist_base_path}/apps/${FILE}" >> ${UP_FILE_LIST}
            # 第一次推送时，打印命令
            _info "scp -rp ${APP}/*  ${username}@${SERVER}:${dist_base_path}/apps/${APP}/" \
                "----"
        fi
        eval       scp -rp ${APP}/*  ${username}@${SERVER}:${dist_base_path}/apps/${APP}/

        let HOST_COUNT+=1
    done
    # 测试线rcenter
    if [[ "${APP}" == "rcenter" ]]; then
        if [[ `hostname` == "c" ]]; then
            _info "cp -a ${APP}  /root/gb/apps/"
            eval   cp -a ${APP}  /root/gb/apps/
        elif [[ `hostname` == "cc" ]]; then
            _info "cp -a ${APP}  /var/gb/apps/"
            eval   cp -fa ${APP}  /var/gb/apps/
        fi
    fi
done

_h2 '===='
tree ${UPDATE_PATH}/..

_h2 '===='
if [ ! -z "$pay_info" ]; then
    echo '--------------------'
    echo "pay-impl-jars ： 已开启基于crontab的 a1 --> c   c --> aa1 同步，/etc/crontab相关信息："
    fgrep 'pay-impl-jars' /etc/crontab
    echo '--------------------'
fi
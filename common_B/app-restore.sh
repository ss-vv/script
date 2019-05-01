#!/usr/bin/env bash

#
#
#
_usage_my() {
    _error "" "${1}" "${2}"
    _info "到各app节点删除/*/updatefile里对应的增量更新文件，并将../backupfile备份文件还原到各主机" \
    _usage \
        "      /PATH/$(basename $0)    </PATH/to/*/updatefile>" "" \
        "</PATH/to/APP/DIR>:    指定更新APP包解压后的父目录，/*/updatefile"
}

RSPKG="rcenter ftl"
UPDATE_PATH="$1"
BACKUP_PATH="$1/../backupfile"
UP_FILE_LIST="$1/../up_file_list"
UP_FILE=$(cat ${UP_FILE_LIST})

if [ -d "$1" -a "$(basename $1)" == "updatefile" ];then
    true
else
    _usage_my "$1 : 目录不存在|不符合/*/updatefile"
    exit 1
fi

for i in `ls $UPDATE_PATH`;do
    if ! echo "${ASPKG} ${ASPKG_EX} ${RSPKG}" | grep -wq $i &>/dev/null;then
        _usage_my "$i : 未知的app更新，请确定${UPDATE_PATH}下的目录属于:" "   ${ASPKG} ${ASPKG_EX} ${RSPKG}"
        exit 2
    fi
done

cd $UPDATE_PATH
# 遍历更新的主机
for SERVER in `ls $BACKUP_PATH`; do
    _bold '----' "   ===> ${SERVER}"
    # 通过 ${UP_FILE_LIST} 获取更新的文件,删除之
    _bold '---- 删除更新 ----'
    if [[ ! -z "$UP_FILE" ]]; then
        echo ssh ${username}@${SERVER}  rm -rf ${UP_FILE}
        eval ssh ${username}@${SERVER}  rm -rf ${UP_FILE}
    fi
    # 遍历BACKUP_PATH备份的目录,推送恢复之
    _bold '---- 推送恢复 ----'
    for bakdir in `ls ${BACKUP_PATH}/${SERVER}`; do
        if [[ $(ls ${BACKUP_PATH}/${SERVER}/${bakdir} |wc -l) -ne 0 ]];then
            echo scp -rp ${BACKUP_PATH}/${SERVER}/${bakdir} ${username}@${SERVER}:${dist_base_path}/apps/
            eval scp -rp ${BACKUP_PATH}/${SERVER}/${bakdir} ${username}@${SERVER}:${dist_base_path}/apps/
        fi
    done
done

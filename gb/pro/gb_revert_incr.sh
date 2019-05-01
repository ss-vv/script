#!/usr/bin/env bash
cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/_variable.sh
#單節點單應用
#/var/gb/release-bak/release-date
RSPKG="rcenter ftl"
release_path=$1
backup_path=$1/backupfile

mkdir -p $release_path $backup_path
echo '部署目录 '$release_path

allserver=`ls ${backup_path}`
echo '备份目录'$allserver

#还源覆盖各节点文件
for s in $allserver
do
    allapp=`ls ${backup_path}/${s}`
    for app in $allapp
    do
        echo scp -rp $backup_path/$s/$app $username@$s:/var/gb/apps
        scp -rp $backup_path/$s/$app $username@$s:/var/gb/apps
    done
done

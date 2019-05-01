#!/usr/bin/env bash
cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
apps_path="$base_path/apps/$project"
source $cur_dir/_variable.sh
#單節點單應用
#/var/gb/release-bak/release-date
RSPKG="rcenter ftl"
release_path=$1
update_path=$1/updatefile

mkdir -p $release_path $update_path
echo '部署目录 '$release_path
echo '更新目录 '$update_path

all=`ls ${update_path}`
echo '增量更新包目录'$all

#覆盖
for app in $all
do
    cindex=0
    for s in $AS
      do
         server=${ASIP[$cindex]}
        for p in  $ASPKG
           do
               if [ "$p" == "$app" ]; then
                echo scp -rp $update_path/$app $username@$server:$apps_path
                scp -rp $update_path/$app $username@$server:$apps_path
               fi
           done
        cindex=$(($cindex+1))
      done

    cindex=0
    for s in $RS
      do
         server=${RSIP[$cindex]}
        for p in  $RSPKG
           do
               if [ "$p" == "$app" ]; then
                echo scp -rp $update_path/$app $username@$server:$apps_path
                scp -rp $update_path/$app $username@$server:$apps_path
                echo cp -rp $update_path/$app /root/gb/apps
                cp -rp $update_path/$app /root/gb/apps
               fi
           done
        cindex=$(($cindex+1))
      done
done

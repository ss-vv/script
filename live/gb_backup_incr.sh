#!/usr/bin/env bash
source /var/gb/script/live/_variable.sh
#單節點單應用
#/var/gb/release-bak/release-date
RSPKG="rcenter ftl"
release_path=$1
update_path=$1/updatefile
backup_path=$1/backupfile

mkdir -p $release_path $update_path $backup_path
echo '部署目录 '$release_path
echo '更新目录 '$update_path
echo '备份目录 '$backup_path

all=`ls ${update_path}`
echo '增量更新包目录'$all

function getdir(){
    for file in $1/*
    do
        if test -f $file
        then
           path=(${path[*]} ${file//$update_path/''})
        else
            getdir $file
        fi
    done
}
#备份
for app in $all
do
    cindex=0
    for s in $AS
      do
         server=${ASIP[$cindex]}
        for p in  $ASPKG
           do
               if [ "$p" == "$app" ]; then
                    path=()
                    getdir $update_path/$app
                    for f in ${path[@]}
                    do
                        fpath=$backup_path/$server/`dirname $f`
                        mkdir -p $fpath
                        scp -p $username@$server:/var/gb/apps$f $fpath
                    done
               fi
           done
        cindex=$(($cindex+1))
      done

    cindex=0
    for s in $RS
      do
        server=${RSIP[$cindex]}
        for   p  in   $RSPKG
           do
               if [ "$p" == "$app" ]; then
                    path=()
                    getdir $update_path/$app
                    for f in ${path[@]}
                    do
                        fpath=$backup_path/$server/`dirname $f`
                        mkdir -p $fpath
                        scp -p $username@$server:/var/gb/apps$f $fpath
                    done
               fi
           done
        cindex=$(($cindex+1))
      done
done

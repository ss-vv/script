#!/bin/bash
contain() {
      x="${1%%$2*}"
        [[ $x = $1 ]] && return 1 || return 0
}

ALL=$(docker -H :4000 ps --format "{{.Names}}")
for con in ${ALL[@]}
do
    CODE_FILE=0
    if !(contain ${con} swarm)
    then
        CODE_FILE=$(docker -H :4000 exec  -it $con /bin/bash -c "find . -maxdepth 1 -name 'core.*' | wc -l")
        if [[ ${CODE_FILE} > 1 ]]; then
            
            echo " code file $con $CODE_FILE "
            #echo "code file:  $con $CODE_FILE  个code文件，正在删除。"
            #echo "${con} 容器 code file ${CODE_FILE} 个，正在删除。"
            docker -H :4000 exec ${con} /bin/sh -c "rm -rf core.*"
        fi    
    fi   
done

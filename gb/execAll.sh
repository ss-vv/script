#!/bin/bash

# $1 需要执行的命令
# $2 不包含的容器名

contain() {
      x="${1%%$2*}"
        [[ $x = $1 ]] && return 1 || return 0
}

ALL=$(docker -H :4000 ps --format "{{.Names}}")
for con in ${ALL}
do
    if !(contain $con swarm)
    then
        echo "$con 中执行 $1"
        docker -H :4000 exec $con $1
    fi
done


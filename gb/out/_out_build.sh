#!/bin/bash
#frank
#用途：外围服务器统一 docker build 

ENV=$(docker ps --format "{{.Names}}")
for docker_build in $ENV
do
    if [[ $docker_build == *"site"* ]]
    then
        #echo $(hostname -f)-$docker_build--- $(hostname -f) build site
       docker build -t tengine-site /var/gb/op-out-site-env/build/tengine-site
   elif [[ $docker_build == *"adm"* ]]
    then
       # echo $(hostname -f)-$docker_build--- $(hostname -f) build admin
       docker build -t tengine-adm /var/gb/build/tengine-adm
    fi
done
echo "docker build done all !!"


#!/bin/bash
#frank
ENV=$(hostname)
for docker_run in $ENV
do
    if [[ $docker_run == "adm-1" ]]
    then
        echo "out-admin"
      #  /bin/sh /var/gb/pro-out-env/run/out-admin.sh
    elif [[ $docker_run == "adm-2" ]]
    then
        echo "out-admin"
       # /bin/sh /var/gb/pro-out-env/run/out-admin.sh
    else
        echo "out-site"
        #/bin/sh /var/gb/pro-out-env/run/out-site.sh 
    fi  
done
echo "docker run done all !!"

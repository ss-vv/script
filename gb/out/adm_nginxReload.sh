#!/bin/bash
#2016-11-24 frank
#nginx -s reload 支付线路

ALL_NGINX=$(docker ps --filter "name=adm" --format "{{.Names}}")
for _nginx in $ALL_NGINX
do
    echo $_nginx
    docker exec $_nginx /bin/sh -c "nginx -s reload"
done
echo "nginx -s reload success !!!"

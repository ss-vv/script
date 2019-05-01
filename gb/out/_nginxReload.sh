#!/bin/bash
#jeff

ALL_NGINX=$(docker ps --filter "name=site" --format "{{.Names}}")
for _nginx in $ALL_NGINX
do
    echo $_nginx
    docker exec $_nginx /bin/sh -c "nginx -s reload"
done
echo "nginx -s reload success !!!"

#!/bin/bsah
ALL_NGINX=$(docker ps --filter "name=site" --format "{{.Names}}")
for _nginx in $ALL_NGINX
do
    docker exec $_nginx /bin/sh -c " rm -rf /tmp/proxy_cache/*"
done

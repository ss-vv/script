#!/bin/bash
echo -e 47.90.23.155 b.o.s.s.i >> /etc/hosts
ALL_NGINX=$(docker ps --format "{{.Names}}")
for name in $ALL_NGINX
do
    docker exec $name /bin/sh -c "echo -e 47.90.23.155 b.o.s.s.i >> /etc/hosts"
done

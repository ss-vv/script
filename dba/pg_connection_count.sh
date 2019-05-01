#!/usr/bin/env bash

export PGPASSWORD='dawoosoftpgstatus'
echo "pg-01.d1"
psql -t -h d1 -p 5401 -d postgres -U pg-status -c 'select count(1) from pg_stat_activity;'
echo "pg-02.d2"
psql -t -h d2 -p 5402 -d postgres -U pg-status -c 'select count(1) from pg_stat_activity;'
echo "pg-03.d3"
psql -t -h d3 -p 5403 -d postgres -U pg-status -c 'select count(1) from pg_stat_activity;'
echo "pg-05.d5"
psql -t -h d5 -p 5405 -d postgres -U pg-status -c 'select count(1) from pg_stat_activity;'
echo "pg-06.d6"
psql -t -h d6 -p 5406 -d postgres -U pg-status -c 'select count(1) from pg_stat_activity;'
echo "pg-mx.d7"
psql -t -h d7 -p 5407 -d postgres -U pg-status -c 'select count(1) from pg_stat_activity;'

#ssh -p 6343 root@cc "ssh root@dd1 'sh /var/env/script/dba/pg_connection_count.sh'"
echo "pg-11.dd1"
psql -t -h dd1 -p 5411 -d postgres -U pg-status -c 'select count(1) from pg_stat_activity;'
echo "pg-12.dd3"
psql -t -h dd2 -p 5412 -d postgres -U pg-status -c 'select count(1) from pg_stat_activity;'
echo "pg-13.dd3"
psql -t -h dd3 -p 5413 -d postgres -U pg-status -c 'select count(1) from pg_stat_activity;'
echo "finish"

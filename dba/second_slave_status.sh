#!/usr/bin/env bash

#ssh -p 6343 root@cc "ssh root@dd1 'sh /var/env/script/dba/slave_status.sh'"

export PGPASSWORD='dawoosoftpgstatus'
echo "pg-01.dd1"
psql -h dd1 -p 5401 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'
echo "pg-02.dd2"
psql -h dd2 -p 5402 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'
echo "pg-03.dd3"
psql -h dd3 -p 5403 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'
echo "pg-05.dd1"
psql -h dd1 -p 5405 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'
echo "pg-06.dd2"
psql -h dd2 -p 5406 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'
echo "pg-mx.dd3"
psql -h dd3 -p 5407 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'
echo "pg-11.dd4"
psql -h dd4 -p 5411 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'
echo "pg-12.dd4"
psql -h dd4 -p 5412 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'
echo "pg-13.dd4"
psql -h dd4 -p 5413 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'


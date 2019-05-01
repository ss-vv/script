#!/usr/bin/env bash

export PGPASSWORD='dawoosoftpgstatus'
echo "pg-01.d4"
psql -h d4 -p 5401 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'
echo "pg-02.d4"
psql -h d4 -p 5402 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'
echo "pg-03.d4"
psql -h d4 -p 5403 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'
echo "pg-05.d8"
psql -h d8 -p 5405 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'
echo "pg-06.d8"
psql -h d8 -p 5406 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'
echo "pg-mx.d8"
psql -h d8 -p 5407 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'
echo "pg-11.d5"
psql -h d5 -p 5411 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'
echo "pg-12.d6"
psql -h d6 -p 5412 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'
echo "pg-13.d7"
psql -h d7 -p 5413 -d postgres -U pg-status -c 'SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag, pg_last_xact_replay_timestamp();'


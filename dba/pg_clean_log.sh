#!/bin/bash

echo "delete from task_run_record where begin_time< now()+'-10d';"
docker exec pg-mx.d7 su - postgres -c "psql -h pg-mx.d7 -d gb-boss -U gb-boss -c \"delete from task_run_record where begin_time< now()+'-10d';\""
echo ""
echo "delete from pay_log where operate_time < now()+'-10d';"
docker exec pg-mx.d7 su - postgres -c "psql -h pg-mx.d7 -d gb-boss -U gb-boss -c \"delete from pay_log where operate_time< now()+'-10d';\""
echo ""
echo "delete from game_api_log  where request_time < now()+'-90d';"
docker exec pg-mx.d7 su - postgres -c "psql -h pg-mx.d7 -d gb-boss -U gb-boss -c \"delete from game_api_log where request_time< now()+'-90d';\""
echo ""
echo "delete from site_job_run_record where run_date< now()+'-10d';"
docker exec pg-mx.d7 su - postgres -c "psql -h pg-mx.d7 -d gb-companies -U gb-companies -c \"delete from site_job_run_record where run_date< now()+'-10d';\""
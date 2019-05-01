i#分库boss开发
docker stop postgres-boss.dev
docker rm postgres-boss.dev
docker run -itd --privileged --restart=always -p 5432:5432 --hostname=postgres-boss.dev --name postgres-boss.dev \
 -v /var/gb/data/pg/pg_boss/postgres:/var/data/postgres \
 -v /var/gb/data/pg/pg_boss/backup:/var/data/backup \
 -v /var/gb/data/pg/pg_boss/xlog_archive:/var/data/xlog_archive \
 hub:5000/gb-postgres

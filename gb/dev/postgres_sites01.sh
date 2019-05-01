#分库sites开发
docker stop postgres-sites01.dev
docker rm postgres-sites01.dev
docker run -itd --privileged --restart=always -p 5501:5432 --hostname=postgres-sites01.dev --name postgres-sites01.dev \
 -v /var/gb/data/pg/pg_sites01/postgres:/var/data/postgres \
 -v /var/gb/data/pg/pg_sites01/backup:/var/data/backup \
 -v /var/gb/data/pg/pg_sites01/xlog_archive:/var/data/xlog_archive \
 hub:5000/gb-postgres


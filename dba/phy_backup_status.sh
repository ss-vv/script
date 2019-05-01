#!/usr/bin/env bash

echo pg_01
if [ `ssh gb@d1 'find /var/gb/data/pg/pg_01/backup/pg_phys_backup/pg_phys_bak* -mtime -1 | wc -l'` = 2 ];then echo 成功; else echo 失败;fi
echo
echo pg_02
if [ `ssh gb@d2 'find /var/gb/data/pg/pg_02/backup/pg_phys_backup/pg_phys_bak* -mtime -1 | wc -l'` = 2 ];then echo 成功; else echo 失败;fi
echo
echo pg_03
if [ `ssh gb@d3 'find /var/gb/data/pg/pg_03/backup/pg_phys_backup/pg_phys_bak* -mtime -1 | wc -l'` = 2 ];then echo 成功; else echo 失败;fi
echo
echo pg_05
if [ `ssh gb@d5 'find /var/gb/data/pg/pg_05/backup/pg_phys_backup/pg_phys_bak* -mtime -1 | wc -l'` = 2 ];then echo 成功; else echo 失败;fi
echo
echo pg_06
if [ `ssh gb@d6 'find /var/gb/data/pg/pg_06/backup/pg_phys_backup/pg_phys_bak* -mtime -1 | wc -l'` = 2 ];then echo 成功; else echo 失败;fi
echo
echo pg_mx
if [ `ssh gb@d7 'find /var/gb/data/pg/pg_mx/backup/pg_phys_backup/pg_phys_bak* -mtime -1 | wc -l'` = 2 ];then echo 成功; else echo 失败;fi
echo
echo pg_pb
if [ `ssh gb@d7 'find /var/gb/data/pg/pg_pb/backup/pg_phys_backup/pg_phys_bak* -mtime -1 | wc -l'` = 2 ];then echo 成功; else echo 失败;fi
echo

#ssh -p 6343 root@cc "sh /var/env/script/dba/phy_backup_status.sh"
echo pg_11
if [ `ssh -p6343 gb@cc "ssh gb@dd1 'find /var/gb/data/pg/pg_11/backup/pg_phys_backup/pg_phys_bak* -mtime -1 | wc -l'"` = 2 ];then echo 成功; else echo 失败;fi
echo
echo pg_12
if [ `ssh -p6343 gb@cc "ssh gb@dd2 'find /var/gb/data/pg/pg_12/backup/pg_phys_backup/pg_phys_bak* -mtime -1 | wc -l'"` = 2 ];then echo 成功; else echo 失败;fi
echo
echo pg_13
if [ `ssh -p6343 gb@cc "ssh gb@dd3 'find /var/gb/data/pg/pg_13/backup/pg_phys_backup/pg_phys_bak* -mtime -1 | wc -l'"` = 2 ];then echo 成功; else echo 失败;fi
echo


#!/bin/bash 
IP_tmp_FILE="/root/script/ip_tmp.txt"
Nginx_log_FILE="/var/gb/logs/admin/tengine/out/access.log"
tail -n 500 $Nginx_log_FILE | awk '{print $1}' |sort |uniq -c |sort -nr |head -n 10 |awk '{if($1>100){print $2}}' >> $Ip_tmp_FILE
for ip in $(cat /root/script/ip_tmp.txt)
do
    iptables -I INPUT -p tcp -s $ip -j DROP
    echo "$ip kill at date">>/var/log/ddos
done
echo "黑名单添加完成！！！"

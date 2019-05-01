#!/bin/bash 
#md5
# *-* by paul
#字符串进行MD5哈希解析
#使用方式 例子：sh out_statics_clean_one.sh site /rcenter/mobile-v2/themes/style.js?v=123425234234235
line=$1
str=$2
if [ -n "$str" ];
then
    key=`echo -n $str|openssl md5|cut -d ' ' -f2`
else
    echo "没有输入要清除的静态资源链接"
    exit 1;
fi

val1=${key:0-1}
val2=${key:0-3:0-1}

pssh -h /etc/pssh/$line -i 'docker exec '$line'  /bin/sh -c " rm -f /tmp/proxy_cache/'$val1'/'$val2'/'$key'"'

#pssh -h /etc/pssh/adm -i 'docker exec adm  /bin/sh -c " rm -f /tmp/proxy_cache/'$val1'/'$val2'/'$key'"'

#echo 'docker exec site  /bin/sh -c " rm -f /tmp/proxy_cache/'$val1'/'$val2'/'$key'"'

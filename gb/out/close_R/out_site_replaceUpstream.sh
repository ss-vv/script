#frank
#2016-09-12
#外围线路只走单个的R1/R2
#外围线路site
#使用方式:关闭R1 c 193 / 关闭R2 c 49

source /var/gb/script/out/close_R/site_variable.sh
source /var/gb/script/common/out_site_replaceUpstream.sh
pssh -h /etc/pssh/site -P -I</var/gb/script/out/_nginxReload.sh

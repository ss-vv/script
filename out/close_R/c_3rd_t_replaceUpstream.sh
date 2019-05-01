#frank
#2016-09-12
#外围线路只走单个的T1/T2
#3rd
#使用方式:关闭T1 c 2 / 关闭T2 c 145
#因为T1 T2的IP是以2和145结尾所以关闭的时候是关闭2和145

source /var/gb/script/out/close_R/3rd_variable.sh
source /var/gb/script/common/c_3rd_t_replaceUpstream.sh
pssh -h /etc/pssh/3rd -P -I</var/gb/script/out/3rd_nginxReload.sh


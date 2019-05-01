#frank
#2017-06-08
#外围线路只走单个的T1/T2
#3rd
#使用方式:关闭T1 c 2 / 关闭T2 c 145
#因为T1 T2的IP是以2和145结尾所以关闭的时候是关闭2和145

cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/../close_R/3rd_variable.sh
source $cur_dir/../../../common/c_3rd_t_replaceUpstream.sh
pssh -h /etc/pssh/3rd -P -I<$cur_dir/../3rd_nginxReload.sh


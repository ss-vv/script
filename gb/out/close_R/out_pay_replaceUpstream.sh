#frank
#2016-09-12
#外围线路只走单个的R1/R2
#支付线路
#使用方式:关闭R1 c 193 / 关闭R2 c 49

cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/pay_variable.sh
source $cur_dir/../../../common/out_pay_replaceUpstream.sh
pssh -h /etc/pssh/pay -P -I<$cur_dir/../pay_nginxReload.sh


#!/usr/bin/env bash

cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/../../common/color-to-node.sh
source $cur_dir/_variable.sh

# 使用帮助

# 键入回车确认等待
_enter_go_on(){
    _h2 "-----------------------------------------"
    read -p "        请按回车继续..." var
    _h2 "-----------------------------------------"
}

_enter_ok_go_on(){
unset ok
while [[ ! "$ok" == "ok" ]]; do
    read -p "请输入'ok' ,按回车继续：" ok
done
}

# cat /etc/ansible/hosts
out_gc_list='sp-gc'
#out_gc_list='bak'




ITEM=1
# ============= 反注册dubbo，停止tomcat start ===============
_h2 "[ Step ${ITEM} ]: 解压/var/env/apps/sp/release/gather-client.war ==> /var/sp/apps/gather-client/..."; let ITEM+=1
if [[ -f /var/env/apps/sp/release/gather-client.war ]]; then
    echo unzip -qod /var/sp/apps/gather-client/ /var/env/apps/sp/release/gather-client.war
    eval unzip -qod /var/sp/apps/gather-client/ /var/env/apps/sp/release/gather-client.war
fi



_h2 "[ Step ${ITEM} ]: 同步到外围.../var/sp/apps/gc/ "; let ITEM+=1

# _enter_ok_go_on
echo ansible $out_gc_list -m synchronize -a \'src=/var/sp/apps/gather-client/ dest=/var/sp/apps/gc/\'
     ansible $out_gc_list -m synchronize -a  'src=/var/sp/apps/gather-client/ dest=/var/sp/apps/gc/' >/dev/null

_h2 "[ Step ${ITEM} ]: 重启外围gather-client... "; let ITEM+=1
echo ansible $out_gc_list -m shell -a \'docker restart sp-gc\'
     ansible $out_gc_list -m shell -a  'docker restart sp-gc'


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
out_gc_list='sp-T-gc'

ITEM=1
_h2 "[ Step ${ITEM} ]: 解压/var/env/apps/sp/release/gather-client.war ==> /var/sp/apps/gather-client/..."; let ITEM+=1
if [[ -f /var/env/apps/sp/release/gather-client.war ]]; then
    echo unzip -qod /var/sp/apps/gather-client/ /var/env/apps/sp/release/gather-client.war
    eval unzip -qod /var/sp/apps/gather-client/ /var/env/apps/sp/release/gather-client.war
fi



_h2 "[ Step ${ITEM} ]: 同步到外围.../var/sp/apps/gc-T-1/ "; let ITEM+=1

# _enter_ok_go_on
echo ansible $out_gc_list -m synchronize -a \'src=/var/sp/apps/gather-client/WEB-INF/lib/processor-1218-SNAPSHOT.jar dest=/var/sp/apps/gc-T/WEB-INF/lib/processor-1218-SNAPSHOT.jar'
     ansible $out_gc_list -m synchronize -a  'src=/var/sp/apps/gather-client/WEB-INF/lib/processor-1218-SNAPSHOT.jar dest=/var/sp/apps/gc-T/WEB-INF/lib/processor-1218-SNAPSHOT.jar' >/dev/null

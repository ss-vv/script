#用途：用于把所有api实现jar包发布到所有a的机器
#作者：will
#时间：2017-06-07
source ./_variable.sh
apps_path="$base_path/apps/$project"
for server in ${ASIP[@]};
do
    echo pscp.pssh -H $username@$server:$port $apps_path/release/api-impl-jars.war /var/gb/apps/api-impl-jars
    pscp.pssh -H $username@$server:$port $apps_path/release/api-impl-jars.war /var/gb/apps/api-impl-jars
    echo pssh -H $username@$server:$port -t 1000 -i 'unzip -qo /var/gb/apps/api-impl-jars/api-impl-jars.war -d /var/gb/apps/api-impl-jars'
    pssh -H $username@$server:$port -t 1000 -i 'unzip -qo /var/gb/apps/api-impl-jars/api-impl-jars.war -d /var/gb/apps/api-impl-jars'
    echo pssh -H $username@$server:$port -t 1000 -i 'rm -f /var/gb/apps/api-impl-jars/api-impl-jars.war'
    pssh -H $username@$server:$port -t 1000 -i 'rm -f /var/gb/apps/api-impl-jars/api-impl-jars.war'
done

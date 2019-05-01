cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
source $cur_dir/_variable.sh
cindex=0
rep="'sed -i \"s/\\\"\\\$CATALINA_BASE\\\"\/logs\/catalina.out/\/dev\/null/g\" /usr/local/tomcat/bin/catalina.sh'"
for var in "$@"
do
    cindex=0
    for   s  in   $DS
      do
        if [ "$s" == "$var" ]; then
            server=${DSIP[$cindex]}
            for   app  in   $DSGB
               do
                   pssh -H $username@$server:$port -t 1000 -i 'docker exec gb-'$app'.'$var'  /bin/sh -c '$rep
               done
        fi
        cindex=$(($cindex+1))
      done

    cindex=0
    for   s  in   $AS
      do
        if [ "$s" == "$var" ]; then
            server=${ASIP[$cindex]}
            for   app  in   $ASGB
               do
                   pssh -H $username@$server:$port -t 1000 -i 'docker exec gb-'$app'.'$var'  /bin/sh -c '$rep
               done
        fi
        cindex=$(($cindex+1))
      done

    cindex=0
    for   s  in   $RS
      do
        if [ "$s" == "$var" ]; then
            server=${RSIP[$cindex]}
            for   app  in   $RSGB
               do
                   pssh -H $username@$server:$port -t 1000 -i 'docker exec gb-'$app'.'$var'  /bin/sh -c '$rep 
               done
        fi
        cindex=$(($cindex+1))
      done
done

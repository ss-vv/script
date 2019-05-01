for host in `cat /etc/pssh/site`
do
    if [[ $1 == "" ]] || [[ $host =~ 'bak-' ]] || [[ $host =~ 'vip-' ]] || [[ $host =~ '-'$1'-' ]] || [[ $host =~ 'def-' ]]
    then
       host=${host%%:*}
       host=${host##*@}
       curl -H 'Host:gamebox.com' http://$host/__clear_static_cache
       sleep 3
    fi
done

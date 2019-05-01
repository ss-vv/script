for host in `cat /etc/pssh/site`
do
    if [[ $1 == "" ]] || [[ $host =~ 'bak-' ]] || [[ $host =~ 'vip-' ]] || [[ $host =~ '-'$1'-' ]] || [[ $host =~ 'def-' ]] || [[ $host =~ 'test-' ]]
    then
       host=${host%%:*}
       host=${host##*@}
       curl -H "Host:gamebox.com" http://$host/__clear_html_cache?siteid=$1
       sleep 1
    fi
done
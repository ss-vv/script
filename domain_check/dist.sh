#
cur_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
pscp.pssh -h /etc/pssh/domain_check $cur_dir/DomainCheck.py /usr/local/lib/python3.6/site-packages/domaincheck/
pscp.pssh -h /etc/pssh/domain_check $cur_dir/logging.conf /usr/local/lib/python3.6/site-packages/domaincheck/
pscp.pssh -h /etc/pssh/domain_check $cur_dir/domain-check.ini /etc/supervisord.d/

#!/usr/bin/env bash

# 批量查看状态
pssh -h /etc/pssh/domain_check -t 10 -i 'supervisorctl  status domain-check'

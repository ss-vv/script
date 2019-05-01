#!/usr/bin/env bash

# 批量启动
pssh -h /etc/pssh/domain_check -t 10 -i 'supervisorctl  start domain-check '

#!/usr/bin/env bash

# 批量停止
pssh -h /etc/pssh/domain_check -t 10 -i 'supervisorctl  stop domain-check '

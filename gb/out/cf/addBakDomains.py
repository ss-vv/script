#!/usr/bin/env python
# -*- coding: utf-8 -*-
# will
# excel生成字母序列域名公式如：=CONCATENATE("888",CHAR(96+ROW()), ".com")

import requests

api_endpoint = 'https://api.cloudflare.com/client/v4/zones'
email = 'bak.dawoo@gmail.com'
key = '87b5b9dcd2945b1f25028a9a9eb1ac49fcf9a'

for domain in open("domains"):
    domain = domain.strip()
    if  len(domain) != 0 :
        # add domain
        domainData = '{"name":"' + domain + '","jump_start":false}'
        hs = {'X-Auth-Email': email, 'X-Auth-Key': key, 'Content-Type': 'application/json'}
        response = requests.post(api_endpoint, data=domainData, headers=hs)
        zoneId = response.text[17:49]

        # add record
        url = api_endpoint + '/' + zoneId + '/dns_records'
        recordData = '{"type":"CNAME","name":"www","content":"' + domain + '","ttl":1,"proxied":true}'
        requests.post(url, recordData, headers=hs)

        recordData = '{"type":"CNAME","name":"m","content":"' + domain + '","ttl":1,"proxied":true}'
        requests.post(url, recordData, headers=hs)

        recordData = '{"type":"CNAME","name":"' + domain + '","content":"gb-bak.info","ttl":1,"proxied":true}'
        response = requests.post(url, recordData, headers=hs)
        print(domain, response.status_code)


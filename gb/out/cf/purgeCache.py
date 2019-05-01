#!/usr/bin/env python
# -*- coding: utf-8 -*-
# will

import requests
from CfApi import Cloudflare_Enduser_API

accounts = {
        'lot.dawoo@gmail.com':'51c68bc942eb0b3328d7d7098bb26b5421fff'
     #'dawoobet@gmail.com': '1e4eb4dc882775a8660fa7140f8a991ab2067',
     #'main.dawoo@gmail.com': '605d1cc7d7637c9d4a97540f22412687cba47',
     #'bak.dawoo@gmail.com': '87b5b9dcd2945b1f25028a9a9eb1ac49fcf9a',
     #'adm.dawoo@gmail.com': 'ce0a21277be63aa2d3da8f46a5f3c8b85b411',
     #'pay.dawoo@gmail.com': 'ee62b499fe1c830cb1712646951a9a432d203'
}

api_endpoint = 'https://api.cloudflare.com/client/v4'
payload = '{"purge_everything":true}'

for (email, token) in accounts.items():
    cf = Cloudflare_Enduser_API(cf_email=email, cf_token=token)
    domainIdDict = cf.list_domain_ids()
    hs = {'X-Auth-Email': email, 'X-Auth-Key': accounts.get(email), 'Content-Type': 'application/json'}
    for (domain, zoneId) in domainIdDict.items():
        url = api_endpoint + '/zones/' + zoneId + "/purge_cache"
        result = requests.delete(url, data=payload, headers=hs)
        print(domain, result.status_code)

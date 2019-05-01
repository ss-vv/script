#!/usr/bin/env python
# -*- coding: utf-8 -*-
# will

import requests
import sys
import redis
from CfApi import Cloudflare_Enduser_API


class purgeCFCacheBySiteId:

    accounts = {
         'dawoobet@gmail.com': '1e4eb4dc882775a8660fa7140f8a991ab2067',
         'main.dawoo@gmail.com': '605d1cc7d7637c9d4a97540f22412687cba47',
         'bak.dawoo@gmail.com': '87b5b9dcd2945b1f25028a9a9eb1ac49fcf9a',
         'adm.dawoo@gmail.com': 'ce0a21277be63aa2d3da8f46a5f3c8b85b411',
        'pay.dawoo@gmail.com': 'ee62b499fe1c830cb1712646951a9a432d203'
    }

    payload = '{"purge_everything":true}'

    api_endpoint = 'https://api.cloudflare.com/client/v4'

    def purge(self,siteId):
        pool = redis.ConnectionPool(host='127.0.0.1', port=6379, db=0)
        rds = redis.Redis(connection_pool=pool)
        domainString = rds.get(siteId)
        if domainString:
            domainList = domainString .split(",");
            print "site id",siteId,"域名个数,",len(domainList),domainList
            for (email, token) in self.accounts.items():
                cf = Cloudflare_Enduser_API(cf_email=email, cf_token=token)
                domainIdDict = cf.list_domain_ids()
                hs = {'X-Auth-Email': email, 'X-Auth-Key': self.accounts.get(email), 'Content-Type': 'application/json'}
                for (domain, zoneId) in domainIdDict.items():
                    if domain in domainList:
                        url = self.api_endpoint + '/zones/' + zoneId + "/purge_cache"
                        result = requests.delete(url, data=self.payload, headers=hs)
                        print(domain, result.status_code)
        else:
            print "site id",siteId,"域名为空。"
if __name__ == "__main__":
    if len(sys.argv) != 2:
        print "需要且只能有一个参数(siteId)"
    else:
        purgeCFCacheBySiteId = purgeCFCacheBySiteId()
        purgeCFCacheBySiteId.purge(sys.argv[1])
        # purgeCFCacheBySiteId
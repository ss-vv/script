#!/usr/bin/env python
# -*- coding: utf-8 -*-
import requests
import json
import csv
import sys
import os
from bs4 import BeautifulSoup

class cloudflare_enum:
    a = '';

    def __init__(self):
        # Master list of headers to be used in each connection
        self.global_headers = {
        }
        self.verbose = True

        self.s = requests.Session()
        self.s.headers.update(self.global_headers)
        self.atok = ''
        self.users = [

            {
                'email': 'main.dawoo@gmail.com',
                'password': 'Dawoo@cf2016',
                'api_key':'605d1cc7d7637c9d4a97540f22412687cba47'
            },
            {
                'email':'dawoobet@gmail.com',
                'password':'Dawoo@cf2016',
                'api_key':'1e4eb4dc882775a8660fa7140f8a991ab2067'
            },
            {
                'email': 'bak.dawoo@gmail.com',
                'password': 'Dawoo@cf2016',
                'api_key':'87b5b9dcd2945b1f25028a9a9eb1ac49fcf9a'
            },
            {
                'email': 'pay.dawoo@gmail.com',
                'password': 'Dawoo@cf2016',
                'api_key':'ee62b499fe1c830cb1712646951a9a432d203'
            },
            {
                'email': 'adm.dawoo@gmail.com',
                'password': 'Dawoo@cf2016',
                'api_key':'ce0a21277be63aa2d3da8f46a5f3c8b85b411'
            }
        ]
        #
        # print self.users

    def log_in(self, username, password,api_key):
        parse_dict = {}

        r = self.s.get('https://www.cloudflare.com/', )

        new_headers = {
            'Referer': 'https://www.cloudflare.com/',
        }
        self.s.headers.update(dict(new_headers.items() + self.global_headers.items()))
        r = self.s.get('https://www.cloudflare.com/a/login', )
        parse_dict['security_token_0'] = self.find_between_r(r.text, '"security_token":"',
                                                             '"}};</script>')

        post_data = {
            'email': username,
            'password': password,
            'security_token': parse_dict['security_token_0'],
        }
        new_headers = {
            'Referer': 'https://www.cloudflare.com/a/login',
            'Content-Type': 'application/x-www-form-urlencoded',
        }
        self.s.headers.update(dict(new_headers.items() + self.global_headers.items()))
        r = self.s.post('https://www.cloudflare.com/a/login', data=post_data)
        self.atok = self.find_between_r(r.text, 'window.bootstrap = {"atok":"', '","locale":"')
        all_zones = self.find_between_r(r.text, '"zones":', ',"zones_total"')
        if all_zones != '' :
            self.all_zones = json.loads(self.find_between_r(r.text, '"zones":', ',"zones_total"'))
        else:
            print "cloudflare user:",username,". domain len : 0.  check you password or username."
            self.all_zones = all_zones
        self.api_key = api_key
        self.username = username
        r = self.s.get('https://www.cloudflare.com/a/logout')
    def print_banner(self):
        if self.verbose:
            print """

                                                     `..--------..`
                                                 .-:///::------::///:.`
                                              `-//:-.`````````````.-://:.`    `   `
                                            .://-.```````````````````.-://-`  :  `-   .
                                          `-//:.........................-://. /. -: `:`  ``
                                         `://--------:::://////:::--------://-::.::`:- .:.
                              ``.---..` `///::::::///////////////////:::::::///::::::--:.`.-.
                            .://::::///::///::///////////////////////////:::///:-----::--:-`  `
                          `:/:-...--:://////////////////////////////////////////----------.--.`
                         `:/:..-:://////////////////////////////////////////////-----------.````
                         .//-::////////////////////////////////////:::::////////-...--------...`
                         -/////////////////////////////////////////////::::----:. `.-::::::-..``
                    ``.--:////////////////////////////////////////////////::-..```-///::::///:-`
                 `.:///::::://////////////////////////////////////:::::::::::::::-----......-:/:.
               `-//:-----::::://///////////////////////////////:///////////////////:-::::---..-//:`
              `:/:---://+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//+++//::--//:
             `//:-/+oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo+++oooo+//://.
             :///ossssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssosssssso+//:
            `//+sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss+/-
            `//+ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo+++++/.
             ``````````````````````````````````````````````````````````````````````````````````````
                                                                                Cloudflare
        """

    def pprint(self, input_dict):
        print json.dumps(input_dict, sort_keys=True, indent=4, separators=(',', ': '))

    def statusmsg(self, msg):
        if self.verbose:
            print "[ STATUS ] " + msg

    def errormsg(self, msg):
        if self.verbose:
            print "[ ERROR ] " + msg

    def successmsg(self, msg):
        if self.verbose:
            print "[ SUCCESS ] " + msg
    def infomessage(self, msg):
        if self.verbose:
            print "[ INFO ] " + msg
    def find_between_r(self, s, first, last):
        try:
            start = s.rindex(first) + len(first)
            end = s.rindex(last, start)
            return s[start:end]
        except ValueError:
            return ""

    def find_between(s, first, last):
        try:
            start = s.index(first) + len(first)
            end = s.index(last, start)
            return s[start:end]
        except ValueError:
            return ""

    def purge_all_cache(self):
        all_zones = self.all_zones
        if all_zones == '' :
            return
        print 'cloudflare user:',self.username
        for count in range(0, len(all_zones)):
            payload = '{"purge_everything":true}'
            headers = {'X-Auth-Email': all_zones[count]['owner']['email'],'X-Auth-Key':self.api_key}
            url = "https://api.cloudflare.com/client/v4/zones/" + all_zones[count]['id'] + "/purge_cache"
            response = requests.delete(url, data=payload, headers=headers)
            if response.OK :
                print "purge all cache domain: ",all_zones[count]['name'],"SUCCESS"
            else:
                print "purge all cache domain: ",all_zones[count]['name'],"zone id :",all_zones[count]['id'],"ERROR.Check you api_key！"

    def batch_purge_cache(self):
        for index in range(0, len(self.users)):

            cloud.log_in(self.users[index]['email'], self.users[index]['password'],self.users[index]['api_key'])
            cloud.purge_all_cache()

if __name__ == "__main__":
        cloud = cloudflare_enum()
        cloud.print_banner()
        cloud.batch_purge_cache()

# -*- coding: utf-8 -*-

"""
cloudflare域名相关操作的封装
"""
from cf.api.Caching import Caching
from cf.api.Dns import Dns
from cf.api.Firewall import Firewall
from cf.api.Speed import Speed

__author__ = 'will'

import requests

from cf.api.Record import Record


class Domain:

    def __init__(self, account, orig_result, name='', jump_start=False, status='active', paused=False):
        self.account = account
        self.dns = Dns(self)
        self.firewall = Firewall(self)
        self.speed = Speed(self)
        self.caching = Caching(self)
        if orig_result:
            self.name = orig_result.get('name')
            self.zone_id = orig_result.get('id')
            self.status = orig_result.get("status")  # readonly, values: active, pending, initializing, moved, deleted, deactivated
            self.paused = bool(orig_result.get("paused"))
            self.created_on = orig_result.get("created_on")
            self.modified_on = orig_result.get("modified_on")
        else:
            self.name = name
            self.jump_start = jump_start
            self.status = status
            self.paused = paused

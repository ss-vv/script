# -*- coding: utf-8 -*-

"""
cloudflare防火墙相关操作的封装
"""

__author__ = 'will'

import requests


class Firewall:
    def __init__(self, domain, sec_lvl=None):
        self.domain = domain
        self.sec_lvl = sec_lvl  # 安全级别：essentially_off, low, medium, high, under_attack

    def set_medium_lvl(self):
        """
            设置当前域名的安全级别为“中级”
            :return: True：成功，False：失败
        """
        return self.set_sec_lvl('medium')

    def set_under_attack_lvl(self):
        """
            设置当前域名的安全级别为“正在被攻击”
            :return: True：成功，False：失败
        """
        return self.set_sec_lvl('under_attack')

    def is_under_attack_lvl(self):
        """
        是否当前安全级别为“正在被攻击”
        :return: True：是，False：否
        """
        return self.get_sec_lvl() == 'under_attack'

    def is_medium_lvl(self):
        """
        是否当前安全级别为“中级”
        :return: True：是，False：否
        """
        return self.get_sec_lvl() == 'medium'

    def get_sec_lvl(self):
        """
        获取当前域名的安全级别
        :return: 安全级别：essentially_off, low, medium, high, under_attack，失败返回None
        """
        response = requests.get(self.domain.account.zone_url + self.domain.zone_id + '/settings/security_level', headers=self.domain.account.headers)
        if response.status_code == 200:
            return response.json().get('result').get("value")
        else:
            print('获取域名%s的安全级别失败：%s' % (self.domain.name, response.text))

    def set_sec_lvl(self, sec_lvl):
        """
        设置当前域名的安全级别
        :param sec_lvl: 安全级别
        :return: True：成功，False：失败
        """
        data = '{"value":"' + sec_lvl + '"}'
        response = requests.patch(self.domain.account.zone_url + self.domain.zone_id + '/settings/security_level', data, headers=self.domain.account.headers)
        if response.status_code == 200:
            return True
        else:
            print('设置域名%s的安全级别为%s失败：%s' % (self.domain.name, sec_lvl, response.text))
            return False

# -*- coding: utf-8 -*-

"""
cloudflare帐号相关操作的封装
"""

__author__ = 'will'

import requests

from cf.api.Domain import Domain


class Account:
    url = 'https://api.cloudflare.com/client/v4/'
    zone_url = url + 'zones/'

    def __init__(self, email, token):
        self.email = email
        self.token = token
        self.headers = {
            'Content-Type': 'application/json',
            'X-Auth-Key': self.token,
            'X-Auth-Email': self.email
        }

    def get_all_domains(self):
        """
        获取该账号下的所有域名
        :return: dict(域名名称, 域名对象), 失败返回None
        """
        i = 1
        records = []
        while True:
            response = requests.get(self.zone_url + '?page=' + str(i) + '&per_page=1000', headers=self.headers)
            if response.status_code == 200:
                domains = response.json().get('result')
                count = len(domains)
                if count == 0:
                    break
                elif count <= 1000:
                    for origResult in domains:
                        domain_obj = Domain(self, origResult)
                        records.append((domain_obj.name, domain_obj))
                    if count == 1000:
                        i += 1
                    else:
                        break
            else:
                print('分页获取帐号%s下第%s分页(每页1000个)的域名时失败：%s' % (self.email, i, response.text))
                return
        return dict(records)

    def get_domain_by_name(self, domain_name):
        """
        根据域名名称获取域名对象
        :return: 域名对象，不存在或失败返回None
        """
        response = requests.get(self.zone_url + '?name=' + domain_name, headers=self.headers)
        if response.status_code == 200:
            domains = response.json().get('result')
            if len(domains) == 0:
                print('账号%s下不存在这个域名%s' % (self.email, domain_name))
            else:
                return Domain(account=self, orig_result=domains[0])
        else:
            print('根据域名%s获取其详细信息失败：%s' % (domain_name, response.text))

    def add_domain(self, domain):
        """
        添加域名
        :param domain: 域名名称或对象
        :return: Domain对象，失败返回None
        """
        jump_start = 'false'
        status = 'active'
        paused = 'false'
        if isinstance(domain, Domain):
            name = domain.name
            jump_start = domain.jump_start
            status = domain.status
            paused = domain.paused
        else:
            name = domain
        domain_data = '{"name":"' + name + '","jump_start":' + jump_start + ',"status":"' + status + '","paused":' + paused + '}'
        response = requests.post(self.zone_url, data=domain_data, headers=self.headers)
        if response.status_code == 200:
            return Domain(self, response.json().get('result'))
        else:
            print('添加域名%s失败：%s' % (name, response.text))

    def del_domain(self, domain_name):
        """
        删除域名
        :param domain_name: 域名名称
        :return: 是否删除成功
        """
        domain = self.get_domain_by_name(domain_name)
        if domain:
            zone_id = domain.zone_id
            response = requests.delete(self.zone_url + zone_id, headers=self.headers)
            if response.status_code == 200:
                return True
            else:
                print('删除域名%s失败：%s' % (domain_name, response.text))
                return False
        else:
            return False

    def get_name_servers(self):
        """
        获取name server地址
        :return: name server地址列表，失败返回None
        """
        response = requests.get(self.zone_url + '?per_page=1', headers=self.headers)
        if response.status_code == 200:
            r = response.json()
            return r.get('result')[0].get("name_servers")
        else:
            print('获取帐号%s的name server地址失败：%s' % (self.email, response.text))

    def get_domain_count(self):
        """
        获取域名总数
        :return: 域名总数，失败返回None
        """
        i = 1
        while True:
            response = requests.get(self.zone_url + '?page=' + str(i) + '&per_page=1000', headers=self.headers)
            if response.status_code == 200:
                r = response.json()
                count = len(r.get('result'))
                if count == 0:
                    return (i - 1) * 1000
                elif count < 1000:
                    return (i - 1) * 1000 + count
                else:
                    i += 1
            else:
                print('获取帐号%s的域名总数失败：%s' % (self.email, response.text))
                break

    def find_ip(self, ips):
        """
        查看指定ip的上下文信息
        :param ips: 单个ip或ip列表
        :return: Record对象列表
        """
        if isinstance(ips, str):
            ips = [ips]
        rs = []
        for (name, domain) in self.get_all_domains().items():
            for record in domain.get_all_records():
                if record.content in ips:
                    rs.append(record)
        return rs

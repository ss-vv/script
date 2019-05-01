#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys

from cf.api.Account import Account
from cf.api.Record import Record

dawoobet_account = Account('dawoobet@gmail.com', '1e4eb4dc882775a8660fa7140f8a991ab2067')
main_account = Account('main.dawoo@gmail.com', '605d1cc7d7637c9d4a97540f22412687cba47')  # 现在没在用，可用作测试
bak_account = Account('bak.dawoo@gmail.com', '87b5b9dcd2945b1f25028a9a9eb1ac49fcf9a')
site_account = Account('site.dawoo@gmail.com', '023156cc485621ee8f7dd47ee13e2e3b58048')  # 现在没在用，可用作测试
adm_account = Account('adm.dawoo@gmail.com', 'ce0a21277be63aa2d3da8f46a5f3c8b85b411')
pay_account = Account('pay.dawoo@gmail.com', 'ee62b499fe1c830cb1712646951a9a432d203')
vip_account = Account('vip.dawoo@gmail.com', 'b6532e35103ae70c25bdd7100d525a4a802d2')
lott_account = Account('lott.dawoo@mail.com', '8872300e0a351aaf3a40521c9ac362bde41a2')  # 现在没在用，可用作测试
lot_account = Account('lot.dawoo@gmail.com', '51c68bc942eb0b3328d7d7098bb26b5421fff')

sites = {
    '076': 'yl',
    '111': 'xpj',
    '112': 'vns',
    '113': 'wd',
    '114': 'blr',
    '115': 'yxlm',
    '116': '777dz',
    '117': 'ptdz',
}


def add_bak_domain_in_shell():
    """
        为bak.dawoo@gmail.com帐号添加域名及dns记录, shell中调用，方式如：python CF.py add_bak_domain_in_shell 111 a.com b.com c.com
        :param site_id: 站点id，三位数字的字符串
        :param domain_names: 单个域名或多个域名的列表
        :return: None
        """
    site_id = sys.argv[2]
    domain_names = sys.argv[3:]
    add_bak_domain(site_id, domain_names)


def add_bak_domain(site_id, domain_names):
    """
    为bak.dawoo@gmail.com帐号添加域名及dns记录
    :param site_id: 站点id，三位数字的字符串
    :param domain_names: 单个域名或多个域名的列表
    :return: None
    """
    if not site_id:
        print("调用失败：site_id参数没指定！")
    if not domain_names:
        print("调用失败：domain_names参数没指定！")
    if isinstance(domain_names, str):
        domain_names = [domain_names]
    for domain_name in domain_names:
        # add domain
        domain = bak_account.add_domain(domain_name)
        dns = domain.dns
        if domain:
            # add www record
            wwwRecord = Record(domain, 'CNAME', 'www', domain_name)
            record = dns.add_record(wwwRecord)
            if not record:
                print('为域名：' + domain_name + '添加www记录失败！')

            # add @ record
            content = sites.get(site_id) + '-' + site_id + '.gb-bak.info'
            atRecord = Record(domain, 'CNAME', domain_name, content)
            record = dns.add_record(atRecord)
            if not record:
                print('为域名：' + domain_name + '添加@记录失败！')

            # add m record
            mRecord = Record(domain, 'CNAME', 'm', domain_name)
            record = dns.add_record(mRecord)
            if not record:
                print('为域名：' + domain_name + '添加m记录失败！')
        else:
            print('添加域名:' + domain_name + '失败！')


def add_pay_domain(domains):
    pass


def purge_all_cache(account_prefix):
    pass


def purge_cache_by_site(account_prefix, site_id):
    pass


def purge_cache_by_domain(account_prefix, domain_name):
    pass


def get_account_by_prefix(account_prefix):
    """
    通过帐号前缀获取cloudflare帐号对象
    :param account_prefix:  cloudflare帐号前缀
    :return:  cloudflare帐号对象
    """
    if account_prefix.startswith('dawoo'):
        return dawoobet_account
    elif account_prefix == 'main':
        return main_account
    elif account_prefix == 'bak':
        return bak_account
    elif account_prefix == 'site':
        return site_account
    elif account_prefix == 'adm':
        return adm_account
    elif account_prefix == 'pay':
        return pay_account
    elif account_prefix == 'vip':
        return vip_account
    elif account_prefix == 'lot':
        return lot_account
    elif account_prefix == 'lott':
        return lott_account
    else:
        print("未找到匹配前缀：" + account_prefix + "的cloudflare帐号!")


def _call_in_shell():
    """
    默认会调用的方法，仅在shell调用时有意义
    :return: None
    """
    __author__ = 'will'
    if len(sys.argv) == 1:
        return
    target_func = sys.argv[1]
    if target_func == 'add_bak_domain_in_shell':
        add_bak_domain_in_shell()

_call_in_shell()

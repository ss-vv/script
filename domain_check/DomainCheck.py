#!/usr/bin/python
# -*- coding: utf-8 -*-

'''
    检测域名情况
'''
from concurrent.futures import ThreadPoolExecutor
from socketserver import ThreadingMixIn

import dns.resolver

__author__ = 'will'

import sys
import platform
import traceback
import requests
from datetime import datetime
from http.server import BaseHTTPRequestHandler, HTTPServer
import logging.config

if platform.system() == 'Windows':
    logging.config.fileConfig('logging.conf')
else:
    logging.config.fileConfig('/usr/local/lib/python3.6/site-packages/domaincheck/logging.conf')
logger = logging.getLogger('root')

# 被墙后域名解析可能会返回的ip (参考https://zh.wikipedia.org/wiki/%E5%9F%9F%E5%90%8D%E6%9C%8D%E5%8A%A1%E5%99%A8%E7%BC%93%E5%AD%98%E6%B1%A1%E6%9F%93)
_mendacious_ips = {'4.36.66.178','8.7.198.45','23.89.5.60','31.13.74.40','37.61.54.158','42.123.125.237','46.82.174.68','49.2.123.56','54.76.135.1','59.24.3.173','60.19.29.22','61.131.208.210','61.131.208.211','64.33.88.161',
        '64.33.99.47','64.66.163.251','65.104.202.252','65.160.219.113','66.45.252.237','72.14.205.99','72.14.205.104','74.125.127.113','77.4.7.92','78.16.49.15','92.242.144.2','93.46.8.89','108.160.166.92',
        '110.249.209.42','118.5.49.6','120.192.83.163','123.129.254.12','123.129.254.13','123.129.254.14','123.129.254.15','125.211.213.132','128.121.126.139','159.106.121.75','169.132.13.103','183.221.250.11',
        '185.85.13.155','188.5.4.96','189.163.17.5','192.67.198.6','197.4.4.12','202.98.24.122','202.98.24.124','202.98.24.125','202.106.1.2','202.181.7.85','203.98.7.65','203.161.230.171','207.12.88.98',
        '208.56.31.43','209.36.73.33','209.145.54.50','209.220.30.174','211.94.66.147','211.98.70.195','211.98.70.226','211.98.70.227','211.98.71.195','211.138.34.204','211.138.74.132','213.169.251.35',
        '216.221.188.182','216.234.179.13','218.93.250.18','220.165.8.172','220.165.8.174','220.250.64.20','221.179.46.190','243.185.187.39','249.129.46.48','253.157.14.165','74.125.31.113','74.125.39.102',
        '74.125.39.113','74.125.127.102','74.125.130.47','74.125.155.102','209.85.229.138','210.242.125.20','0.0.0.0','2.1.1.2','4.193.80.0','8.105.84.0','12.87.133.0','16.63.155.0','20.139.56.0','24.51.184.0',
        '28.121.126.139','28.13.216.0','46.20.126.252','46.38.24.209','61.54.28.6','66.206.11.194','74.117.57.138','89.31.55.106','113.11.194.190','118.5.49.6','122.218.101.190','123.50.49.171','123.126.249.238',
        '125.230.148.48','127.0.0.2','173.201.216.6','203.199.57.81','208.109.138.55','211.5.133.18','211.8.69.27','213.186.33.5','216.139.213.144','221.8.69.27','243.185.187.3','243.185.187.30'}

_mendacious_ips.add('127.0.0.1') # 自己加的

# 未知错误
UNKNOWN_ERR = 'UNKNOWN_ERR'
# 正常
NORMAL = 'NORMAL'
# 域名被墙
WALLED_OFF = 'WALLED_OFF'
# 域名被劫持
BE_HIJACKED = 'BE_HIJACKED'
# 域名未解析
UNRESOLVED = 'UNRESOLVED'
# 域名未受权
UNAUTHORIZED = 'UNAUTHORIZED'
# 服务器不通
SERVER_UNREACHABLE = 'SERVER_UNREACHABLE'
# 被跳转
REDIRECT = 'REDIRECT'
# SSL证书问题
SSL_ERROR = 'SSL_ERROR'


class HttpRequestHandler(BaseHTTPRequestHandler):
    def _set_headers(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_GET(self):
        self._set_headers()
        if self.path.find('domain_check') == -1:
            self.wfile.write(b"404")
        else:
            arg_dict = self._parse_arg(self.path)
            logger.info('接收到域名检测请求:'+arg_dict['domain'])
            result = self.check(arg_dict, '0', datetime.now())
            logger.debug('%s返回%s' %(arg_dict['domain'], result))
            self.wfile.write(result.encode('utf-8'))

    def _parse_arg(self, url):
        args_str = url[url.index('?') + 1:]
        args = args_str.split('&')
        arg_dict = {}
        for arg in args:
            name_value = arg.split('=')
            arg_dict[name_value[0]] = name_value[1]
        return arg_dict

    def check(self, arg_dict, is_https, start_time, retry_times=3):
        domain = arg_dict['domain']
        ips_str = arg_dict.get('ips')
        logger.info('ips: '+ips_str)
        result = None
        if ips_str:
            try:
                answers = dns.resolver.query(domain, dns.rdatatype.A)
                server_ips = {a.address for a in answers}
            except Exception as e:
                logger.info(e)
                return UNRESOLVED
            logger.info('server_ips: %s' %server_ips)
            if len(server_ips) == 0:
                return UNRESOLVED
            if server_ips & _mendacious_ips:
                return WALLED_OFF
            ips = set(ips_str.split(','))
            if not server_ips & ips:
                try:
                    response = requests.get('http://%s' % domain)
                    logger.info('被劫持到%s' % response.request.url)
                except Exception as e:
                    logger.error(e)
                result = [BE_HIJACKED, str(server_ips)]
        if result is None:
            result = self.do_check(arg_dict, is_https)
        if retry_times and isinstance(result, list) and (result[0] == UNKNOWN_ERR or result[0] == UNRESOLVED or result[0] == SERVER_UNREACHABLE): # retry
            logger.info('需要重试 %s' %result[0])
            retry_times -= 1
            if result[1].find('certificate verify failed') != -1:
                logger.error('certificate verify failed')
                is_https = '1'
            return self.check(arg_dict, is_https, datetime.now(), retry_times)
        else:
            cost = (datetime.now() - start_time).microseconds/1000 if result == 'NORMAL' else -1
            logger.debug(result)
            if isinstance(result, list):
                result_str = '___'.join([result[0], str(cost), result[1]])
            else:
                result_str = '___'.join([result, str(cost), ''])
            return result_str

    def do_check(self, arg_dict: dict, is_https):
        domain = arg_dict['domain']
        protocol = 'https' if is_https == '1' else 'http'
        url = '%s://%s/__check' % (protocol, domain)
        headers = {'Host': 'gamebox.com'}
        logger.info('开始检测 %s' %url)
        try:
            response = requests.get(url, headers=headers, timeout=5)
        except Exception as e:
            logger.error(e)
            err_str = str(e)
            if err_str.find('Network is unreachable') != -1 or err_str.find('Connection timed out') != -1:
                return [SERVER_UNREACHABLE, err_str]
            if err_str.find('Name or service not known') != -1 or err_str.find('[Errno 11001]') != -1:
                return [UNRESOLVED, err_str]
            if err_str.find('10054') != -1 or err_str.find('11004') != -1:
                return [WALLED_OFF, err_str]
            # if err_str.find('certificate verify failed') != -1:
            #     return [SSL_ERROR, err_str]
            return [UNKNOWN_ERR, err_str]

        if response.status_code == 200:
            result = response.text.strip()
            if result == 'OK':
                return NORMAL
            elif result == 'domain invalid':
                return UNAUTHORIZED
            else:
                # 高防跳转页面“如果您的页面没有自动跳转，请点击这里” (如果没有加白名单会出现)
                # if result.find('&#x5982;&#x679C;&#x60A8;&#x7684;&#x9875;&#x9762;&#x6CA1;&#x6709;&#x81EA;&#x52A8;&#x8DF3;&#x8F6C;&#xFF0C;&#x8BF7;&#x70B9;&#x51FB;&#x8FD9;&#x91CC;') != -1:
                #     return NORMAL
                logger.info('response.request.path_url: %s' % response.request.path_url )
                logger.info('response.request.url: %s' %response.request.url)
                logger.info('text: %s' % result[:200])
                if response.request.path_url != '/__check' or response.request.url != url:
                    return [REDIRECT, response.request.url.replace('/__check', '')]
                return BE_HIJACKED  # 被劫持、没有__check请求
        if response.status_code == 404:
            logger.info('404')
            if arg_dict['is_our_server'] == '1':
                return BE_HIJACKED  # 没有__check请求
            else:
                return NORMAL
        else:
            return [UNKNOWN_ERR, str(response.status_code)]

class MultiThreadedHTTPServer(ThreadingMixIn, HTTPServer):
    pool = ThreadPoolExecutor(max_workers=200)

    def process_request(self, request, client_address):
        self.pool.submit(self.process_request_thread, request, client_address)


def run():
    server_address = ('', 8787)
    httpd = MultiThreadedHTTPServer(server_address, HttpRequestHandler)
    print('Starting httpd...')
    httpd.serve_forever()


if __name__ == '__main__':
    sys.excepthook = lambda type_, value, traceback_: traceback.print_exception(type_, value, traceback_)
    run()

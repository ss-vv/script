from cf import CF

# CF.add_bak_domain('111', 'aaa.com')

domains = CF.get_account_by_prefix('site').get_all_domains()
print(domains)

# print("%s+%s=%s" %(1, 2, 3))
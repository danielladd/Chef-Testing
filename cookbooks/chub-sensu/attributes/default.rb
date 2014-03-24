default["sensu"]["use_ssl"] = false
default['chub-sensu']['email']['sender'] = 'sensu@commercehub.com'
default['chub-sensu']['email']['recipient'] = ''
default['chub-sensu']['email']['smtp_server'] = 'mail.commercehub.com'
default['chub-sensu']['email']['smtp_port'] = 25
default['chub-sensu']['email']['smtp_domain'] = 'commercehub.com'
default['chub-sensu']['graphite']['host'] = "stats02"
default['chub-sensu']['graphite']['port'] = 2003

# TODO: Temporary, Should this be moved to encrypted databag?
default['chub-sensu']['pagerduty']['api_key'] = ""
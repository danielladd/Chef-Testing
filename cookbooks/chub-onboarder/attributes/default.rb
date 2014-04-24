default['chub-onboarder']['app']['port'] = "9300"
default['chub-onboarder']['app']['config_dir']	= '/etc/onboarder'
default['chub-onboarder']['app']['deploy_dir'] = '/opt/onboarder'
default['chub-onboarder']['app']['log_dir'] = '/var/log/onboarder'
default['chub-onboarder']['app']['config_file_name'] = 'onboarder-config.groovy'
default['chub-onboarder']['app']['app_name'] = 'onboarder'
default['chub-onboarder']['app']['jar_file_url'] = 'OVERRIDE ME'
default['chub-onboarder']['app']['touchfile'] = "node['chub-onboarder']['app']['app_dir']/deployed"

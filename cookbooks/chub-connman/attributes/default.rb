default['chub-connman']['app']['port'] = "9400"
default['chub-connman']['app']['config_dir']	= '/etc/connman'
default['chub-connman']['app']['deploy_dir'] = '/opt/connman'
default['chub-connman']['app']['log_dir'] = '/var/log/connman'
default['chub-connman']['app']['config_file_name'] = 'connman-config.groovy'
default['chub-connman']['app']['app_name'] = 'connman'
default['chub-connman']['app']['jar_file_url'] = 'OVERRIDE ME'
default['chub-connman']['app']['touchfile'] = "node['chub-connman']['app']['app_dir']/deployed"

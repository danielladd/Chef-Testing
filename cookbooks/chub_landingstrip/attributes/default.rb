default['chub_landingstrip']['app']['port'] = "9100"
default['chub_landingstrip']['app']['config_dir']	= '/etc/landingstrip'
default['chub_landingstrip']['app']['deploy_dir'] = '/opt/landingstrip'
default['chub_landingstrip']['app']['log_dir'] = '/var/log/landingstrip'
default['chub_landingstrip']['app']['config_file_name'] = 'landingstrip-config.groovy'
default['chub_landingstrip']['app']['app_name'] = 'landingstrip'
default['chub_landingstrip']['app']['jar_file_url'] = 'OVERRIDE ME'
default['chub_landingstrip']['app']['touchfile'] = "node['chub_landingstrip']['app']['app_dir']/deployed"

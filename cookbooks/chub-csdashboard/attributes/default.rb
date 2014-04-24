default['chub-csdashboard']['app']['port'] = "9200"
default['chub-csdashboard']['app']['config_dir']	= '/etc/csdashboard'
default['chub-csdashboard']['app']['deploy_dir'] = '/opt/csdashboard'
default['chub-csdashboard']['app']['log_dir'] = '/var/log/csdashboard'
default['chub-csdashboard']['app']['config_file_name'] = 'csdashboard-config.groovy'
default['chub-csdashboard']['app']['app_name'] = 'csdashboard'
default['chub-csdashboard']['app']['jar_file_url'] = 'OVERRIDE ME'
default['chub-csdashboard']['app']['touchfile'] = "node['chub-csdashboard']['app']['app_dir']/deployed"

default['chub-connman']['app']['port'] = "9400"
default['chub-connman']['app']['deploy_dir'] = '/opt/connman'
default['chub-connman'][:app][:staging_dir] = '/opt/connman-staging'
default['chub-connman']['app']['config_file_name'] = 'connman-config.groovy'
default['chub-connman']['app']['app_name'] = 'connman'
default['chub-connman']['app']['jar_file_url'] = 'OVERRIDE ME'
default['chub-connman']['app']['touchfile'] = "#{node['chub-connman'][:deploy_dir]}/deployed"
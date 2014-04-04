default['java']['install_flavor']							= 'oracle'
default['java']['oracle']['accept_oracle_download_terms']	= true
default['java']['jdk_version']								= 7
default['tomcat']['base_version']							= 7

default['chub-connman']['app']['config_dir']	= '/etc/connman'
default['chub-connman']['app']['app_dir'] = '/opt/connman'
default['chub-connman']['app']['log_dir'] = '/var/log/connman'
default['chub-connman']['app']['config_file_name'] = 'connman-config.groovy'
default['chub-connman']['app']['log4j']['root_loglevel'] = 'info'
default['chub-connman']['app']['app_name'] = 'connman'
default['chub-connman']['app']['bamboo_server_name'] = 'bamboom1'
default['chub-connman']['app']['bamboo_server_port'] = '8085'
default['chub-connman']['app']['bamboo_server_build_project'] = 'MC'
default['chub-connman']['app']['bamboo_server_build_key'] = 'CSD'
default['chub-connman']['app']['bamboo_server_artifact'] = 'CS-Dashboard'
default['chub-connman']['app']['bamboo_server_artifact_file_name'] = 'csd.war'

default['java']['install_flavor']							= 'oracle'
default['java']['oracle']['accept_oracle_download_terms']	= true
default['java']['jdk_version']								= 7
default['tomcat']['base_version']							= 7

default['chub-onboarder']['app']['config_dir']	= '/etc/onboarder'
default['chub-onboarder']['app']['app_dir'] = '/opt/onboarder'
default['chub-onboarder']['app']['log_dir'] = '/var/log/onboarder'
default['chub-onboarder']['app']['config_file_name'] = 'onboarder-config.groovy'
default['chub-onboarder']['app']['log4j']['root_loglevel'] = 'info'
default['chub-onboarder']['app']['app_name'] = 'onboarder'
default['chub-onboarder']['app']['bamboo_server_name'] = 'bamboom1'
default['chub-onboarder']['app']['bamboo_server_port'] = '8085'
default['chub-onboarder']['app']['bamboo_server_build_project'] = 'MC'
default['chub-onboarder']['app']['bamboo_server_build_key'] = 'CSD'
default['chub-onboarder']['app']['bamboo_server_artifact'] = 'CS-Dashboard'
default['chub-onboarder']['app']['bamboo_server_artifact_file_name'] = 'csd.war'

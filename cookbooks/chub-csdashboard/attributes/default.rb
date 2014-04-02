default['java']['install_flavor']							= 'oracle'
default['java']['oracle']['accept_oracle_download_terms']	= true
default['java']['jdk_version']								= 7
default['tomcat']['base_version']							= 7

default['chub-csdashboard']['app']['config_dir']	= '/etc/csdashboard'
default['chub-csdashboard']['app']['app_dir'] = '/opt/csdashboard'
default['chub-csdashboard']['app']['log_dir'] = '/var/log/csdashboard'
default['chub-csdashboard']['app']['config_file_name'] = 'csdashboard-config.groovy'
default['chub-csdashboard']['app']['log4j']['root_loglevel'] = 'info'
default['chub-csdashboard']['app']['app_name'] = 'csdashboard'
default['chub-csdashboard']['app']['bamboo_server_name'] = 'bamboom1'
default['chub-csdashboard']['app']['bamboo_server_port'] = '8085'
default['chub-csdashboard']['app']['bamboo_server_build_project'] = 'MC'
default['chub-csdashboard']['app']['bamboo_server_build_key'] = 'CSD'
default['chub-csdashboard']['app']['bamboo_server_artifact'] = 'CS-Dashboard'
default['chub-csdashboard']['app']['bamboo_server_artifact_file_name'] = 'csd.war'

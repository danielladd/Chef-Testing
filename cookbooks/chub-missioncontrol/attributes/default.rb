###############################OTHER_DEFAULT-APP-SERVICE-DEFAULTS########################################

default['java']['install_flavor']							= 'oracle'
default['java']['oracle']['accept_oracle_download_terms']	= true
default['java']['jdk_version']								= 7
default['tomcat']['base_version']							= 7
default['tomcat']['port'] = "9100"

###############################MISSION-CONTROL-APP-SERVICE-DEFAULTS########################################

default['chub-missioncontrol']['app']['config_dir']	= '/etc/missioncontrol'
default['chub-missioncontrol']['app']['app_dir'] = '/opt/missioncontrol'
default['chub-missioncontrol']['app']['log_dir'] = '/var/log/missioncontrol'
default['chub-missioncontrol']['app']['config_file_name'] = 'missioncontrol-config.groovy'
default['chub-missioncontrol']['app']['log4j']['root_loglevel'] = 'info'
default['chub-missioncontrol']['app']['app_name'] = 'landingstrip'
default['chub-missioncontrol']['app']['war_file_url'] = 'OVERRIDE ME'
default['chub-missioncontrol']['app']['touchfile'] = "node['chub-missioncontrol']['app']['app_dir']/deployed"
#default['chub-missioncontrol']['app']['mongodb'] = 'localhost'
#default['chub-missioncontrol']['app']['mongodb_port'] = '27017'

###############################WEB-SERVICE-DEFAULTS########################################

default['chub-missioncontrol']['webservice']['staging_dir']	= '/opt/onboarding_web_service-staging'
default['chub-missioncontrol']['webservice']['deploy_dir']	= '/opt/onboarding_web_service'
default['chub-missioncontrol']['webservice']['jar_file_name'] = 'template.jar'
default['chub-missioncontrol']['webservice']['config_file_name'] = 'config.yml'
default['chub-missioncontrol']['webservice']['jar_file_url'] = 'OVERRIDE ME'
default['chub-missioncontrol']['webservice']['config_dir']	= '/etc/webservice'
default['chub-missioncontrol']['webservice']['log_dir'] = '/var/log/webservice'
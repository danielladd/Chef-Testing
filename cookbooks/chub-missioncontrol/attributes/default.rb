###############################OTHER_DEFAULT-APP-SERVICE-DEFAULTS########################################

default['java']['install_flavor']							= 'oracle'
default['java']['oracle']['accept_oracle_download_terms']	= true
default['java']['jdk_version']								= 7
default['tomcat']['base_version']							= 7

###############################MISSION-CONTROL-APP-SERVICE-DEFAULTS########################################

default['chub-missioncontrol']['app']['config_dir']	= '/etc/missioncontrol'
default['chub-missioncontrol']['app']['app_dir'] = '/opt/missioncontrol'
default['chub-missioncontrol']['app']['log_dir'] = '/var/log/missioncontrol'
default['chub-missioncontrol']['app']['config_file_name'] = 'missioncontrol-config.groovy'
default['chub-missioncontrol']['app']['log4j']['root_loglevel'] = 'info'
default['chub-missioncontrol']['app']['app_name'] = 'bootstrap'
default['chub-missioncontrol']['app']['bamboo_server_name'] = 'bamboom1'
default['chub-missioncontrol']['app']['bamboo_server_port'] = '8085'
default['chub-missioncontrol']['app']['bamboo_server_build_project'] = 'MC'
default['chub-missioncontrol']['app']['bamboo_server_build_key'] = 'YOU FORGOT TO OVERRIDE ME'
default['chub-missioncontrol']['app']['bamboo_server_artifact'] = 'Bootstrap-demo'
default['chub-missioncontrol']['app']['bamboo_server_artifact_file_name'] = 'bootstrap.war'

###############################WEB-SERVICE-DEFAULTS########################################

default['chub-missioncontrol']['webservice']['staging_dir']	= '/opt/missioncontrol/webservice-staging'
default['chub-missioncontrol']['webservice']['deploy_dir']	= '/opt/missioncontrol/webservice'
default["chub-missioncontrol"]['webservice']['jar_name'] = 'inventory-web-service-demo-standalone.jar'
default["chub-missioncontrol"]['webservice']['property_file_name'] = 'inventory-web-service-demo-standalone-deploy.properties'
default["chub-missioncontrol"]['webservice']['service_name'] = 'webservice'
default["chub-missioncontrol"]['webservice']['jmxHeapMax'] = '256'
default["chub-missioncontrol"]['webservice']['permGenMax'] = '256'

default['chub-missioncontrol']['webservice']['bamboo_server_name'] = 'bamboom1'
default['chub-missioncontrol']['webservice']['bamboo_server_port'] = '8085'
default['chub-missioncontrol']['webservice']['bamboo_server_build_project'] = 'MC'
default['chub-missioncontrol']['webservice']['bamboo_server_build_key'] = 'YOU FORGOT TO OVERRIDE ME'
default['chub-missioncontrol']['webservice']['bamboo_server_artifact'] = 'Inventory-Web-Service-demo'
default['chub-missioncontrol']['webservice']['bamboo_server_artifact_file_name'] = 'inventory-web-service-demo-standalone.jar'
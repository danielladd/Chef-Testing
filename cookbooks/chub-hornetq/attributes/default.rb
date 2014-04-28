default['chub-hornetq']['version'] = '2.2.5.Final'
default['chub-hornetq']['internal_http_uri'] = "http://files.nexus.commercehub.com/files/hornetq/hornetq-#{node['chub-hornetq']['version']}.tar.gz"
default['chub-hornetq']['origin_http_uri'] = "http://downloads.jboss.org/hornetq/hornetq-#{node['chub-hornetq']['version']}.tar.gz"
default['chub-hornetq']['base_dir'] = '/opt'
default['chub-hornetq']['app_dir'] = '/opt/hornetq'
default['chub-hornetq']['staging_dir'] = '/opt/staging'
default['chub-hornetq']['config_dir'] = '/etc/hornetq'
default['chub-hornetq']['deploy_prop'] = "hornetq-deploy.properties"
default['chub-hornetq']['jar_name'] = "hornetq-deploy.jar"
default['chub-hornetq']['deploy_jar_url'] = "OVERRIDE_ME_PLZ"
default['chub-hornetq']['hornetq_data_dir'] = ""
default['chub-hornetq']['jvm_heap_max'] = 512
default['chub-hornetq']['jvm_perm_max'] = 64
default['chub-hornetq']['hornetq_data_dir'] = "#{node['chub-hornetq']['app_dir']}/data"
default['chub-hornetq']['pathtojava'] = '/usr/lib/jvm/jdk1.7.0_51'

# MQ Destinations Props
default['chub-hornetq']['destinations_to_deploy'] = "ALL"
default['chub-hornetq']['destinations_deploy_prop'] = "mqdestinations-deploy.properties"
default['chub-hornetq']['destinations_jar_name'] = "mq-destinations-deploy.jar"
default['chub-hornetq']['destinations_deploy_jar_url'] = "OVERRIDE_ME_PLZ"

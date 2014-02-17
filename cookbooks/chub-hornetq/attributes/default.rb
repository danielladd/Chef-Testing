default['chub-hornetq']['version'] = '2.2.5.Final'
default['chub-hornetq']['internal_http_uri'] = "http://files.nexus.commercehub.com/files/hornetq/hornetq-#{node['chub-hornetq']['version']}.tar.gz"
default['chub-hornetq']['origin_http_uri'] = "http://downloads.jboss.org/hornetq/hornetq-#{node['chub-hornetq']['version']}.tar.gz"
default['chub-hornetq']['base_dir'] = '/opt'
default['chub-hornetq']['app_dir'] = '/opt/hornetq'
default['chub-hornetq']['config_dir'] = '/etc/hornetq'
#default['chub-hornetq']['config_dir'] = node['chub-hornetq']['app_dir']/config/non-clustered/


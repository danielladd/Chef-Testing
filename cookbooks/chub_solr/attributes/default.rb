default['chub_solr']['version']		= '4.4.0'
default['chub_solr']['config_dir']	= '/etc/solr'	# This may need to be some crazy tomcatty dir
default['chub_solr']['app_dir']		= node[:tomcat][:webapp_dir]
default['chub_solr']['base']		= '/var/solr'
default['chub_solr']['home']		= "#{node['chub_solr']['base']}/homes"
default['chub_solr']['cores_dir']	= "#{node['chub_solr']['base']}/cores"
default['chub_solr']['data_dir']	= "#{node['chub_solr']['base']}/data"

default['chub_solr']['user']		= node[:tomcat][:user]
default['chub_solr']['group']		= node[:tomcat][:group]
default['chub_solr']['log_dir']		= '/var/log/solr'
default['chub_solr']['origin_http_uri']	= "http://archive.apache.org/dist/lucene/solr/#{node['chub_solr']['version']}/solr-#{node['chub_solr']['version']}.tgz"

default['chub_solr']['cores']		= [	'marketplaceProduct', 'product', 'user', 'company', 'help', 'channelProduct' ]
default['chub_solr']['port']		= '8983'
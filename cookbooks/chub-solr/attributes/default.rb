default['chub-solr']['version']		= '4.4.0'
default['chub-solr']['config_dir']	= '/etc/solr'	# This may need to be some crazy tomcatty dir
default['chub-solr']['app_dir']		= node[:tomcat][:webapp_dir]
default['chub-solr']['base']		= '/var/solr'
default['chub-solr']['home']		= "#{node['chub-solr']['base']}/homes"
default['chub-solr']['cores_dir']	= "#{node['chub-solr']['base']}/cores"
default['chub-solr']['data_dir']	= "#{node['chub-solr']['base']}/data"

default['chub-solr']['user']		= node[:tomcat][:user]
default['chub-solr']['group']		= node[:tomcat][:group]
default['chub-solr']['log_dir']		= '/var/log/solr'
default['chub-solr']['origin_http_uri']	= "http://archive.apache.org/dist/lucene/solr/#{node['chub-solr']['version']}/solr-#{node['chub-solr']['version']}.tgz"

default['chub-solr']['cores']		= [	'marketplaceProduct', 'product', 'user', 'company', 'help', 'channelProduct' ]
default['chub-solr']['port']		= '8983'
#normal['tomcat']['base_version']	= '7'
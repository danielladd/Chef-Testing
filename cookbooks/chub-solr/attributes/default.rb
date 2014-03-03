default['chub-solr']['version']		= '4.4.0'
default['chub-solr']['config_dir']	= "/etc/solr"	# This may need to be some crazy tomcatty dir
# # Use these when solr includes an embedded Tomcat
# default['chub-solr']['user']		= 'solr'
# default['chub-solr']['group']		= 'solr'
# default['chub-solr']['app_dir']	= '/opt/solr'
# default['chub-solr']['log_dir']	= '/var/log/solr'
# default['chub-solr']['data_dir']	= '/var/solr'
# default['chub-solr']['temp_dir']	= '/tmp/solr'
default['chub-solr']['app_dir']		= node['tomcat']['webapp_dir']
default['chub-solr']['user']		= node['tomcat']['user']
default['chub-solr']['group']		= node['tomcat']['group']
default['chub-solr']['log_dir']		= '/var/log/solr'
default['chub-solr']['data_dir']	= '/var/solr'
default['chub-solr']['temp_dir']	= '/tmp/solr'
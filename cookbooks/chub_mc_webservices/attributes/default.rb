default[:chub_mc_webservice][:flight][:deploy_dir] = 'opt/mc-webservices/flight'
default[:chub_mc_webservice][:flight][:staging_dir] = 'opt/mc-webservices-staging/flight'
default[:chub_mc_webservice][:flight][:jar_file_url] = 'OVERRIDE ME'

default[:chub_mc_webservice][:salesforce][:deploy_dir] = 'opt/mc-webservices/salesforce'
default[:chub_mc_webservice][:salesforce][:staging_dir] = 'opt/mc-webservices-staging/salesforce'
default[:chub_mc_webservice][:salesforce][:jar_file_url] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:jar_file_name] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config_file_name] = 'salesforce_webservice_config.yml'
default[:chub_mc_webservice][:salesforce][:touchfile] = "#{node[:chub_mc_webservice][:salesforce][:deploy_dir]}/deployed"
default[:chub_mc_webservice][:salesforce][:salesforceClient_client] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:salesforceClient_host] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:salesforceClient_clientId] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:salesforceClient_clientSecret] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:salesforceClient_username] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:salesforceClient_password] = 'OVERRIDE ME'


default[:chub_mc_webservice][:netsuite][:deploy_dir] = 'opt/mc-webservices/netsuite'
default[:chub_mc_webservice][:netsuite][:staging_dir] = 'opt/mc-webservices-staging/netsuite'
default[:chub_mc_webservice][:netsuite][:jar_file_url] = 'OVERRIDE ME'
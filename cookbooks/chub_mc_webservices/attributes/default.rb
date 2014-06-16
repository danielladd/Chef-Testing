default[:chub_mc_webservice][:connman][:log_dir] = '/var/log/ConnMgrService'
default[:chub_mc_webservice][:connman][:deploy_dir] = '/opt/connman-webservice'
default[:chub_mc_webservice][:connman][:staging_dir] = '/opt/connman-webservice-staging'
default[:chub_mc_webservice][:connman][:jar_file_url] = 'OVERRIDE ME'
default[:chub_mc_webservice][:connman][:jar_file_name] = 'OVERRIDE ME'
default[:chub_mc_webservice][:connman][:config_file_name] = 'connman_webservice_config.json'
default[:chub_mc_webservice][:connman][:touchfile] = "#{node[:chub_mc_webservice][:connman][:deploy_dir]}/deployed"

default[:chub_mc_webservice][:salesforce][:deploy_dir] = '/opt/mc-webservices/salesforce'
default[:chub_mc_webservice][:salesforce][:staging_dir] = '/opt/mc-webservices-staging/salesforce'
default[:chub_mc_webservice][:salesforce][:jar_file_url] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:jar_file_name] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config_file_name] = 'salesforce_webservice_config.yml'
default[:chub_mc_webservice][:salesforce][:touchfile] = "#{node[:chub_mc_webservice][:salesforce][:deploy_dir]}/deployed"
default[:chub_mc_webservice][:salesforce][:config][:salesforceClient][:host] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config][:salesforceClient][:clientId] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config][:salesforceClient][:clientSecret] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config][:salesforceClient][:username] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config][:salesforceClient][:password] = 'OVERRIDE ME'


default[:chub_mc_webservice][:netsuite][:deploy_dir] = '/opt/mc-webservices/netsuite'
default[:chub_mc_webservice][:netsuite][:staging_dir] = '/opt/mc-webservices-staging/netsuite'
default[:chub_mc_webservice][:netsuite][:jar_file_url] = 'OVERRIDE ME'
default[:chub_mc_webservice][:netsuite][:config][:netSuiteClient][:host] = 'https://rest.sandbox.netsuite.com'
default[:chub_mc_webservice][:netsuite][:config][:netSuiteClient][:path] = '/app/site/hosting/restlet.nl'
default[:chub_mc_webservice][:netsuite][:config][:netSuiteClient][:script] = '477'
default[:chub_mc_webservice][:netsuite][:config][:netSuiteClient][:deploy] = '1'
default[:chub_mc_webservice][:netsuite][:config][:netSuiteClient][:account] = '365224'
default[:chub_mc_webservice][:netsuite][:config][:netSuiteClient][:email] = 'OVERRIDE ME'
default[:chub_mc_webservice][:netsuite][:config][:netSuiteClient][:signature] = 'OVERRIDE ME'
default[:chub_mc_webservice][:netsuite][:config][:netSuiteClient][:role] = '1037'
default[:chub_mc_webservice][:netsuite][:config][:netSuiteClient][:maxConnections] = '50'
default[:chub_mc_webservice][:netsuite][:config][:netSuiteClient][:gzipEnabledForRequests] = 'false'


default[:chub_mc_webservice][:systems][:log_dir] = '/var/log/systems-webservice'
default[:chub_mc_webservice][:systems][:deploy_dir] = '/opt/systems-webservice'
default[:chub_mc_webservice][:systems][:staging_dir] = '/opt/systems-webservice-staging'
default[:chub_mc_webservice][:systems][:jar_file_url] = 'OVERRIDE ME'
default[:chub_mc_webservice][:systems][:jar_file_name] = 'OVERRIDE ME'
default[:chub_mc_webservice][:systems][:config_file_name] = 'systems_webservice_config.yml'
default[:chub_mc_webservice][:systems][:touchfile] = "#{node[:chub_mc_webservice][:systems][:deploy_dir]}/deployed"

default[:chub_mc_webservice][:flight][:log_dir] = '/var/log/flight-webservice'
default[:chub_mc_webservice][:flight][:deploy_dir] = '/opt/flight-webservice'
default[:chub_mc_webservice][:flight][:staging_dir] = '/opt/flight-webservice-staging'
default[:chub_mc_webservice][:flight][:jar_file_url] = 'OVERRIDE ME'
default[:chub_mc_webservice][:flight][:jar_file_name] = 'OVERRIDE ME'
default[:chub_mc_webservice][:flight][:touchfile] = "#{node[:chub_mc_webservice][:flight][:deploy_dir]}/deployed"

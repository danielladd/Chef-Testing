default[:chub_mc_webservice][:connman][:log_dir] = '/var/log/ConnMgrService'
default[:chub_mc_webservice][:connman][:deploy_dir] = '/opt/connman-webservice'
default[:chub_mc_webservice][:connman][:staging_dir] = '/opt/connman-webservice-staging'
default[:chub_mc_webservice][:connman][:jar_file_url] = 'OVERRIDE ME'
default[:chub_mc_webservice][:connman][:jar_file_name] = 'OVERRIDE ME'
default[:chub_mc_webservice][:connman][:config_file_name] = 'connman_webservice_config.json'
default[:chub_mc_webservice][:connman][:touchfile] = "#{node[:chub_mc_webservice][:connman][:deploy_dir]}/deployed"

default[:chub_mc_webservice][:salesforce][:deploy_dir] = '/opt/salesforce-webservice'
default[:chub_mc_webservice][:salesforce][:staging_dir] = '/opt/salesforce-webservice-staging'
default[:chub_mc_webservice][:salesforce][:jar_file_url] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:jar_file_name] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config_file_name] = 'salesforce_webservice_config.yml'
default[:chub_mc_webservice][:salesforce][:touchfile] = "#{node[:chub_mc_webservice][:salesforce][:deploy_dir]}/deployed"
default[:chub_mc_webservice][:salesforce][:config][:salesforceClient][:host] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config][:salesforceClient][:clientId] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config][:salesforceClient][:clientSecret] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config][:salesforceClient][:username] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config][:salesforceClient][:password] = 'OVERRIDE ME'


default[:chub_mc_webservice][:netsuite][:deploy_dir] = '/opt/netsuite-webservice'
default[:chub_mc_webservice][:netsuite][:staging_dir] = '/opt/netsuite-webservice-staging'
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
default[:chub_mc_webservice][:flight][:config_file_name] = 'flight_webservice_config.yml'
default[:chub_mc_webservice][:flight][:touchfile] = "#{node[:chub_mc_webservice][:flight][:deploy_dir]}/deployed"
default[:chub_mc_webservice][:flight][:config][:setupDatabase][:serverName] = 'OVERRIDE ME'
default[:chub_mc_webservice][:flight][:config][:setupDatabase][:user]  = 'OVERRIDE ME'
default[:chub_mc_webservice][:flight][:config][:setupDatabase][:password]  = 'OVERRIDE ME'
default[:chub_mc_webservice][:flight][:config][:setupDatabase][:databaseName]  = 'OVERRIDE ME'
default[:chub_mc_webservice][:flight][:config][:testDatabase][:serverName] = 'OVERRIDE ME'
default[:chub_mc_webservice][:flight][:config][:testDatabase][:user]  = 'OVERRIDE ME'
default[:chub_mc_webservice][:flight][:config][:testDatabase][:password]  = 'OVERRIDE ME'
default[:chub_mc_webservice][:flight][:config][:testDatabase][:databaseName]  = 'OVERRIDE ME'
default[:chub_mc_webservice][:flight][:config][:prodDatabase][:serverName] = 'OVERRIDE ME'
default[:chub_mc_webservice][:flight][:config][:prodDatabase][:user]  = 'OVERRIDE ME'
default[:chub_mc_webservice][:flight][:config][:prodDatabase][:password]  = 'OVERRIDE ME'
default[:chub_mc_webservice][:flight][:config][:prodDatabase][:databaseName]  = 'OVERRIDE ME'

default[:chub_mc_webservice][:pgen][:log_dir] = '/var/log/pgen-webservice'
default[:chub_mc_webservice][:pgen][:deploy_dir] = '/opt/pgen-webservice'
default[:chub_mc_webservice][:pgen][:staging_dir] = '/opt/pgen-webservice-staging'
default[:chub_mc_webservice][:pgen][:jar_file_url] = 'OVERRIDE ME'
default[:chub_mc_webservice][:pgen][:jar_file_name] = 'OVERRIDE ME'
default[:chub_mc_webservice][:pgen][:touchfile] = "#{node[:chub_mc_webservice][:pgen][:deploy_dir]}/deployed"

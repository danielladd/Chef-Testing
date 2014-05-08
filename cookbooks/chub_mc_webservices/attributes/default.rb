default[:chub_mc_webservice][:onboarding][:deploy_dir] = 'opt/mc-webservices/onboarding'
default[:chub_mc_webservice][:onboarding][:staging_dir] = 'opt/mc-webservices-staging/onboarding'
default[:chub_mc_webservice][:onboarding][:jar_file_url] = 'OVERRIDE ME'
default[:chub_mc_webservice][:onboarding][:jar_file_name] = 'OVERRIDE ME'
default[:chub_mc_webservice][:onboarding][:config_file_name] = 'onboarding_webservice_config.yml'
default[:chub_mc_webservice][:onboarding][:touchfile] = "#{node[:chub_mc_webservice][:onboarding][:deploy_dir]}/deployed"

default[:chub_mc_webservice][:salesforce][:deploy_dir] = 'opt/mc-webservices/salesforce'
default[:chub_mc_webservice][:salesforce][:staging_dir] = 'opt/mc-webservices-staging/salesforce'
default[:chub_mc_webservice][:salesforce][:jar_file_url] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:jar_file_name] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config_file_name] = 'salesforce_webservice_config.yml'
default[:chub_mc_webservice][:salesforce][:touchfile] = "#{node[:chub_mc_webservice][:salesforce][:deploy_dir]}/deployed"
default[:chub_mc_webservice][:salesforce][:config][:salesforceClient][:client] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config][:salesforceClient][:host] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config][:salesforceClient][:clientId] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config][:salesforceClient][:clientSecret] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config][:salesforceClient][:username] = 'OVERRIDE ME'
default[:chub_mc_webservice][:salesforce][:config][:salesforceClient][:password] = 'OVERRIDE ME'


default[:chub_mc_webservice][:netsuite][:deploy_dir] = 'opt/mc-webservices/netsuite'
default[:chub_mc_webservice][:netsuite][:staging_dir] = 'opt/mc-webservices-staging/netsuite'
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
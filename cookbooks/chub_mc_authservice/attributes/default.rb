default[:chub_mc_authservice][:http_port] = "5080"
default[:chub_mc_authservice][:https_port] = "5443"
default[:chub_mc_authservice][:key_alias] = "localsso"
default[:chub_mc_authservice][:keystore_file] = "localsso.jks"
default[:chub_mc_authservice][:keystore_password] = "changeme"
default[:chub_mc_authservice][:config_dir] = '/etc/mc-authservice'
default[:chub_mc_authservice][:deploy_dir] = '/opt/mc-authservice'
default[:chub_mc_authservice][:log_dir] = '/opt/mc-authservice/logs'
default[:chub_mc_authservice][:jar_file_url] = 'OVERRIDE ME'
default[:chub_mc_authservice][:keystore_file_url] = 'OVERRIDE ME'
default[:chub_mc_authservice][:jar_file_name] = 'mc-authservice-1.0-SNAPSHOT-war-exec.jar' 
default[:chub_mc_authservice][:touchfile] = "node[:chub_mc_authservice][:deploy_dir]/jar_deployed"

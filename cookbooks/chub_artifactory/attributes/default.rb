default[:chub_artifactory][:port] = "OVERRIDE_ME"
default[:chub_artifactory][:app_name] = "OVERRIDE_ME"
default[:chub_artifactory][:deploy_dir] = "/opt/#{node[:chub_artifactory][:app_name]}"
default[:chub_artifactory][:staging_dir] = "/opt/#{node[:chub_artifactory][:app_name]}-staging"
default[:chub_artifactory][:work_dir] = "/var/#{node[:chub_artifactory][:app_name]}"
default[:chub_artifactory][:jar_file_url] = "OVERRIDE_ME"
default[:chub_artifactory][:touchfile] = "#{node[:chub_artifactory][:deploy_dir]}/deployed.txt"

default[:chub_artifactory][:jmx_on] = false
default[:chub_artifactory][:jmx_port] = "9010"

default[:chub_artifactory][:config_vars][:useBridge] = "true"
default[:chub_artifactory][:config_vars][:disableRecompile] = "false"
default[:chub_artifactory][:config_vars][:enableReload] = "false"
default[:chub_artifactory][:config_vars][:mcHost] = "OVERRIDE_ME"
default[:chub_artifactory][:config_vars][:appHost] = "OVERRIDE_ME"
default[:chub_artifactory][:config_vars][:authService] = "OVERRIDE_ME"
default[:chub_artifactory][:config_vars][:isLocal] = "false"
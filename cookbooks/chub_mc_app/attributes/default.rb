default[:chub_mc_app][:port] = "OVERRIDE_ME"
default[:chub_mc_app][:app_name] = "OVERRIDE_ME"
default[:chub_mc_app][:deploy_dir] = "/opt/#{node[:chub_mc_app][:app_name]}"
default[:chub_mc_app][:staging_dir] = "/opt/#{node[:chub_mc_app][:app_name]}-staging"
default[:chub_mc_app][:work_dir] = "/var/#{node[:chub_mc_app][:app_name]}"
default[:chub_mc_app][:jar_file_url] = "OVERRIDE ME"
default[:chub_mc_app][:touchfile] = "#{node[:chub_mc_app][:deploy_dir]}/deployed.txt"
default[:chub_mc_app][:config_vars][:useBridge] = "true"
default[:chub_mc_app][:config_vars][:disableRecompile] = "false"
default[:chub_mc_app][:config_vars][:enableReload] = "false"
default[:chub_mc_app][:config_vars][:mcHost] = "OVERRIDE ME"
default[:chub_mc_app][:config_vars][:appHost] = "OVERRIDE ME"
default[:chub_mc_app][:config_vars][:authService] = "OVERRIDE ME"
default[:chub_mc_app][:config_vars][:isLocal] = "false"
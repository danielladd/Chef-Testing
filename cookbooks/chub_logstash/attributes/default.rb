default[:chub_logstash][:user]		= "logstash"
default[:chub_logstash][:base_dir]	= "/opt/logstash"
default[:chub_logstash][:cert_dir]	= "#{node[:chub_logstash][:base_dir]}/ssl"
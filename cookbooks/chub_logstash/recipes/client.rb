#
# Cookbook Name:: chub_logstash
# Recipe:: client
#
# Copyright 2014, CommerceTechnology, Inc
#
# All rights reserved - Do Not Redistribute
#

# Installs the Logstash-Shipper


include_recipe "chub_logstash"

	# Install logstash-forwarder
	# Create Client Config
	# Create Service
	# Start Service

if platform_family?('windows')
	include_recipe 'chub_logsearch_shipper'
else
	if platform_family?('mac_os_x')
		hostplatform = "mac64"
	else
		hostplatform = "linux64"
	end

	directory "/opt/logshipper" do
		action :create
		mode 0755
		owner node[:chub_logstash][:user]
		group node[:chub_logstash][:user]
	end

	remote_file "/opt/logshipper/logstash-forwarder" do
		source "http://artifactory01/artifactory/repo/elasticsearch/logstash-forwarder/#{node[:chub_logstash][:shipper_version]}/logstash-forwarder-#{node[:chub_logstash][:shipper_version]}-#{hostplatform}.bin"
		owner node[:chub_logstash][:user]
		group node[:chub_logstash][:user]
		mode 0774
	end

	# service "logshipper" do
	# 	provider Chef::Provider::Service::Upstart
	# 	action [ "enable", "start" ]
	# end

end



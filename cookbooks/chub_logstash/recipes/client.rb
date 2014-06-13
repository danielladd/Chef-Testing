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

if platform_family?('windows')
	include_recipe 'chub_logsearch_shipper'
else
	# Install logstash-forwarder
	# Create Client Config
	# Create Service
	# Start Service
end
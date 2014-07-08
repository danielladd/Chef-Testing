#
# Cookbook Name:: chub_logstash
# Recipe:: default
#
# Copyright 2014, CommerceTechnology, Inc
#
# All rights reserved - Do Not Redistribute
#

# Installs Logstash basics

unless platform_family?('windows')

	user node[:chub_logstash][:user] do
		system true
		home node[:chub_logstash][:base_dir]
		action :create
	end

	group "adm" do
		append true
		members node[:chub_logstash][:user]
		action :modify
	end

	directory node[:chub_logstash][:cert_dir] do
		owner node[:chub_logstash][:user]
		group "adm"
		mode 00700
		action :create
		recursive true
		notifies :create, 'cookbook_file[logstash.crt]', :immediately
	end

	cookbook_file "logstash.crt" do
		path "#{node[:chub_logstash][:cert_dir]}/logstash.crt"
		owner node[:chub_logstash][:user]
		group "adm"
		mode 00400
		action :nothing
	end

end
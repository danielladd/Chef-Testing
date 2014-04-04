#
# Cookbook Name:: chub_albers-cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "#{Chef::Config[:file_cache_path]}/wtx.iss" do
  source "wtx.iss"
  action :create
end

remote_file File.join(Chef::Config[:file_cache_path], node['chub_albers']['packagefile']) do
  source 'http://artifactyory01.nexus.commercehub.com/ext-distribution-local/wstx/wsdtxapi_8411_windows_64.exe'
  action :create_if_missing
end

windows_package "wtx" do
  source File.join (Chef::Config[:file_cache_path], node['chub_albers']['packagefile'])
  installer_type :installshield
  options "/s /sms /f1 #{Chef::Config[:file_cache_path]}/wtx.iss"
  action :install
end

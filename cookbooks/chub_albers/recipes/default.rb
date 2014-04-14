#
# Cookbook Name:: chub_albers
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

remote_file File.join(Chef::Config[:file_cache_path], node['chub']['albers']['packagefile']) do
  source 'http://artifactory01.nexus.commercehub.com/artifactory/ext-distribution-local/wstx/wsdtxapi_8411_windows_64.exe'
  action :create_if_missing
end

windows_package "IBM WebSphere Transformation Extender 8.4.1 Application Programming 64 bit variation" do
  source File.join(Chef::Config[:file_cache_path], node['chub']['albers']['packagefile'])
  package_name "IBM WebSphere Transformation Extender 8.4.1 Application Programming 64 bit variation"
  installer_type :custom
  options "-s -sms -f1#{Chef::Config[:file_cache_path]}/wtx.iss -f2#{Chef::Config[:file_cache_path]}/wtx.log"
  action :install
end

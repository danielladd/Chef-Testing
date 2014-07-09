#
# Cookbook Name:: chub_logsearch_shipper
# Recipe:: default
#
# Copyright 2014, CommerceTechnology, Inc
#
# All rights reserved - Do Not Redistribute
#

#directory "c:/Program Files/logsearch-shipper" do
#  action :create
#end

ruby_block "CHEF-4453 Bug" do
  block do
    FileUtils.mkdir_p "c:/Program Files/logsearch-shipper"
  end
end

file "c:/Program Files/logsearch-shipper/ls.crt" do
  content data_bag_item('logstash',node[:chub_logstash][:env_crt])["sslcrt"]
end

template "c:/Program Files/logsearch-shipper/LogsearchShipper.Service.exe.config" do
  source "shipperconf.erb"
  variables({
    :endpoint => node[:chub_logstash][:endpoint],
    :port => "2351",
    :logfiles => node[:chub_log][:logfiles],
    :environment => node.chef_environment
  })
end

execute 'install_shipper' do
  cwd 'c:/Program Files/logsearch-shipper'
  command 'LogsearchShipper.Service.exe install --sudo'
  action :nothing
end

execute 'uninstall_shipper' do
  cwd 'c:/Program Files/logsearch-shipper'
  command 'LogsearchShipper.Service.exe uninstall --sudo'
  only_if do File.exists?("c:/Program Files/logsearch-shipper/LogsearchShipper.Service.exe") end
  action :nothing
end

windows_zipfile 'c:/Program Files/logsearch-shipper' do
  source "#{Chef::Config[:file_cache_path]}/logsearch-shipper.zip"
  action :nothing
  overwrite true
  notifies :run, 'execute[install_shipper]', :immediately
end

remote_file "#{Chef::Config[:file_cache_path]}/logsearch-shipper.zip" do
  source "http://artifactory01.nexus.commercehub.com/artifactory/ext-distribution-local/logstash/#{node[:chub_logsearch_shipper][:logsearch_zip]}"
  action :create
  notifies :run, 'execute[uninstall_shipper]', :immediately
  notifies :unzip, 'windows_zipfile[c:/Program Files/logsearch-shipper]', :immediately
end

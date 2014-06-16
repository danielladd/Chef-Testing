#
# Cookbook Name:: chub_logstash
# Recipe:: server
#
# Copyright 2014, CommerceTechnology, Inc
#
# All rights reserved - Do Not Redistribute
#

# Installs the Logstash Server

include_recipe "chub_logstash"

file "/var/log/logstash-indexer.out" do
  owner node[:chub_logstash][:user]
  group "adm"
  mode 00644
  action :create
end

cookbook_file "logstash-indexer.conf" do
  path "/etc/init/logstash-indexer.conf"
end

execute "stop_logstash" do
  command "initctl stop logstash-indexer"
  returns [0,1]
  action :nothing
end

execute "start_logstash" do
  command "initctl start logstash-indexer"
  action :nothing
end

execute "restart_logstash" do
  command "initctl restart logstash-indexer"
  action :nothing
end

execute "extract_logstash" do
  cwd "/opt"
  command "tar xzf #{Chef::Config[:file_cache_path]}/logstash.tar.gz"
  action :nothing
end

template "/etc/indexer.conf" do
  source "indexer.conf.erb"
  variables({
    :clustername => node[:elasticsearch][:cluster][:name],
    :host => node[:chub_logstash][:esgateway],
    :rules => node[:chub_log][:types]
  })
  notifies :run, 'execute[stop_logstash]', :immediately
  notifies :run, 'execute[start_logstash]', :delayed
end

link "currentversion" do
  link_type :symbolic
  target_file node[:chub_logstash][:base_dir]
  to "/opt/logstash-1.4.1"
  action :nothing
  notifies :create, "directory[/opt/logstash/ssl]", :immediately
end

remote_file "#{Chef::Config[:file_cache_path]}/logstash.tar.gz" do
  source "http://artifactory01.nexus.commercehub.com/artifactory/ext-distribution-local/logstash/#{node[:chub_logstash][:logstash_tar]}"
  action :create
  notifies :run, 'execute[stop_logstash]', :immediately
  notifies :run, 'execute[extract_logstash]', :immediately
  notifies :create, 'link[currentversion]', :immediately
  notifies :run, 'execute[start_logstash]', :delayed
end


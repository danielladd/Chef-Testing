#
# Cookbook Name:: chub_sensu
# Recipe:: client
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

unless Chef::Config[:solo]
    node.default[:sensu][:rabbitmq][:host] = "sensu01.nexus.commercehub.com"
end

if !node.attribute?(:sensu) or !node[:sensu].attribute?(:rabbitmq) or !node[:sensu][:rabbitmq].attribute?(:host)
    Chef::Application.fatal!("RabbitMQ Host not provided, service will error out on start.  Please provide a node[:rabbitmq][:host] or you will feel pain")
end

include_recipe "base"
include_recipe "sensu"

sensu_client node.name do
    address node[:ipaddress]
    subscriptions node[:roles]
end

%w{sensu-plugin redphone json}.each do |gem_name|
    gem_package gem_name do
        action :install
        options "--no-rdoc --no-ri"
    end
end


remote_file "#{node[:chub_sensu][:root_plugin_path]}/check-disk.rb" do
    source "#{node[:chub_sensu][:root_sensu_community_plugins_repo_url]}/plugins/system/check-disk.rb"
    mode 0755
end

remote_file "#{node[:chub_sensu][:root_plugin_path]}/check-cpu.rb" do
   source "#{node[:chub_sensu][:root_sensu_community_plugins_repo_url]}/plugins/system/check-cpu.rb"
   mode 0755
end

remote_file "#{node[:chub_sensu][:root_plugin_path]}/check-ram.rb" do
    source "#{node[:chub_sensu][:root_sensu_community_plugins_repo_url]}/plugins/system/check-ram.rb"
    mode 0755
end

remote_file "#{node[:chub_sensu][:root_plugin_path]}/check-procs.rb" do
    source "#{node[:chub_sensu][:root_sensu_community_plugins_repo_url]}/plugins/processes/check-procs.rb"
    mode 0755
end

remote_file "#{node[:chub_sensu][:root_plugin_path]}/vmstat-metrics.rb" do
    source "#{node[:chub_sensu][:root_sensu_community_plugins_repo_url]}/plugins/system/vmstat-metrics.rb"
    mode 0755
end

include_recipe "sensu::client_service"
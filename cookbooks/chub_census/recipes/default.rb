#
# Cookbook Name:: chub_census
# Recipe:: default
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
include_recipe "chub_java::oracle8"

# Host file tweaks needed for remote JMX to work
hostsfile_entry '127.0.1.1' do
  action    :remove
end
hostsfile_entry node[:ipaddress] do
  hostname  node[:fqdn]
  aliases   [node[:hostname]]
  action    :create
end

group "census" do
    action :create
    system true
    append true
end

user "census" do
    comment "Application user for census"
    gid "census"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "census" do
    action :modify
    append true
    members ["census", "chadmin"]
end

directory "/opt/census" do
    owner "census"
    group "census"
    mode 0550
end

directory "/etc/census" do
    owner "root"
    group "census"
    mode 0755
end

directory "/var/census" do
    owner "census"
    group "census"
    mode 0770
end

directory "/var/log/census" do
    owner "census"
    group "census"
    mode 0770
end

template "/etc/census/census.yaml" do
    source "census.yaml.erb"
    owner "root"
    group "census"
    mode 0640
    notifies "restart", "service[census]"
end

template "/etc/init/census.conf" do
    source "census.conf.erb"
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[census]"
end

remote_file "/opt/census/census.jar" do
    source node[:chub_census][:app_url]
    owner "census"
    group "census"
    mode 0440
    notifies "restart", "service[census]"
end

service "census" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end

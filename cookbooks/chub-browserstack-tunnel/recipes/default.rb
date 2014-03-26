#
# Cookbook Name:: chub-browserstack-tunnel
# Recipe:: default
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
include_recipe "java"

group "browserstack" do
    action :create
    system true
end

user "browserstack" do
    comment "Application user for browserstack"
    gid "browserstack"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "browserstack" do
    action :modify
    append true
    members ["browserstack", "chadmin"]
end

directory "/opt/browserstack-tunnel" do
    owner "root"
    group "root"
    mode 0755
end

directory "/var/browserstack-tunnel" do
    owner "root"
    group "root"
    mode 0755
end

directory "/etc/browserstack" do
    owner "root"
    group "browserstack"
    mode 0755
end

remote_file "BrowserStackLocal" do
    source "http://www.browserstack.com/BrowserStackTunnel.jar"
    path "/opt/browserstack-tunnel/BrowserStackTunnel.jar"    
    owner "root"
    group "root"
    mode 0755
end

template "/etc/init/browserstack-tunnel.conf" do
    source "browserstack-tunnel.conf.erb"
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[browserstack-tunnel]"
end

service "browserstack-tunnel" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end
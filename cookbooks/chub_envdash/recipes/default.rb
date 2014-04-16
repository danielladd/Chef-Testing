#
# Cookbook Name:: chub_envdash
# Recipe:: default
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "chub_java::oracle8"

group "envdash" do
    action :create
    system true
end

user "envdash" do
    comment "Application user for envdash"
    gid "envdash"
    system true
end

file "/etc/chef/client.pem" do
    mode 0644
end

directory "/opt/envdash" do
    owner "envdash"
    group "envdash"
    mode 0550
end

directory "/var/envdash" do
    owner "envdash"
    group "envdash"
    mode 0770
end

template "/etc/init/envdash.conf" do
    source "envdash.conf.erb"
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[envdash]"
end

remote_file "/opt/envdash/envdash.jar" do
    source node[:chub_envdash][:app][:url]
    owner "envdash"
    group "envdash"
    mode 0440
    notifies "restart", "service[envdash]"
end

service "envdash" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end

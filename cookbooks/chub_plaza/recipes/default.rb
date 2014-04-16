#
# Cookbook Name:: chub_plaza
# Recipe:: default
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
include_recipe "chub_java::oracle8"

group "plaza" do
    action :create
    system true
end

user "plaza" do
    comment "Application user for Plaza"
    gid "plaza"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "plaza" do
    action :modify
    append true
    members ["plaza", "chadmin"]
end

directory "/opt/plaza" do
    owner "plaza"
    group "plaza"
    mode 0550
end

directory "/etc/plaza" do
    owner "root"
    group "plaza"
    mode 0755
end

directory "/var/plaza" do
    owner "plaza"
    group "plaza"
    mode 0770
end

directory "/var/log/plaza" do
    owner "plaza"
    group "plaza"
    mode 0770
end

template "/etc/plaza/plaza.yaml" do
    source "plaza.yaml.erb"
    owner "root"
    group "plaza"
    mode 0640
    notifies "restart", "service[plaza]"
end

template "/etc/plaza/plaza.groovy" do
    source "plaza.groovy.erb"
    owner "root"
    group "plaza"
    mode 0640
    notifies "restart", "service[plaza]"
end

template "/etc/init/plaza.conf" do
    source "plaza.conf.erb"
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[plaza]"
end

remote_file "/opt/plaza/plaza.jar" do
    source node[:chub_plaza][:app_url]
    owner "plaza"
    group "plaza"
    mode 0440
    notifies "restart", "service[plaza]"
end

service "plaza" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end

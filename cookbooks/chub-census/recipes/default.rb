#
# Cookbook Name:: chub-census
# Recipe:: default
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
include_recipe "java"

group "census" do
    action :create
    system true
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

# Clean up file used by previous version of cookbook
file "/etc/census/census.yml" do
    action :delete
end

template "/etc/census/census.yaml" do
    source "census.yaml.erb"
    variables({
    })
    owner "root"
    group "census"
    mode 0640
    notifies "restart", "service[census]"
end

template "/etc/init/census.conf" do
    source "census.conf.erb"
    variables({
        "java_heap_size" => node["chub-census"]["java_heap_size"]
    })
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[census]"
end

remote_file "/opt/census/census.jar" do
    source node["chub-census"]["app_url"]
    owner "census"
    group "census"
    mode 0440
    notifies "restart", "service[census]"
end

service "census" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end

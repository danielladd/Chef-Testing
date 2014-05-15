#
# Cookbook Name:: chub_oddrest
# Recipe:: default
#
# Copyright 2014, CommerceHub
#
# All rights reserved - Do Not Redistribute
#
# Author: Justin DiPierro

include_recipe "apt"
include_recipe "chub_java::oracle7"

service_name    = "oddrest"
group_name      = service_name
user_name       = service_name

group group_name do
    action :create
    system true
    append true
end

user user_name do
    comment "Application user for oddrest"
    gid group_name
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group group_name do
    action :modify
    append true
    members [user_name, "chadmin"]
end

[
    {
        dir:    "/opt/oddrest",
        mode:   0550
    },{
        dir:    "/etc/oddrest",
        owner:  "root",
        mode:   0755
    },{
        dir:    "/var/oddrest",
        mode:   0770
    },{
        dir:    "/var/log/oddrest",
        mode:   0770
    }
].each do |data|
    directory data[:dir] do
        owner data[:owner] || user_name
        group data[:group] || group_name
        mode data[:mode]
    end
end

template "/etc/oddrest/oddrest.yaml" do
    source "oddrest.yml.erb"
    owner "root"
    group group_name
    mode 0640
    notifies "restart", "service[oddrest]"
end

template "/etc/init/oddrest.conf" do
    source "oddrest.conf.erb"
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[oddrest]"
end

#This is just a hack until we get the jar deployed to Artifactory.
remote_file "/opt/oddrest/oddrest.jar" do
    source node[:chub_oddrest][:app_url]
    owner user_name
    group group_name
    mode 0440
    notifies "restart", "service[oddrest]"
end

service service_name do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end
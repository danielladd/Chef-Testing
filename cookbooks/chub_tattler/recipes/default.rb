#
# Cookbook Name:: chub_tattler
# Recipe:: default
#
# Copyright (C) 2014 CommerceHub
#
# All rights reserved - Do Not Redistribute
#
# Author: Alan DiStasio

include_recipe "apt"
include_recipe "chub_java::oracle7"

service_name    = "tattler"
group_name      = service_name
user_name       = service_name

group group_name do
    action :create
    system true
    append true
end

user user_name do
    comment "Application user for tattler"
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
        dir:    "/opt/tattler",
        mode:   0550
    },{
        dir:    "/etc/tattler",
        owner:  "root",
        mode:   0755
    },{
        dir:    "/var/tattler",
        mode:   0770
    },{
        dir:    "/var/log/tattler",
        mode:   0770
    }
].each do |data|
    directory data[:dir] do
        owner data[:owner] || user_name
        group data[:group] || group_name
        mode data[:mode]
    end
end

[
    {
        dest: "/etc/tattler/tattler.yaml",
        source: "tattler.yml.erb",
        group: group_name,
        mode: 0640,
        restart: true
    },{
        dest: "/etc/init/tattler.conf",
        source: "tattler.conf.erb",
        mode: 0644,
        restart: true
    },{
        dest: "/etc/tattler/tattler.properties",
        source: "tattler.properties.erb",
        group: group_name,
        mode: 0640,
        restart: true
    }
].each do |data|
    template data[:dest] do
        source data[:source]
        owner data[:owner] || "root"
        group data[:group] || "root"
        mode data[:mode]
        notifies "restart", "service[tattler]" if data[:restart]
    end
end

#This is just a hack until we get the jar deployed to Artifactory.
remote_file "/opt/tattler/tattler.jar" do
    source node[:chub_tattler][:app_url]
    owner user_name
    group group_name
    mode 0440
    notifies "restart", "service[tattler]"
end

service service_name do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end
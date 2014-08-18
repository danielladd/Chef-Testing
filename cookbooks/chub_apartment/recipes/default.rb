#
# Cookbook Name:: chub_apartment
# Recipe:: default
#
# Copyright (C) 2014 CommerceHub
#
# All rights reserved - Do Not Redistribute
#
# Author: Alan DiStasio

include_recipe "apt"
include_recipe "chub_java::oracle7"

service_name    = "apartment"
group_name      = service_name
user_name       = service_name

group group_name do
    action :create
    system true
    append true
end

user user_name do
    comment "Application user for apartment"
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
        dir:    "/opt/apartment",
        mode:   0775
    },{
        dir:    "/etc/apartment",
        owner:  "root",
        mode:   0775
    },{
        dir:    "/var/apartment",
        mode:   0770
    },{
        dir:    "/opt/apartment/conf",
        mode:   0775
    },{
        dir:    "/opt/apartment/bin",
        mode:   0776
    },{
        dir:    "/opt/apartment/logs",
        mode:   0775
    },{
        dir:    "/opt/apartment/lib",
        mode:   0775
    },{
        dir:    "/var/log/apartment",
        mode:   0775
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
        dest: "/etc/apartment/apartment.yaml",
        source: "apartment.yml.erb",
        group: group_name,
        mode: 0774,
        restart: true
    },{
        dest: "/etc/apartment/apartment.properties",
        source: "apartment.properties.erb",
        group: group_name,
        mode: 0774,
        restart: true
    },{
        dest: "/etc/apartment/system.properties",
        source: "system.properties.erb",
        group: group_name,
        mode: 0774,
        restart: true
    },{
        dest: "/opt/apartment/conf/wrapper.conf",
        source: "wrapper.conf.erb",
        mode: 0776,
        restart: true
    },{
        dest: "/opt/apartment/bin/apartment",
        source: "sh.script.erb",
        mode: 0775,
        restart: true
    },{
        dest: "/etc/security/limits.conf",
        source: "limits.conf.erb",
        mode: 0775,
        restart: true
    }
].each do |data|
    template data[:dest] do
        source data[:source]
        owner data[:owner] || "root"
        group data[:group] || "root"
        mode data[:mode]
        notifies "restart", "service[apartment]" if data[:restart]
    end
end

cookbook_file "/opt/apartment/bin/wrapper" do
  source "wrapper"
  owner user_name
  group group_name
  mode 0775
end

cookbook_file "/opt/apartment/lib/wrapper.jar" do
  source "wrapper.jar"
  owner user_name
  group group_name
  mode 0775
end

cookbook_file "/opt/apartment/lib/libwrapper.so" do
  source "libwrapper.so"
  owner user_name
  group group_name
  mode 0775
end

#This is just a hack until we get the jar deployed to Artifactory.
remote_file "/opt/apartment/apartment.jar" do
    source node[:chub_apartment][:app_url]
    owner user_name
    group group_name
    mode 0775
    notifies "restart", "service[apartment]"
end

service service_name do
  supports :restart => true, :start => true
  restart_command "/opt/apartment/bin/apartment restart"
  start_command "/opt/apartment/bin/apartment start"
  action [ :start ]
end
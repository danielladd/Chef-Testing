#
# Cookbook Name:: chub_lithograph
# Recipe:: default
#
# Copyright (C) 2014 CommerceHub
#
# All rights reserved - Do Not Redistribute
#
# Author: Curt Hostetter

include_recipe "apt"
include_recipe "chub_java::oracle7"

service_name    = "lithograph"
group_name      = service_name
user_name       = service_name

group group_name do
    action :create
    system true
    append true
end

user user_name do
    comment "Application user for lithograph"
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
        dir:    "/opt/lithograph",
        mode:   0775
    },{
        dir:    "/etc/lithograph",
        owner:  "root",
        mode:   0775
    },{
        dir:    "/var/lithograph",
        mode:   0770
    },{
        dir:    "/opt/lithograph/conf",
        mode:   0775
    },{
        dir:    "/opt/lithograph/bin",
        mode:   0776
    },{
        dir:    "/opt/lithograph/logs",
        mode:   0775
    },{
        dir:    "/opt/lithograph/lib",
        mode:   0775
    },{
        dir:    "/var/log/lithograph",
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
        dest: "/etc/lithograph/lithograph.yaml",
        source: "lithograph.yml.erb",
        group: group_name,
        mode: 0774,
        restart: true
    },{
        dest: "/etc/lithograph/lithograph.properties",
        source: "lithograph.properties.erb",
        group: group_name,
        mode: 0774,
        restart: true
    },{
        dest: "/opt/lithograph/conf/wrapper.conf",
        source: "wrapper.conf.erb",
        mode: 0776,
        restart: true
    },{
        dest: "/opt/lithograph/conf/wrapper-license.conf",
        source: "wrapper.conf.license.erb",
        mode: 0776,
        restart: true
    },{
        dest: "/opt/lithograph/bin/lithograph",
        source: "sh.script.erb",
        mode: 0775,
        restart: true
    }
].each do |data|
    template data[:dest] do
        source data[:source]
        owner data[:owner] || "root"
        group data[:group] || "root"
        mode data[:mode]
        notifies "restart", "service[lithograph]" if data[:restart]
    end
end

cookbook_file "/opt/lithograph/bin/wrapper" do
  source "wrapper"
  owner user_name
  group group_name
  mode 0775
end

cookbook_file "/opt/lithograph/lib/wrapper.jar" do
  source "wrapper.jar"
  owner user_name
  group group_name
  mode 0775
end

cookbook_file "/opt/lithograph/lib/libwrapper.so" do
  source "libwrapper.so"
  owner user_name
  group group_name
  mode 0775
end

#This is just a hack until we get the jar deployed to Artifactory.
remote_file "/opt/lithograph/lithograph.jar" do
    source node[:chub_lithograph][:app_url]
    owner user_name
    group group_name
    mode 0775
    notifies "restart", "service[lithograph]"
end

service service_name do
  #Chef::Provider::Service::Upstart
  supports :restart => true, :start => true
  restart_command "/opt/lithograph/bin/lithograph restart"
  start_command "/opt/lithograph/bin/lithograph start"
  action [ :start ]
end
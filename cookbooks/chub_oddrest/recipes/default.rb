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
        dest: "/etc/oddrest/oddrest.yaml",
        source: "oddrest.yml.erb",
        group: group_name,
        mode: 0640
    },{
        dest: "/etc/init/oddrest.conf",
        source: "oddrest.conf.erb",
        mode: 0644
    },{
        #if this location or file name changes, you must update the location in the default.rb attributes file
        dest: "/etc/oddrest/orgDataDir.properties",
        source: "orgDataDir.properties.erb",
        group: group_name,
        mode: 0640
    },{
        dest: "/etc/security/limits.conf",
        source: "limits.conf.erb",
        mode: 0775
    },{
        dest: "/etc/sysctl.conf",
        source: "sysctl.conf.erb",
        mode: 0775
    }
].each do |data|
    template data[:dest] do
        source data[:source]
        owner data[:owner] || "root"
        group data[:group] || "root"
        mode data[:mode]
    end
end

execute "reload_and_restart" do
	command "sysctl -p /etc/sysctl.conf"
	action :run
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
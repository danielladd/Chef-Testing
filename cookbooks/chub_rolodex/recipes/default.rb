#
# Cookbook Name:: chub_rolodex
# Recipe:: default
#
# Copyright (C) 2014 CommerceHub
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
include_recipe "chub_java::oracle7"

service_name    = "rolodex"
group_name      = service_name
user_name       = service_name

group group_name do
    action :create
    system true
    append true
end

user user_name do
    comment "Application user for rolodex"
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

#Directories
[
    {
        dir:    "/opt/rolodex",
        mode:   0550
    },{
        dir:    "/etc/rolodex",
        owner:  "root",
        mode:   0755
    },{
        dir:    "/var/rolodex",
        mode:   0770
    },{
        dir:    "/var/log/rolodex",
        mode:   0775
    }
].each do |data|
    directory data[:dir] do
        owner data[:owner] || user_name
        group data[:group] || group_name
        mode data[:mode]
    end
end

#Templates
[
    {
        dest: "/etc/rolodex/rolodex.yaml",
        source: "rolodex.yaml.erb",
        group: group_name,
        mode: 0640
    },{
        dest: "/etc/init/rolodex.conf",
        source: "rolodex.conf.erb",
        mode: 0644
    },{
        dest: "/etc/rolodex/rolodex.groovy",
        source: "rolodex.groovy.erb",
        group: group_name,
        mode: 0640
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
	notifies "restart", "service[rolodex]"
end

remote_file "/opt/rolodex/rolodex.jar" do
    source node[:chub_rolodex][:app_url]
    owner user_name
    group group_name
    mode 0440
    notifies "restart", "service[rolodex]"
end

service service_name do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end
#
# Cookbook Name:: chub_castle
# Recipe:: default
#
# Copyright (C) 2013 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#
require 'digest/sha1'

include_recipe "apt"
include_recipe "chub_java::oracle8"

# Host file tweaks needed for remote JMX to work
hostsfile_entry '127.0.1.1' do
  action    :remove
end
hostsfile_entry node[:ipaddress] do
  hostname  node[:fqdn]
  aliases   [node[:hostname]]
  action    :create
end

group "castle" do
    action :create
    system true
    append true
end

user "castle" do
    comment "Application user for Castle"
    gid "castle"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "castle" do
    action :modify
    append true
    members ["castle", "chadmin"]
end

directory "/opt/castle" do
    owner "castle"
    group "castle"
    mode 0550
end

directory "/etc/castle" do
    owner "root"
    group "castle"
    mode 0755
end

cookbook_file "/etc/castle/keystore.jks" do
    source node[:chub_castle][:keystore_file]
    owner "root"
    group "castle"
    mode 0644
end

cookbook_file "/etc/castle/truststore.jks" do
    source node[:chub_castle][:truststore_file]
    owner "root"
    group "castle"
    mode 0644
end

directory "/var/castle" do
    owner "castle"
    group "castle"
    mode 0770
end

directory "/var/log/castle" do
    owner "castle"
    group "castle"
    mode 0770
end

template "/etc/init/castle.conf" do
    source "castle.conf.erb"
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[castle]"
end

template "/etc/castle/castle.properties" do
    source "castle.properties.erb"
    variables({
        "castle_host_name" => "#{Digest::SHA1.hexdigest node[:hostname]}",
     })
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[castle]"
end

remote_file "/opt/castle/castle.war" do
    source node[:chub_castle][:app_url]
    owner "castle"
    group "castle"
    mode 0440
    notifies "restart", "service[castle]"
end

service "castle" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end

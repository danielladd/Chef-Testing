#
# Cookbook Name:: chub-castle
# Recipe:: default
#
# Copyright (C) 2013 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
include_recipe "java"

group "castle" do
    action :create
    system true
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

apt_package "authbind" do
    action :install
end

file "/etc/authbind/byport/80" do
    action :touch
    owner "castle"
    mode 0755
end

file "/etc/authbind/byport/443" do
    action :touch
    owner "castle"
    mode 0755
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
    source node["chub-castle"]["keystore_file"]
    owner "root"
    group "castle"
    mode 0644
end

cookbook_file "/etc/castle/truststore.jks" do
    source node["chub-castle"]["truststore_file"]
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
    variables({
        "java_heap_size" => node["chub-castle"]["java_heap_size"],
        "keystore_password" => node["chub-castle"]["keystore_password"],
        "truststore_password" => node["chub-castle"]["truststore_password"]
        "vault_url" => node["chub-castle"]["vault_url"]
    })
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[castle]"
end

template "/etc/castle/application.properties" do
    source "application.properties.erb"
    variables({
        "vault_url" => node["chub-castle"]["vault_url"],
    })
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[castle]"
end

remote_file "/opt/castle/castle.war" do
    source node["chub-castle"]["app_url"]
    owner "castle"
    group "castle"
    mode 0440
    notifies "restart", "service[castle]"
end

service "castle" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end

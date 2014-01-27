#
# Cookbook Name:: chub-vault
# Recipe:: default
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
include_recipe "java"

group "vault" do
    action :create
    system true
end

user "vault" do
    comment "Application user for vault"
    gid "vault"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "vault" do
    action :modify
    append true
    members ["vault", "chadmin"]
end

directory "/opt/vault" do
    owner "vault"
    group "vault"
    mode 0550
end

directory "/etc/vault" do
    owner "root"
    group "vault"
    mode 0755
end

directory "/var/vault" do
    owner "vault"
    group "vault"
    mode 0770
end

directory "/var/log/vault" do
    owner "vault"
    group "vault"
    mode 0770
end

# Clean up file used by previous version of cookbook
file "/etc/vault/vault.yml" do
    action :delete
end

template "/etc/vault/vault.yaml" do
    source "vault.yaml.erb"
    variables({
        "ldap_read_host" => node["chub-vault"]["ldap_read_host"],
        "search_password" => node["chub-vault"]["search_password"]
    })
    owner "root"
    group "vault"
    mode 0640
    notifies "restart", "service[vault]"
end

template "/etc/init/vault.conf" do
    source "vault.conf.erb"
    variables({
        "java_heap_size" => node["chub-vault"]["java_heap_size"]
    })
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[vault]"
end

remote_file "/opt/vault/vault.jar" do
    source node["chub-vault"]["app_url"]
    owner "vault"
    group "vault"
    mode 0440
    notifies "restart", "service[vault]"
end

service "vault" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end

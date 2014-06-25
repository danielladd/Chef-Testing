#
# Cookbook Name:: yui_combo
# Recipe:: default
#
# Copyright 2014, CommerceHub
#
# All rights reserved - Do Not Redistribute
#
# Author: Justin DiPierro

include_recipe "apt"
include_recipe "node"

service_name  = "combo"
group_name    = service_name
user_name     = service_name

group group_name do
  action :create
  system true
  append true
end

user user_name do
  comment "Application user for the YUI Combo Server"
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
    dir:    "/var/combo",
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
    dest: "/etc/init/combo.conf",
    source: "combo.conf",
    mode: 0644,
    restart: true
  }
].each do |data|
  cookbook_file data[:dest] do
    source data[:source]
    owner data[:owner] || "root"
    group data[:group] || "root"
    mode data[:mode]
    notifies "restart", "service[combo]" if data[:restart]
  end
end

git "/var/combo" do
  repo node[:yui_combo][:git_repo]
  action :checkout
  user user_name
  group group_name
end

service service_name do
  provider Chef::Provider::Service::Upstart
  action [ "enable", "start" ]
end
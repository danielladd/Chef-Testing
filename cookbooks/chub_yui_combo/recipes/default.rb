#
# Cookbook Name:: yui_combo
# Recipe:: default
#
# Copyright 2014, CommerceHub
#
# All rights reserved - Do Not Redistribute
#
# Author: Justin DiPierro

#Dependencies
include_recipe "build-essential"
include_recipe "apt"
include_recipe "git"
include_recipe "nodejs"
include_recipe "nginx"

#Variables
service_name  = "combo"
group_name    = service_name
user_name     = service_name

#Set up users and groups
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

#Set up required directories
[
  {
    dir:        "/var/combo",
    mode:       0775
  },{
    dir:        "/data/nginx/cache",
    mode:       0775,
    recursive:  true
  },{
    dir:        "/etc/combo",
    mode:       0775
  }
].each do |data|
  directory data[:dir] do
    owner data[:owner] || user_name
    group data[:group] || group_name
    mode data[:mode]
    recursive data[:recursive] if data[:recursive]
  end
end

#Install the combohandler
npm_package "combohandler@0.3.8"

#Move cookbook files to the node
[
  { #Upstart Script
    dest: "/etc/init/combo.conf",
    source: "combo.conf",
    mode: 0644,
    restart: true
  },{ #Nginx configuration including caching path
    dest: "/etc/nginx/nginx.conf",
    source: "nginx.conf",
    mode: 0644,
    restart: true,
    service: "service[nginx]"
  },{ #Nginx site definition for combo server proxying.
    dest: "/etc/nginx/sites-available/caching_combo_proxy",
    source: "caching_combo_proxy",
    mode: 0644,
    restart: true,
    service: "service[nginx]"
  }
].each do |data|
  #Default to notifying the combo service unless the data specifies otherwise.
  notify_service = data[:service] || "service[combo]"

  cookbook_file data[:dest] do
    source data[:source]
    owner data[:owner] || "root"
    group data[:group] || "root"
    mode data[:mode]
    notifies "restart", notify_service if data[:restart]
  end
end

#Create the routes file
routes_json = Hash[node[:yui_combo][:routes].collect { |route|
    ["/combo/#{route}", "/var/combo/#{route}"]
}].to_json

file "/etc/combo/routes.json" do
  content routes_json
  owner user_name
  group group_name
  mode 0644
  notifies "restart", "service[combo]"
end

#Enable the nginx site definition for combo server proxying
nginx_site 'caching_combo_proxy' do
  enable true
end

#Pull down the repo containing YUI modules and route definitions.
git "/var/combo" do
  repo node[:yui_combo][:git_repo]
  action :export
  user user_name
  group group_name
end

#Start the combo service
service service_name do
  provider Chef::Provider::Service::Upstart
  action [ "enable", "start" ]
end
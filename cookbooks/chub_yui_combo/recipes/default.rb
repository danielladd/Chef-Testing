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

#Ensure all route directories exist, including "admin"
routes = ["admin"].concat(node[:yui_combo][:routes])
routes.each do |route|
  directory "/var/combo/#{route}" do
    owner user_name
    group group_name
    mode 0775
    recursive true
  end
end

#Install unzip
package "unzip"

#Install the combohandler
npm_package "combohandler@0.3.8"

#Move cookbook files to the node
[
  { #Upstart Script
    dest: "/etc/init/combo.conf",
    source: "combo.conf",
    mode: 0644,
    restart: true
  },{ #up.js file used for monitoring and load-balancing
    dest: "/var/combo/admin/up.js",
    source: "up.js",
    owner: user_name,
    group: group_name,
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
  },{ #Script for downloading YUI releases
    dest: "/usr/local/bin/download_yui.sh",
    source: "download_yui.sh",
    mode: 0755,
    restart: false
  },{ #Script for clearing the Nginx cache
    dest: "/usr/local/bin/clear_nginx_cache.sh",
    source: "clear_nginx_cache.sh",
    mode: 0755,
    restart: false
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
file "/etc/combo/routes.json" do
  content Hash[routes.collect { |route|
      ["/combo/#{route}", "/var/combo/#{route}"]
  }].to_json
  owner user_name
  group group_name
  mode 0644
  notifies "restart", "service[combo]"
end

#Enable the nginx site definition for combo server proxying
nginx_site 'caching_combo_proxy' do
  enable true
end

#Pull down the repo containing combo assets
if node[:yui_combo][:git_export_enabled]
  git "/var/combo" do
    repo node[:yui_combo][:git_repo]
    action :export
    user user_name
    group group_name
  end
end

#Start the combo service
service service_name do
  provider Chef::Provider::Service::Upstart
  action [ "enable", "start" ]
end
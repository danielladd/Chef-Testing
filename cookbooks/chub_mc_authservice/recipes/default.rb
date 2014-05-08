#
# Cookbook Name:: chub_mc_authservice
# Recipe:: default
#
# Copyright 2014, CommerceHub Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe "chub_java::oracle7"

group "chub_mc_authservice" do
    action :create
    system true
end

user "chub_mc_authservice" do
    comment "Application user for chub_mc_authservice"
    gid "chub_mc_authservice"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "chub_mc_authservice" do
    action :modify
    append true
    members ["chub_mc_authservice", "chadmin"]
end

unless File.exists?("#{node[:chub_mc_authservice][:touchfile]}")

directory node[:chub_mc_authservice][:deploy_dir] do
  action :create
  owner "chub_mc_authservice"
  group "chub_mc_authservice"
  mode 0777
end

directory node[:chub_mc_authservice][:config_dir] do
  action :create
  owner "chub_mc_authservice"
  group "chub_mc_authservice"
  mode 0777
end

directory node[:chub_mc_authservice][:log_dir] do
  action :create
  owner "chub_mc_authservice"
  group "chub_mc_authservice"
  mode 0777
end

service "mc_authservice" do
    provider Chef::Provider::Service::Upstart
    action [ "disable", "stop" ]
end

remote_file "#{node[:chub_mc_authservice][:staging_dir]}/#{node[:chub_mc_authservice][:jar_file_name]}" do
  source "#{node[:chub_mc_authservice][:[:jar_file_url]}"
  owner "chub_mc_authservice"
  group "chub_mc_authservice"
  action :create	# This should pull the file down forcefully
end

file "#{node[:chub_mc_authservice][:deploy_dir]}/#{node[:chub_mc_authservice][:jar_file_name]}" do
    action   :delete
    mode     "0755"
    owner    "chub_mc_authservice"
    group    "chub_mc_authservice"
end

remote_file "Copy deploy jar file from staging" do 
  path "#{node[:chub_mc_authservice][:deploy_dir]}/#{node[:chub_mc_authservice][:jar_file_name]}"
  source "file://#{node[:chub_mc_authservice][:staging_dir]}/#{node[:chub_mc_authservice][:jar_file_name]}"
  owner 'root'
  group 'root'
  mode 0755
end

file "#{node[:chub_mc_authservice][:deploy_dir]}/#{node[:chub_mc_authservice][:keystore_file]}" do
	action :delete
end

remote_file "#{node[:chub_mc_authservice][:deploy_dir]}/#{node[:chub_mc_authservice][:keystore_file]}" do
  source "#{node[:chub_mc_authservice][:keystore_file_url]}"
  owner "chub_mc_authservice"
  group "chub_mc_authservice"
  action :create	# This should pull the file down forcefully
end

template "/etc/init/mc_authservice.conf" do
    source "mc_authservice.conf.erb"
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[mc_authservice]", :delayed
end

service "mc_authservice" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end

file node[:chub_mc_authservice][:touchfile] do
    action   :create
    mode     "0755"
    owner    "chub_mc_authservice"
    group    "chub_mc_authservice"
	content  "deployed"
end

file node[:chub_mc_authservice][:touchfile] do
    action   :touch
    mode     "0755"
    owner    "chub_mc_authservice"
    group    "chub_mc_authservice"
end

end#close unless block

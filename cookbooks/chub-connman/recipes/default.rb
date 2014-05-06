#
# Cookbook Name:: chub-connman
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

group "chub-connman" do
    action :create
    system true
end

user "chub-connman" do
    comment "Application user for chub-connman"
    gid "chub-connman"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "chub-connman" do
    action :modify
    append true
    members ["chub-connman", "chadmin"]
end

unless File.exists?("#{node["chub-connman"][:app][:touchfile]}")

directory node["chub-connman"][:app][:staging_dir] do
  action :create
  owner "chub-connman"
  group "chub-connman"
  mode 0777
end

directory node["chub-connman"]['app']['deploy_dir'] do
  action :create
  owner "chub-connman"
  group "chub-connman"
  mode 0777
end

service "connman" do
    provider Chef::Provider::Service::Upstart
    action [ "disable", "stop" ]
end

remote_file "#{node["chub-connman"]['app']['deploy_dir']}/#{node['chub-connman']['app']['app_name']}.jar" do
  source "#{node['chub-connman']['app']['jar_file_url']}"
  owner "chub-connman"
  group "chub-connman"
  action :create	# This should pull the file down forcefully
end

file "#{node["chub-connman"][:app][:deploy_dir]}/#{node["chub-connman"][:app][:app_name]}.jar" do
    action   :delete
    mode     "0755"
    owner    "chub-connman"
    group    "chub-connman"
end

remote_file "Copy deploy jar file from staging" do 
  path "#{node["chub-connman"][:app][:deploy_dir]}/#{node["chub-connman"][:app][:app_name]}.jar"
  source "file://#{node["chub-connman"][:app][:staging_dir]}/#{node["chub-connman"][:app][:app_name]}.jar"
  owner 'root'
  group 'root'
  mode 0755
end

template "/etc/init/connman.conf" do
    source "connman.conf.erb"
    owner "root"
    group "root"
    mode 0644
end

link "/etc/connman" do
  to "#{node["chub-connman"][:app][:deploy_dir]}/config"
end

link "/var/log/connman" do
  to "#{node["chub-connman"][:app][:deploy_dir]}/log"
end

service "connman" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end

file node["chub-connman"][:app][:touchfile] do
    action   :touch
    mode     "0755"
    owner    "chub-connman"
    group    "chub-connman"
end

end#close unless block
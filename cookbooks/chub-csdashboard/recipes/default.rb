#
# Cookbook Name:: chub-csdashboard
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

node.set['java']['install_flavor'] = 'oracle'
node.set['java']['oracle']['accept_oracle_download_terms'] = true
node.set['java']['jdk_version'] = 7

include_recipe "java"
include_recipe "tomcat"

group "chub-csdashboard" do
    action :create
    system true
end

user "chub-csdashboard" do
    comment "Application user for chub-csdashboard"
    gid "chub-csdashboard"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "chub-csdashboard" do
    action :modify
    append true
    members ["chub-csdashboard", "chadmin"]
end

directory node["chub-csdashboard"]['app']["config_dir"] do
  action :create
  owner "chub-csdashboard"
  group "chub-csdashboard"
  mode 0777
end

directory "#{node['tomcat']['webapp_dir']}/#{node['chub-csdashboard']['app']['app_name']}" do
  owner "chub-csdashboard"
  group "chub-csdashboard"
  mode 0777
end

directory "#{node['tomcat']['webapp_dir']}" do
  owner "chub-csdashboard"
  group "chub-csdashboard"
  mode 0777
end

directory "#{node['tomcat']['base']}" do
  owner "chub-csdashboard"
  group "chub-csdashboard"
  mode 0777
end

directory node["chub-csdashboard"]['app']["app_dir"] do
  action :create
  owner "chub-csdashboard"
  group "chub-csdashboard"
  mode 0777
end

directory node["chub-csdashboard"]['app']["log_dir"] do
  action :create
  owner "chub-csdashboard"
  group "chub-csdashboard"
  mode 0777
end

execute 'clear_tomcat_app_directory' do
	command "rm -fr #{node['tomcat']['webapp_dir']}/#{node['chub-csdashboard']['app']['app_name']}"
	action :nothing
end

remote_file "#{node['tomcat']['webapp_dir']}/#{node['chub-csdashboard']['app']['app_name']}.war" do
	source "#{node['chub-csdashboard']['app']['war_file_url']}"
	owner "chub-csdashboard"
	group "chub-csdashboard"
	action :create_if_missing
	notifies :run, 'execute[clear_tomcat_app_directory]', :immediately
	notifies :restart, "service[tomcat]", :delayed
end
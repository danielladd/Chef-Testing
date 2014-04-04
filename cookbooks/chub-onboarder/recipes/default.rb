#
# Cookbook Name:: chub-onboarder
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

group "chub-onboarder" do
    action :create
    system true
end

user "chub-onboarder" do
    comment "Application user for chub-onboarder"
    gid "chub-onboarder"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "chub-onboarder" do
    action :modify
    append true
    members ["chub-onboarder", "chadmin"]
end

directory node["chub-onboarder"]['app']["config_dir"] do
  action :create
  owner "chub-onboarder"
  group "chub-onboarder"
  mode 0777
end

directory "#{node['tomcat']['webapp_dir']}/#{node['chub-onboarder']['app']['app_name']}" do
  owner "chub-onboarder"
  group "chub-onboarder"
  mode 0777
end

directory "#{node['tomcat']['webapp_dir']}" do
  owner "chub-onboarder"
  group "chub-onboarder"
  mode 0777
end

directory "#{node['tomcat']['base']}" do
  owner "chub-onboarder"
  group "chub-onboarder"
  mode 0777
end

directory node["chub-onboarder"]['app']["app_dir"] do
  action :create
  owner "chub-onboarder"
  group "chub-onboarder"
  mode 0777
end

directory node["chub-onboarder"]['app']["log_dir"] do
  action :create
  owner "chub-onboarder"
  group "chub-onboarder"
  mode 0777
end

execute 'clear_tomcat_app_directory' do
	command "rm -fr #{node['tomcat']['webapp_dir']}/#{node['chub-onboarder']['app']['app_name']}"
	action :nothing
end

remote_file "#{node['tomcat']['webapp_dir']}/#{node['chub-onboarder']['app']['bamboo_server_artifact_file_name']}" do
	source "http://#{node['chub-onboarder']['app']['bamboo_server_name']}:#{node['chub-onboarder']['app']['bamboo_server_port']}/browse/#{node['chub-onboarder']['app']['bamboo_server_build_project']}-#{node['chub-onboarder']['app']['bamboo_server_build_key']}/latest/artifact/shared/#{node['chub-onboarder']['app']['bamboo_server_artifact']}/#{node['chub-onboarder']['app']['bamboo_server_artifact_file_name']}"
	owner "chub-onboarder"
	group "chub-onboarder"
	action :create_if_missing
	notifies :run, 'execute[clear_tomcat_app_directory]', :immediately
	notifies :restart, "service[tomcat]", :delayed
end
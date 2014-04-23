#
# Cookbook Name:: chub-landingstrip
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
include_recipe "tomcat"

group "chub-landingstrip" do
    action :create
    system true
end

user "chub-landingstrip" do
    comment "Application user for chub-landingstrip"
    gid "chub-landingstrip"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "chub-landingstrip" do
    action :modify
    append true
    members ["chub-landingstrip", "chadmin"]
end

directory node["chub-landingstrip"]['app']["config_dir"] do
  action :create
  owner "chub-landingstrip"
  group "chub-landingstrip"
  mode 0777
end

directory "#{node['tomcat']['webapp_dir']}/#{node['chub-landingstrip']['app']['app_name']}" do
  owner "chub-landingstrip"
  group "chub-landingstrip"
  mode 0777
end

directory "#{node['tomcat']['webapp_dir']}" do
  owner "chub-landingstrip"
  group "chub-landingstrip"
  mode 0777
end

directory "#{node['tomcat']['base']}" do
  owner "chub-landingstrip"
  group "chub-landingstrip"
  mode 0777
end

directory node["chub-landingstrip"]['app']["app_dir"] do
  action :create
  owner "chub-landingstrip"
  group "chub-landingstrip"
  mode 0777
end

directory node["chub-landingstrip"]['app']["log_dir"] do
  action :create
  owner "chub-landingstrip"
  group "chub-landingstrip"
  mode 0777
end

execute 'clear_tomcat_app_directory' do
	command "rm -fr #{node['tomcat']['webapp_dir']}/#{node['chub-landingstrip']['app']['app_name']}"
	action :nothing
end

file "#{node['tomcat']['webapp_dir']}/#{node['chub-landingstrip']['app']['app_name']}.war" do
	action :delete
end

touchfile = node['chub-landingstrip']['app']['touchfile']

remote_file "#{node['tomcat']['webapp_dir']}/#{node['chub-landingstrip']['app']['app_name']}.war" do
  source "#{node['chub-landingstrip']['app']['war_file_url']}"
  not_if do
    File.exists?(touchfile)
  end
  owner "chub-landingstrip"
  group "chub-landingstrip"
  action :create	# This should pull the file down forcefully
  notifies :run, 'execute[clear_tomcat_app_directory]', :immediately
  notifies :restart, "service[tomcat]", :delayed
end
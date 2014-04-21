#
# Cookbook Name:: chub-missioncontrol
# Recipe:: appserver
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
# limitations under the License .
#

include_recipe "tomcat"
node.set['tomcat']['base_version'] = 7
node.set['tomcat']['loglevel'] = 'WARN'		# default is 'INFO'

directory node["chub-missioncontrol"]['app']["config_dir"] do
  action :create
  owner "chub-missioncontrol"
  group "chub-missioncontrol"
  mode 0777
end

directory "#{node['tomcat']['webapp_dir']}/#{node['chub-missioncontrol']['app']['app_name']}" do
  owner "chub-missioncontrol"
  group "chub-missioncontrol"
  mode 0777
end

directory "#{node['tomcat']['webapp_dir']}" do
  owner "chub-missioncontrol"
  group "chub-missioncontrol"
  mode 0777
end

directory "#{node['tomcat']['base']}" do
  owner "chub-missioncontrol"
  group "chub-missioncontrol"
  mode 0777
end

directory node["chub-missioncontrol"]['app']["app_dir"] do
  action :create
  owner "chub-missioncontrol"
  group "chub-missioncontrol"
  mode 0777
end

directory node["chub-missioncontrol"]['app']["log_dir"] do
  action :create
  owner "chub-missioncontrol"
  group "chub-missioncontrol"
  mode 0777
end

execute 'clear_tomcat_app_directory' do
  command "rm -fr #{node['tomcat']['webapp_dir']}/#{node['chub-missioncontrol']['app']['app_name']}"
  action :nothing
end

file "#{node['tomcat']['webapp_dir']}/#{node['chub-missioncontrol']['app']['app_name']}.war" do
	action :delete
end

touchfile = node['chub-missioncontrol']['app']['touchfile']

remote_file "#{node['tomcat']['webapp_dir']}/#{node['chub-missioncontrol']['app']['app_name']}.war" do
  source "#{node['chub-missioncontrol']['app']['war_file_url']}"
  not_if do
    File.exists?(touchfile)
  end
  owner "chub-missioncontrol"
  group "chub-missioncontrol"
  action :create	# This should pull the file down forcefully
  notifies :run, 'execute[clear_tomcat_app_directory]', :immediately
  notifies :restart, "service[tomcat]", :delayed
end

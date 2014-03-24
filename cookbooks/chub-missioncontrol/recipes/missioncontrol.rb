#
# Cookbook Name:: chub-missioncontrol
# Recipe:: chub-missioncontrol
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

group "chub-missioncontrol" do
    action :create
    system true
end

user "chub-missioncontrol" do
    comment "Application user for chub-missioncontrol"
    gid "chub-missioncontrol"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "chub-missioncontrol" do
    action :modify
    append true
    members ["chub-missioncontrol", "chadmin"]
end

directory node["chub-missioncontrol"]["config_dir"] do
  action :create
  owner "chub-missioncontrol"
  group "chub-missioncontrol"
  mode 0777
end

directory "#{node['tomcat']['webapp_dir']}/ROOT}" do
  action :create
  owner "chub-missioncontrol"
  group "chub-missioncontrol"
  mode 0777
end

directory node["chub-missioncontrol"]["app_dir"] do
  action :create
  owner "chub-missioncontrol"
  group "chub-missioncontrol"
  mode 0777
end

directory node["chub-missioncontrol"]["log_dir"] do
  action :create
  owner "chub-missioncontrol"
  group "chub-missioncontrol"
  mode 0777
end

template "#{node['chub-missioncontrol']['app_dir']}/#{node['chub-missioncontrol']['missioncontrol_conf']}" do
	source "missioncontrol-config.groovy.erb"
	mode 0777
	owner "chub-missioncontrol"
	group "chub-missioncontrol"
	notifies :restart, "service[tomcat]", :delayed
end

execute 'clear_tomcat_app_directory' do
	command "rm -fr #{node['tomcat']['webapp_dir']}/bootstrap"
	action :nothing
end

remote_file "#{node['tomcat']['webapp_dir']}/bootstrap.war" do
	source "http://bamboom1:8085/browse/MC-MCDEM-92/artifact/shared/Bootstrap-demo/bootstrap.war"
	owner "chub-missioncontrol"
	group "chub-missioncontrol"
	action :create_if_missing
	notifies :run, 'execute[clear_tomcat_app_directory]', :immediately
	notifies :restart, "service[tomcat]", :delayed
end
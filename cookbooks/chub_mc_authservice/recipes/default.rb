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
include_recipe "tomcat"

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

directory node[:chub_mc_authservice][:log_dir] do
  action :create
  owner "chub_mc_authservice"
  group "chub_mc_authservice"
  mode 0777
end

directory node[:chub_mc_authservice][:deploy_dir] do
  action :create
  owner "chub_mc_authservice"
  group "chub_mc_authservice"
  mode 0777
end
#because we're overriding the tomcat config_dir in the role we will need to create our new directory (/etc/authservice)
directory node[:chub_mc_authservice][:config_dir] do
  action :create
  owner "chub_mc_authservice"
  group "chub_mc_authservice"
  mode 0777
end

unless File.exists?("#{node[:chub_mc_authservice][:touchfile]}")

service "tomcat7" do
    provider Chef::Provider::Service::Upstart
    action [ "disable", "stop" ]
end

#delete deployed app folder
directory "#{node[:tomcat][:webapp_dir]}/#{node[:chub_mc_authservice][:app_name]}" do
    action   :delete
    mode     "0755"
    owner    "chub_mc_authservice"
    group    "chub_mc_authservice"
end

#delete war file
file "#{node[:tomcat][:webapp_dir]}/#{node[:chub_mc_authservice][:app_name]}.war" do
    action   :delete
    mode     "0755"
    owner    "chub_mc_authservice"
    group    "chub_mc_authservice"
end

#delete keystore file
file "#{node[:tomcat][:config_dir]}/#{node[:tomcat][:keystore_file]}" do
	action :delete
end

#delete cas.properties file
file "#{node[:tomcat][:config_dir]}/#{node[:chub_mc_authservice][:cas_properties]}" do
	action :delete
end

#delete log4j.xml file
file "#{node[:tomcat][:config_dir]}/log4j.xml" do
	action :delete
end

#download war file into tomcat webapps dir
remote_file "Get the war file from bamboo" do 
  path "#{node[:tomcat][:webapp_dir]}/#{node[:chub_mc_authservice][:app_name]}.war"
  source "#{node[:chub_mc_authservice][:war_file_url]}"
  owner 'chub_mc_authservice'
  group 'chub_mc_authservice'
  mode 0755
end

#download keystore file into config_dir
remote_file "#{node[:tomcat][:config_dir]}/#{node[:tomcat][:keystore_file]}" do
  source "#{node[:chub_mc_authservice][:keystore_file_url]}"
  owner "chub_mc_authservice"
  group "chub_mc_authservice"
  action :create	# This should pull the file down forcefully
end

#download cas.properties file into config_dir
remote_file "#{node[:tomcat][:config_dir]}/#{node[:chub_mc_authservice][:cas_properties]}" do
  source "#{node[:chub_mc_authservice][:cas_properties_file_url]}"
  owner "chub_mc_authservice"
  group "chub_mc_authservice"
  action :create	# This should pull the file down forcefully
end

#download log4j.xml file and place it into 
remote_file "#{node[:tomcat][:config_dir]}/log4j.xml" do
  source "#{node[:chub_mc_authservice][:log4j_xml_url]}"
  owner "chub_mc_authservice"
  group "chub_mc_authservice"
  action :create	# This should pull the file down forcefully
end

service "tomcat7" do
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

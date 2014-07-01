#
# Cookbook Name:: chub_mc_webservices
# Recipe:: salesforce_webservice
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

group "chub_salesforce_webservice" do
    action :create
    system true
end

user "chub_salesforce_webservice" do
    comment "Application user for salesforce_webservice"
    gid "chub_salesforce_webservice"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "chub_salesforce_webservice" do
    action :modify
    append true
    members ["chub_salesforce_webservice", "chadmin"]
end

unless File.exists?("#{node[:chub_mc_webservice][:salesforce][:touchfile]}")

  directory node[:chub_mc_webservice][:salesforce][:staging_dir] do
    action :create
    owner "chub_salesforce_webservice"
    group "chub_salesforce_webservice"
    mode 0777
  end

  directory node[:chub_mc_webservice][:salesforce][:deploy_dir] do
    action :create
    owner "chub_salesforce_webservice"
    group "chub_salesforce_webservice"
    mode 0777
  end

  service "salesforce_webservice" do
      provider Chef::Provider::Service::Upstart
      action [ "disable", "stop" ]
  end

  remote_file "#{node[:chub_mc_webservice][:salesforce][:staging_dir]}/#{node[:chub_mc_webservice][:salesforce][:jar_file_name]}" do
    source "#{node[:chub_mc_webservice][:salesforce][:jar_file_url]}"
    owner "chub_salesforce_webservice"
    group "chub_salesforce_webservice"
    action :create	# This should pull the file down forcefully
  end

  file "#{node[:chub_mc_webservice][:salesforce][:deploy_dir]}/#{node[:chub_mc_webservice][:salesforce][:jar_file_name]}" do
      action   :delete
      mode     "0755"
      owner    "chub_salesforce_webservice"
      group    "chub_salesforce_webservice"
  end

  remote_file "Copy deploy jar file from staging" do 
    path "#{node[:chub_mc_webservice][:salesforce][:deploy_dir]}/#{node[:chub_mc_webservice][:salesforce][:jar_file_name]}"
    source "file://#{node[:chub_mc_webservice][:salesforce][:staging_dir]}/#{node[:chub_mc_webservice][:salesforce][:jar_file_name]}"
    owner 'root'
    group 'root'
    mode 0755
  end

  #create yaml config file
  template "#{node[:chub_mc_webservice][:salesforce][:deploy_dir]}/salesforce_webservice_config.yml" do
      source "salesforce_webservice_config.yml.erb"
      owner "root"
      group "root"
      mode 0644
  	action :create
  end

  #create salesforce webservice service wrapper
  template "/etc/init/salesforce_webservice.conf" do
      source "salesforce_webservice.conf.erb"
      owner "root"
      group "root"
      mode 0644
  	action :create
  end

  service "salesforce_webservice" do
      provider Chef::Provider::Service::Upstart
      action [ "enable", "start" ]
  end

  file node[:chub_mc_webservice][:salesforce][:touchfile] do
      action   :touch
      mode     "0755"
      owner    "chub_salesforce_webservice"
      group    "chub_salesforce_webservice"
  end

end#close unless block
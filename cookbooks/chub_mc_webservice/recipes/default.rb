#
# Cookbook Name:: chub_mc_webservice
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

group "chub_#{node[:chub_mc_webservice][:webservice_name]}" do
    action :create
    system true
end

user "chub_#{node[:chub_mc_webservice][:webservice_name]}" do
    comment "Application user for #{node[:chub_mc_webservice][:webservice_name]}"
    gid "chub_#{node[:chub_mc_webservice][:webservice_name]}"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "chub_#{node[:chub_mc_webservice][:webservice_name]}" do
    action :modify
    append true
    members ["chub_#{node[:chub_mc_webservice][:webservice_name]}", "chadmin"]
end

unless File.exists?("#{node[:chub_mc_webservice][:touchfile]}")

  directory node[:chub_mc_webservice][:log_dir] do
    action :create
    owner "chub_#{node[:chub_mc_webservice][:webservice_name]}"
    group "chub_#{node[:chub_mc_webservice][:webservice_name]}"
    mode 0777
  end

  directory node[:chub_mc_webservice][:staging_dir] do
    action :create
    owner "chub_#{node[:chub_mc_webservice][:webservice_name]}"
    group "chub_#{node[:chub_mc_webservice][:webservice_name]}"
    mode 0777
  end

  directory node[:chub_mc_webservice][:deploy_dir] do
    action :create
    owner "chub_#{node[:chub_mc_webservice][:webservice_name]}"
    group "chub_#{node[:chub_mc_webservice][:webservice_name]}"
    mode 0777
  end

  service "#{node[:chub_mc_webservice][:webservice_name]}" do
      provider Chef::Provider::Service::Upstart
      action [ "disable", "stop" ]
  end

  remote_file "#{node[:chub_mc_webservice][:staging_dir]}/#{node[:chub_mc_webservice][:jar_file_name]}" do
    source "#{node[:chub_mc_webservice][:jar_file_url]}"
    owner "chub_#{node[:chub_mc_webservice][:webservice_name]}"
    group "chub_#{node[:chub_mc_webservice][:webservice_name]}"
    action :create	# This should pull the file down forcefully
  end

  file "#{node[:chub_mc_webservice][:deploy_dir]}/#{node[:chub_mc_webservice][:jar_file_name]}" do
      action   :delete
      mode     "0755"
      owner    "chub_#{node[:chub_mc_webservice][:webservice_name]}"
      group    "chub_#{node[:chub_mc_webservice][:webservice_name]}"
  end

  remote_file "Copy deploy jar file from staging" do 
    path "#{node[:chub_mc_webservice][:deploy_dir]}/#{node[:chub_mc_webservice][:jar_file_name]}"
    source "file://#{node[:chub_mc_webservice][:staging_dir]}/#{node[:chub_mc_webservice][:jar_file_name]}"
    owner 'root'
    group 'root'
    mode 0755
  end
  
  #get config file
  remote_file "Copy config file from temp directory" do
    path "#{node[:chub_mc_webservice][:deploy_dir]}/#{node[:chub_mc_webservice][:config_file_name]}"
    source "file:#{node[:chub_mc_webservice][:config_temp_dir]}/#{node[:chub_mc_webservice][:config_file_name]}"
    owner "root"
    group "root"
    mode 0755
  end

  #create flight webservice service wrapper
  template "/etc/init/#{node[:chub_mc_webservice][:webservice_name]}.conf" do
      source "webservice.conf.erb"
      owner "root"
      group "root"
      mode 0644
  	action :create
  end

  service "#{node[:chub_mc_webservice][:webservice_name]}" do
      provider Chef::Provider::Service::Upstart
      action [ "enable", "start" ]
  end

  file node[:chub_mc_webservice][:touchfile] do
      action   :touch
      mode     "0755"
      owner    "chub_#{node[:chub_mc_webservice][:webservice_name]}"
      group    "chub_#{node[:chub_mc_webservice][:webservice_name]}"
  end

end#close unless block




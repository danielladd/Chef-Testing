#
# Cookbook Name:: chub_mc_webservice
# Recipe:: netsuite_webservice
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

node.normal[:chub_mc_webservice][:webservice] = "netsuite-webservice"
node.normal[:chub_mc_webservice][:log_dir] = "/var/log/#{node[:chub_mc_webservice][:webservice]}"
node.normal[:chub_mc_webservice][:deploy_dir] = "/opt/#{node[:chub_mc_webservice][:webservice]}"
node.normal[:chub_mc_webservice][:staging_dir] = "/opt/#{node[:chub_mc_webservice][:webservice]}-staging"
node.normal[:chub_mc_webservice][:touchfile] = "#{node[:chub_mc_webservice][:deploy_dir]}/deployed.txt"
node.normal[:chub_mc_webservice][:webservice_name] = "flight_webservice"
node.normal[:chub_mc_webservice][:config_file_name] =  "#{node[:chub_mc_webservice][:webservice_name]}_config.yml"
node.normal[:chub_mc_webservice][:config_temp_dir] = "/tmp/#{node[:chub_mc_webservice][:webservice]}"

#node.normal[:chub_mc_webservice][:jar_file_url] = node[:chub_mc_webservice][:flight][:jar_file_url]
#node.normal[:chub_mc_webservice][:jar_file_name] = node[:chub_mc_webservice][:flight][:jar_file_name]

directory node[:chub_mc_webservice][:config_temp_dir] do
  action :create
  owner "chub_#{node[:chub_mc_webservice][:webservice_name]}"
  group "chub_#{node[:chub_mc_webservice][:webservice_name]}"
  mode 0777
end

#create config file
template "#{node[:chub_mc_webservice][:config_temp_dir]}/#{node[:chub_mc_webservice][:config_file_name]}" do
  source "#{node[:chub_mc_webservice][:webservice_name]}_config.yml.erb"
  owner "root"
  group "root"
  mode 0644
  action :create
end

include_recipe "chub_mc_webservice::default"

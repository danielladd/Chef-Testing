#
# Cookbook Name:: chub_nginx
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

include_recipe "chub_nginx"

default[:chub_nginx][:site_name]	= 'files'
default[:chub_nginx][:www_home]		= "/var/www/#{node[:chub_nginx][:site_name]}"
default[:chub_nginx][:log_dir]		= "#{node['nginx']['log_dir']}/#{node[:chub_nginx][:site_name]}"

directory node[:chub_nginx][:www_home] do
	owner node['nginx']['user']
	mode 0755
	recursive true
end

directory node[:chub_nginx][:log_dir] do
	owner node['nginx']['user']
	mode 0755
	recursive true
end

template "#{node['nginx']['dir']}/sites-available/#{node[:chub_nginx][:site_name]}.conf" do
	source "#{node[:chub_nginx][:site_name]}.conf.erb"
	mode 0644
end

nginx_site "#{node[:chub_nginx][:site_name]}.conf"

cookbook_file "#{node[:chub_nginx][:www_home]}/index.html" do
	source index.html
	mode 0755
	owner node['nginx']['user']
end
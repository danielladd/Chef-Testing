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

node.normal[:nginx][:default_site_enabled]	= false
node.normal[:nginx][:keepalive_timeout]	= 3

include_recipe "chub_nginx"
#include_recipe "nginx"

site		= "styleguide"
site_path	= "/var/www/#{site}"
site_log	= "/var/log/nginx/#{site}"
repo		= "http://mpgit03.nexus.commercehub.com/jason/ch-style-guide.git"
repo_path	= "/var/repo/#{site}"

execute "copy_site" do
	cwd repo_path
	command "git checkout-index -f -a --prefix=#{site_path}/"
	action :nothing
end

# %w{
# 	php5
# 	php5-fpm
# }.each do |pkg|
# 	package pkg do
# 		action :install
# 	end
# end

file "/var/www/index.html" do
	action :delete
end

template "/etc/nginx/sites-available/#{site}" do
	source "#{site}.erb"
	mode "0744"
	owner "www-data"
	group "www-data"
	variables({
		:site => site,
		:site_path => site_path,
		:site_log => site_log
	})
end

directory site_path do
	owner "www-data"
	group "www-data"
	mode "0755"
	recursive true
end

directory repo_path do
	owner "www-data"
	group "www-data"
	mode "0755"
	recursive true
end

git repo_path do
	repository repo
	action :sync
	reference "master"
	notifies :run, 'execute[copy_site]', "immediately"
	notifies :reload, "service[nginx]", :delayed
end

nginx_site "#{site}"

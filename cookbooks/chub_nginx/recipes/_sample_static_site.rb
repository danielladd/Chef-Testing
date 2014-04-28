#
# Cookbook Name:: chub_nginx
# Recipe:: _sample_site
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

# README:  This is a sample implementation of this cookbook.
# For a simple static-content-only site, copy and rename this cookbook, and
# change the three variables below.

# # Site-specific Variables
# # Change These
site		= "samplesite"		# This is the name of the site
http_index	= "index.html"		# This is the homepage of the website
repo		= "http://mpgit03.nexus.commercehub.com/jason/ch-style-guide.git"

# # Derivitive Variables
# # Don't Change These
site_path	= "/var/www/#{site}"
site_log	= "/var/log/nginx/#{site}"
repo_path	= "/var/repo/#{site}"

node.normal[:nginx][:default_site_enabled]	= false
node.normal[:nginx][:keepalive_timeout]	= 3

include_recipe "chub_nginx"

execute "copy_site" do
	cwd repo_path
	command "rsync -a --delete --exclude='.git/' --exclude='README*' ./ #{site_path}"
	action :nothing
end

execute "fix_ownership" do
	command "chown -R www-data:www-data #{repo_path}"
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

template "/etc/nginx/sites-available/#{site}" do
	source "simple_static_site.erb"
	mode "0744"
	owner "www-data"
	group "www-data"
	variables({
		:site => site,
		:site_path => site_path,
		:site_log => site_log,
		:http_index => http_index
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
	additional_remotes["gitlab"] = repo
	action :sync
	reference "master"
	user "www-data"
	group "www-data"
	notifies :run, 'execute[fix_ownership]', "immediately"
	notifies :run, 'execute[copy_site]', "immediately"
	notifies :reload, "service[nginx]", :delayed
end

nginx_site "#{site}"
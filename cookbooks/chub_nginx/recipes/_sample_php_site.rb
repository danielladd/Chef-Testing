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
site		= "samplephpsite"		# This is the name of the site
http_index	= "index.php"		# This is the homepage of the website
repo		= "http://mpgit03.nexus.commercehub.com/jason/ch-style-guide.git"

# # Derivitive Variables
# # Don't Change These
site_path	= "/var/www/#{site}"
site_log	= "/var/log/nginx/#{site}"
repo_path	= "/var/repo/#{site}"
#fcgi_port	= "unix:/var/run/php5-fpm.sock"
fcgi_port	= "127.0.0.1:9000"

node.normal[:nginx][:default_site_enabled]	= false
node.normal[:nginx][:keepalive_timeout]	= 3

include_recipe "chub_nginx"

execute "copy_site" do
	cwd repo_path
	command "rsync -art --delete --delete-excluded --exclude='.git/' --exclude='README*' #{repo_path}/ #{site_path}"
	action :nothing
end

execute "fix_ownership" do
	command "chown -R www-data:www-data #{repo_path}"
	action :nothing
end

%w{
	php5-cli
	php5-fpm
}.each do |pkg|
	package pkg do
		action :install
	end
end

template "/etc/nginx/sites-available/#{site}" do
	source "php_fcgi_site.erb"
	mode "0644"
	owner "www-data"
	group "www-data"
	variables({
		:site => site,
		:site_path => site_path,
		:site_log => site_log,
		:http_index => http_index,
		:fcgi_port => fcgi_port
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

# phpinfo should not be available in Prod, but may be helpful in test
if node[:instance_role] == 'vagrant'
	cookbook_file "info.php" do
		path "#{site_path}/info.php"
		action :create_if_missing
		owner "www-data"
		group "www-data"
		mode "0755"
	end
else
	file "#{site_path}/info.php" do
		action :delete
	end
end

nginx_site "#{site}"

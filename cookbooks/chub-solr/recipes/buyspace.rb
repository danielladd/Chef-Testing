#
# Cookbook Name:: chub-solr
# Recipe:: solr
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

include_recipe "chub-solr"

#TODO: check the filenames & path on this
execute 'Extract_SOLR_Tarball' do
	command "tar -zxvf #{node['chub-solr']['archive_dir']}/solr-#{node['chub-solr']['version']}.tgz -C #{node['chub-solr']['app_dir']}"
	action :nothing
end

#TODO: check the filenames & paths
execute 'Extract_SOLR_Config_Zip' do
	command "unzip #{node['chub-solr']['base_dir']}/solr.zip -d #{node['chub-solr']['config_dir']}"
	# command "echo 'I'm totally extracting that thing you wanted now...'"
	action :nothing
end

execute 'clear_tomcat_app_directory' do
	command "rm -fr #{node['chub-solr']['app_dir']}/solr"
	action :nothing
end

group "#{node['chub-solr']['group']}" do
	action :create
	system true
end

user "#{node['chub-solr']['user']}" do
	comment "Application user for solr"
	gid "#{node['chub-solr']['group']}"
	system true
end

directory "#{node['chub-solr']['config_dir']}" do
	owner "root"
	group "#{node['chub-solr']['group']}"
	mode 0755
end

directory "#{node['chub-solr']['app_dir']}" do
	owner "#{node['chub-solr']['user']}"
	group "#{node['chub-solr']['group']}"
	mode 0774
end

directory "#{node['chub-solr']['log_dir']}" do
	owner "#{node['chub-solr']['user']}"
	group "#{node['chub-solr']['group']}"
	mode 0774
end

directory "#{node['chub-solr']['data_dir']}" do
	owner "#{node['chub-solr']['user']}"
	group "#{node['chub-solr']['group']}"
	mode 0774
end

directory "#{node['chub-solr']['temp_dir']}" do
	owner "tomcat#{node['tomcat']['base_version']}"
	group "#{node['chub-solr']['group']}"
	mode 0775
end


source_url = ''
if node['instance_role'] == 'vagrant'
	unless File.exists?("/vagrant/solr-#{node['chub-solr']['version']}.tgz")
		`wget #{node['chub-hornetq']['origin_http_uri']} -P /vagrant`
		#`wget http://archive.apache.org/dist/lucene/solr/#{node['chub-solr']['version']}/solr-#{node['chub-solr']['version']}.tgz -P /vagrant`
	end
	source_url = "file:///vagrant/solr-#{node['chub-solr']['version']}.tgz"
else
	source_url = node['chub-hornetq']['origin_http_uri']
	log "Downloading file from the internet. Check on the internal URI." do
		level :warn
	end
end

#TODO: look at the chub-hornetq::solr.rb:~54 and chub-solr
# App File
remote_file "#{node['chub-solr']['archive_dir']}/solr-#{node['chub-solr']['version']}.tgz" do
	# source "http://archive.apache.org/dist/lucene/solr/#{node['chub-solr']['version']}/solr-#{node['chub-solr']['version']}.tgz"
	source source_url
	owner "#{node['chub-solr']['user']}"
	group "#{node['chub-solr']['group']}"
	action :create_if_missing
	notifies :run, 'execute[clear_tomcat_app_directory]', :immediately
	notifies :run, 'execute[Extract_SOLR_Tarball]', :immediately
	notifies :restart, "service[tomcat]", :delayed
end

# Config File
remote_file "#{node['chub-solr']['base_dir']}/solr.zip" do
	action :create_if_missing
	source "http://mpbamboo.nexus.commercehub.com/artifact/BS-BSM/shared/build-latestSuccessful/solr.zip/solr.zip"
	notifies :run, 'execute[Extract_SOLR_Config_Zip]', :immediately
	mode 0755
	# notifies :restart, "service[tomcat]", :delayed
end





#TODO: ? link /var/lib/tomcat7/webapps/SOLR to "#{node['chub-solr']['base_dir']}"-"#{node['chub-solr']['version']}""
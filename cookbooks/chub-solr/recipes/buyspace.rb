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

execute 'Extract_SOLR_Tarball' do
	command "tar -zxvf #{node['chub-solr']['base']}/solr-#{node['chub-solr']['version']}.tgz -C #{node['chub-solr']['base']}"
	action :nothing
end

execute 'Extract_SOLR_Config_Zip' do
	command "unzip /var/solr.zip -d #{node['chub-solr']['base']}"
	action :nothing
end

execute 'Fix_SOLR_Cores_Perms' do
	command "chown -R tomcat7:tomcat7 #{node['chub-solr']['cores_dir']}"
	action :nothing
end

execute 'clear_tomcat_app_directory' do
	command "rm -fr #{node['chub-solr']['app_dir']}/solr"
	action :nothing
end

execute 'Copy_SOLR_WAR' do
	command "cp #{node['chub-solr']['base']}/solr-#{node['chub-solr']['version']}/example/webapps/solr.war #{node['chub-solr']['app_dir']}"
	action :nothing
end

execute 'Copy_SLF4J_stuff' do
	command "cp #{node['chub-solr']['base']}/solr-#{node['chub-solr']['version']}/example/lib/ext/*.jar /usr/share/tomcat7/lib && chmod +x /usr/share/tomcat7/lib/*slf4j*.jar"
	#command "cp #{node['chub-solr']['base']}/solr-#{node['chub-solr']['version']}/example/lib/ext/*.jar /usr/share/tomcat7/lib && chmod +x /usr/share/tomcat7/lib/*slf4j*.jar && cp #{node['chub-solr']['base']}/solr-#{node['chub-solr']['version']}/example/resources/log4j.properties /usr/share/tomcat7/lib"
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
	recursive true
	mode 0754
end

# This flat-out doesn't work. Ruby doesn't interpolate the attributes when
# creating the array. It makes me sad.
# %w{	
# 	"#{node['chub-solr']['app_dir']}"
# 	"#{node['chub-solr']['home']}"
# 	"#{node['chub-solr']['cores_dir']}"
# 	"#{node['chub-solr']['data_dir']}"
# 	"#{node['chub-solr']['log_dir']}"
# }.each do |dir|
# 	directory "#{dir}" do
# 		owner "#{node['chub-solr']['user']}"
# 		group "#{node['chub-solr']['group']}"
# 		recursive true
# 		mode 0774
# 	end
# end


directory "#{node['chub-solr']['app_dir']}" do
	owner "#{node['chub-solr']['user']}"
	group "#{node['chub-solr']['group']}"
	recursive true
	mode 0774
end

directory "#{node['chub-solr']['log_dir']}" do
	owner "#{node['chub-solr']['user']}"
	group "#{node['chub-solr']['group']}"
	recursive true
	mode 0774
end

directory "#{node['chub-solr']['data_dir']}" do
	owner "#{node['chub-solr']['user']}"
	group "#{node['chub-solr']['group']}"
	recursive true
	mode 0774
end

directory "#{node['chub-solr']['cores_dir']}" do
	owner "#{node['chub-solr']['user']}"
	group "#{node['chub-solr']['group']}"
	recursive true
	mode 0774
end

directory "#{node['chub-solr']['home']}" do
	owner "#{node['chub-solr']['user']}"
	group "#{node['chub-solr']['group']}"
	recursive true
	mode 0774
end

# From where should we acquire the SOLR tarball?
source_url = ''
if node['instance_role'] == 'vagrant'
	unless File.exists?("/vagrant/solr-#{node['chub-solr']['version']}.tgz")
		`wget #{node['chub-solr']['origin_http_uri']} -P /vagrant`
		#`wget http://archive.apache.org/dist/lucene/solr/#{node['chub-solr']['version']}/solr-#{node['chub-solr']['version']}.tgz -P /vagrant`
	end
	source_url = "file:///vagrant/solr-#{node['chub-solr']['version']}.tgz"
else
	source_url = node['chub-solr']['origin_http_uri']
	log "Downloading file from the internet. Check on the internal URI." do
		level :warn
	end
end

# App File
remote_file "#{node['chub-solr']['base']}/solr-#{node['chub-solr']['version']}.tgz" do
	# source "http://archive.apache.org/dist/lucene/solr/#{node['chub-solr']['version']}/solr-#{node['chub-solr']['version']}.tgz"
	source source_url
	owner "#{node['chub-solr']['user']}"
	group "#{node['chub-solr']['group']}"
	action :create_if_missing
	notifies :run, 'execute[clear_tomcat_app_directory]', :immediately
	notifies :run, 'execute[Extract_SOLR_Tarball]', :immediately
	notifies :run, 'execute[Copy_SOLR_WAR]', :immediately
	notifies :run, 'execute[Copy_SLF4J_stuff]', :immediately
	notifies :restart, "service[tomcat]", :delayed
	#notifies :restart, "service[tomcat7]", :delayed
end

# Bamboo-generated configs
remote_file "/var/solr.zip" do
	action :create_if_missing
	source "http://mpbamboo.nexus.commercehub.com/artifact/BS-BSM/shared/build-latestSuccessful/solr.zip/solr.zip"
	notifies :run, 'execute[Extract_SOLR_Config_Zip]', :immediately
	#notifies :run, 'execute[Create_SOLR_Link]', :immediately
	notifies :restart, "service[tomcat]", :delayed
	#notifies :restart, "service[tomcat7]", :delayed
	mode 0755
	# notifies :restart, "service[tomcat]", :delayed
end

cookbook_file "solr.xml" do
	path "#{node['chub-solr']['cores_dir']}/solr.xml"
	action :create_if_missing
	owner "#{node['chub-solr']['user']}"
	group "#{node['chub-solr']['group']}"
	mode 0755
	notifies :restart, "service[tomcat]", :delayed
end

template "/usr/share/tomcat7/lib/log4j.properties" do
	action :create_if_missing
	source "log4j.properties.erb"
	mode 0755
	notifies :restart, "service[tomcat]", :delayed
end

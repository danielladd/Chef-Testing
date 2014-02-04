#
# Cookbook Name:: chub-hornetq
# Recipe:: buyspace
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


execute 'Extract_HornetQ_Tarball' do
	command "tar -zxvf #{node['chub-hornetq']['base_dir']}/hornetq-#{node['chub-hornetq']['version']}.tar.gz -C #{node['chub-hornetq']['base_dir']}"
	action :nothing
end

execute 'Extract_HornetQ_Config_Zip' do
	command "unzip #{node['chub-hornetq']['base_dir']}/hornetq.zip -d #{node['chub-hornetq']['config_dir']}"
	# command "echo 'I'm totally extracting that thing you wanted now...'"
	action :nothing
end

execute 'Remove_HornetQ_Link' do
	command "rm #{node['chub-hornetq']['app_dir']}"
	action :nothing
end

execute 'Create_HornetQ_Link' do
	command "ln -s #{node['chub-hornetq']['base_dir']}/hornetq-#{node['chub-hornetq']['version']} #{node['chub-hornetq']['app_dir']}"
	action :nothing
end


directory "#{node['chub-hornetq']['config_dir']}" do
	action :create
end

directory "#{node['chub-hornetq']['base_dir']}" do
	action :create
end


remote_file "#{node['chub-hornetq']['base_dir']}/hornetq.zip" do
	action :create_if_missing
	source "http://mpbamboo.nexus.commercehub.com/artifact/BS-BSM/shared/build-latestSuccessful/hornetq.zip/hornetq.zip"
#	notifies :run, 'execute[Extract_HornetQ_Config_Zip]', :immediately
	# notifies :restart, "service[tomcat]", :delayed
end


source_url = ''
if node['instance_role'] == 'vagrant'
	unless File.exists?("/vagrant/hornetq-#{node['chub-hornetq']['version']}.tar.gz")
		`wget #{node['chub-hornetq']['origin_http_uri']} -P /vagrant`
	end
	source_url = "file:///vagrant/hornetq-#{node['chub-hornetq']['version']}.tar.gz"
else
	source_url = node['chub-hornetq']['origin_http_uri']
	log "Downloading file from the internet. Check on the internal URI." do
		level :warn
	end
end

#log "source_url is #{source_url}"

remote_file "#{node['chub-hornetq']['base_dir']}/hornetq-#{node['chub-hornetq']['version']}.tar.gz" do
	# if node[:instance_role] == 'vagrant'
	# 	unless File.exists?("/vagrant/hornetq-#{node['chub-hornetq']['version']}.tar.gz") do
	# 		`wget #{node['chub-hornetq']['origin_http_uri']} -P /vagrant`
	# 	end
	# 	source_url = "/vagrant/hornetq-#{node['chub-hornetq']['version']}.tar.gz"
	# else
	# 	source_url = node['chub-hornetq']['origin_http_uri']
	# 	log "Downloading file from the internet. Check on the internal URI." do
	# 		level :warn
	# 	end
	# 	# # TODO: Make this block work
	# 	# # if local file cache is not available, download from internet
	# 	# uri = "#{node['chub-hornetq']['internal_http_uri']}"
	# 	# require "net/http"
	# 	# url = URI.parse(uri)
	# 	# #request = Net::HTTP.new( url.host, url.port)
	# 	# request = Net::HTTP.new( uri )
	# 	# #response = request.request_head url.path
	# 	# response = request.request_head uri

	# 	# if response.code.to_i == 200
	# 	#     source node['chub-hornetq']['internal_http_uri']
	# 	# else
	# end

	# log "source_url is #{source_url}" do
	# 	level :warn
	# end

	action :create_if_missing
	source source_url

	notifies :run, 'execute[Extract_HornetQ_Tarball]', :immediately
	if File.exists?("#{node['chub-hornetq']['app_dir']}")
		notifies :run, 'execute[Remove_HornetQ_Link]', :immediately
	end
	notifies :run, 'execute[Create_HornetQ_Link]', :immediately
	# notifies :restart, "service[tomcat]", :delayed
end




# extract config archive
# 	creates ...
# 	notifies tomcat reload


# service "hornetq" do
# 	provider Chef::Provider::Service::Upstart
# 	supports :restart => true
# 	action [ :enable, :start ]
# end

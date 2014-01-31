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
	command "tar -zxvf #{node['chub-hornetq']['base_dir']}/hornetq-#{node['chub-hornetq']['version']}.tar.gz"
	action :nothing
end

execute 'Extract_HornetQ_Config_Zip' do
	command "unzip #{node['chub-hornetq']['base_dir']}/hornetq.zip -d #{node['chub-buyspace']['config_dir']}"
	action :nothing
end

execute 'Remove_HornetQ_Link' do
	command "rm #{node['chub-hornetq']['app_dir']}"
	action :nothing
end

execute 'Create_HornetQ_Link' do
	command "ln -s #{node['chub-hornetq']['base_dir']}/hornetq-#{node['chub-hornetq']['version']} #node{['chub-hornetq']['app_dir']}"
	action :nothing
end


directory "#{node['chub-buyspace']['config_dir']}" do
	action :create_if_missing
end

directory "#{node['chub-buyspace']['base_dir']}" do
	action :create_if_missing
end


remote_file "#{node['chub-hornetq']['base_dir']}/hornetq-#{node['chub-hornetq']['version']}.tar.gz" do
	action :create_if_missing

	# if local file cache is not available, download from internet
	uri = URI(node['chub-hornetq']['internal_http_uri'])
	request = Net::HTTP.new uri.host
	response = request.request_head uri.path
	if response.code.to_i == 200
		source node['chub-hornetq']['internal_http_uri']
	else
		source node['chub-hornetq']['origin_http_uri']
		log "Downloading file from the internet. Check on the internal URI." do
			level :warn
		end
	end
	notifies :run, 'execute[Extract_HornetQ_Tarball]', :immediately
	notifies :run, 'execute[Remove_HornetQ_Link', :immediately
	notifies :run, 'execute[Create_HornetQ_Link', :immediately
	notifies :restart, "service[tomcat]", :delayed
end


remote_file "#{node['chub-hornetq']['base_dir']}/hornetq.zip" do
	source "http://mpbamboo.nexus.commercehub.com/artifact/BS-BSM/shared/build-latestSuccessful/hornetq.zip/hornetq.zip"
	notifies 'execute[Extract_HornetQ_Config_Zip]', :immediately
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
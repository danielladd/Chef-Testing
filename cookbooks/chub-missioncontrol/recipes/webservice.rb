#
# Cookbook Name:: chub-missioncontrol
# Recipe:: webservice
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
# limitations under the License .
#
# http://bamboom1:8085/browse/MC-MCDEM/latest/artifact/shared/Inventory-Web-Service-demo/standalone.jar


directory node['chub-missioncontrol']['webservice']['staging_dir'] do
  action :create
  owner "chub-missioncontrol"
  group "chub-missioncontrol"
  mode 0550
end

directory node['chub-missioncontrol']['webservice']['deploy_dir']do
  action :create
  owner "chub-missioncontrol"
  group "chub-missioncontrol"
  mode 0550
end

# TODO: Is this needed?  Once it outputs log this directory will exist
# have to create this otherwise the symlink fails. 
#directory "#{node["chub-missioncontrol"]["webServiceDeployDir"]}/log" do
#  action :create
#end

propFile = "#{node['chub-missioncontrol']['webservice']['staging_dir']}/#{node["chub-missioncontrol"]['webservice']['property_file_name']}"
remote_file "#{node['chub-missioncontrol']['webservice']['staging_dir']}/#{node["chub-missioncontrol"]['webservice']['jar_name']}" do
  source node["chub-missioncontrol"]["deployJarUrl"]
  notifies :run, "template[#{propFile}]"	
end

template "#{node['chub-missioncontrol']['webservice']['staging_dir']}/#{node["chub-missioncontrol"]['webservice']['property_file_name']}" do
  source "deploy.properties.erb"
  owner "root"
  group "root"
  mode 0644
  #TODO: This does not properly notify or re-execute deploy after property file is updated
  notifies :run, "execute[deploy]"
end

remote_file "#{node['chub-missioncontrol']['webservice']['app_dir']}/#{node['chub-missioncontrol']['webservice']['bamboo_server_artifact_file_name']}" do
	source "http://#{node['chub-missioncontrol']['webservice']['bamboo_server_name']}:#{node['chub-missioncontrol']['webservice']['bamboo_server_port']}/browse/#{node['chub-missioncontrol']['webservice']['bamboo_server_build_project']}-#{node['chub-missioncontrol']['webservice']['bamboo_server_build_key']}/latest/artifact/shared/#{node['chub-missioncontrol']['webservice']['bamboo_server_artifact']}/#{node['chub-missioncontrol']['webservice']['bamboo_server_artifact_name']}"
	owner "chub-missioncontrol"
	group "chub-missioncontrol"
	action :create_if_missing
	notifies :run, 'deploy_web_service_jar', :immediately
end
w
execute "deploy_web_service_jar" do
  command "java -jar #{node['chub-missioncontrol']['webservice']['staging_dir']}/#{node['chub-missioncontrol']['webservice']['jar_name']} -d #{node['chub-missioncontrol']['webservice']['staging_dir']}/#{node["chub-missioncontrol"]['webservice']['property_file_name']}"
  creates "#{node['chub-missioncontrol']['webservice']['deploy_dir']}/bin"
  action :run
  notifies "restart", "service[#{node['chub-missioncontrol']['webservice']['service_name']}]", :delayed
end

link "/etc/missioncontrol" do
  to "#{node['chub-missioncontrol']['webservice']['deploy_dir']}/config"
end

link "/var/log/missioncontrol" do
  to "#{node['chub-missioncontrol']['webservice']['deploy_dir']}/log"
end
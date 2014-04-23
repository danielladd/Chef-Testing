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


propFile = "#{node['chub-missioncontrol']['webservice']['stagingDir']}/#{node['chub-missioncontrol']['webservice']['config_file_name']}"
remote_file "#{node['chub-missioncontrol']['webservice']['stagingDir']}/#{node['chub-missioncontrol']['webservice']['jar_file_name']}" do
  source node['chub-missioncontrol']['webservice']["jar_file_url"]
  notifies :run, "template[#{propFile}]"	
end

#template "#{node['chub-missioncontrol']['webservice']['stagingDir']}/#{node['chub-missioncontrol']['webservice']['config_file_name']}" do
#  source "config.yml"
#  owner "root"
#  group "root"
#  mode 0644
#  #TODO: This does not properly notify or re-execute deploy after property file is updated
#  notifies :run, "execute[deploy]"
#end

#execute "deploy" do
#  command "java -jar #{node['chub-missioncontrol']['webservice']['staging_dir']}/#{node['chub-missioncontrol']['webservice']['jar_file_name']} -d #{node['chub-missioncontrol']['webservice']['staging_dir']}/#{node['chub-missioncontrol']['webservice']['config_file_name']}"
#  creates "#{node['chub-missioncontrol']['webservice']['deployDir']}/bin"
#  action :run
#  notifies "restart", "service[onbwebservice]", :delayed
#end

template "/etc/init/onbwebservice.conf" do
    source "missioncontrol-config.groovy.erb"
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[onbwebservice]", :delayed
end

link "/etc/webservice" do
  to "#{node['chub-missioncontrol']['webservice']['deployDir']}/config"
end

link "/var/log/webservice" do
  to "#{node['chub-missioncontrol']['webservice']}/log"
end

service "onbwebservice" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end
#
# Cookbook Name:: chub-batchagent
# Recipe:: batchagent
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

group "batchagent" do
    action :create
    system true
end

user "batchagent" do
    comment "Application user for batchagent"
    gid "batchagent"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "batchagent" do
    action :modify
    append true
    members ["batchagent", "chadmin"]
end

directory node["chub-batchagent"]["stagingDir"] do
  action :create
  owner "batchagent"
  group "batchagent"
  mode 0550
end

directory node["chub-batchagent"]["deployDir"] do
  action :create
  owner "batchagent"
  group "batchagent"
  mode 0550
end

# TODO: Is this needed?  Once it outputs log this directory will exist
# have to create this otherwise the symlink fails. 
#directory "#{node["chub-batchagent"]["deployDir"]}/log" do
#  action :create
#end

propFile = "#{node["chub-batchagent"]["stagingDir"]}/#{node["chub-batchagent"]["propertyFileName"]}"
remote_file "#{node["chub-batchagent"]["stagingDir"]}/#{node["chub-batchagent"]["jarName"]}" do
  source node["chub-batchagent"]["deployJarUrl"]
  notifies :run, "template[#{propFile}]"	
end

template "#{node["chub-batchagent"]["stagingDir"]}/#{node["chub-batchagent"]["propertyFileName"]}" do
  source "deploy.properties.erb"
  owner "root"
  group "root"
  mode 0644
  #TODO: This does not properly notify or re-execute deploy after property file is updated
  notifies :run, "execute[deploy]"
end

execute "deploy" do
  command "java -jar #{node["chub-batchagent"]["stagingDir"]}/#{node["chub-batchagent"]["jarName"]} -d #{node["chub-batchagent"]["stagingDir"]}/#{node["chub-batchagent"]["propertyFileName"]}"
  creates "#{node["chub-batchagent"]["deployDir"]}/bin"
  action :run
  notifies "restart", "service[batchagent]", :delayed
end

template "/etc/init/batchagent.conf" do
    source "batchagent.conf.erb"
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[batchagent]", :delayed
end

link "/etc/batchagent" do
  to "#{node["chub-batchagent"]["deployDir"]}/config"
end

link "/var/log/batchagent" do
  to "#{node["chub-batchagent"]["deployDir"]}/log"
end

service "batchagent" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end

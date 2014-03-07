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

directory node["chub-batchagent"]["stagingDir"] do
  action :create
end

directory node["chub-batchagent"]["deployDir"] do
  action :create
end

# have to create this otherwise the symlink fails. 
#directory "#{node["chub-batchagent"]["deployDir"]}/log" do
#  action :create
#end

remote_file "#{node["chub-batchagent"]["stagingDir"]}/#{node["chub-batchagent"]["jarName"]}" do
  source node["chub-batchagent"]["deployJarUrl"]	
end

template "#{node["chub-batchagent"]["stagingDir"]}/#{node["chub-batchagent"]["propertyFileName"]}" do
  source "deploy.properties.erb"
end

execute "deploy" do
  command "java -jar #{node["chub-batchagent"]["stagingDir"]}/#{node["chub-batchagent"]["jarName"]} -d #{node["chub-batchagent"]["stagingDir"]}/#{node["chub-batchagent"]["propertyFileName"]}"
  creates "#{node["chub-batchagent"]["deployDir"]}/bin"
  action :run
end

link "/etc/batchagent" do
  to "#{node["chub-batchagent"]["deployDir"]}/config"
end

link "/var/log/batchagent" do
  to "#{node["chub-batchagent"]["deployDir"]}/log"
end
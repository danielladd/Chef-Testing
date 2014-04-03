#
# Cookbook Name:: chub-hornetq
# Recipe:: mqdestinations
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

execute "delete mq property file" do
  command "rm #{node['chub-hornetq']['staging_dir']}/#{node['chub-hornetq']['destinations_deploy_prop']}"
  action :nothing
end

prop_file = "#{node['chub-hornetq']['staging_dir']}/#{node['chub-hornetq']['destinations_deploy_prop']}"
remote_file "#{node['chub-hornetq']['staging_dir']}/#{node['chub-hornetq']['destinations_jar_name']}" do
  source node['chub-hornetq']['destinations_deploy_jar_url']
  notifies :run, "execute[delete mq property file]"
end

template prop_file do
  source "destinations.deploy.properties.erb"
  owner "root"
  group "root"
  mode 0644
  action :create_if_missing
  #TODO: This does not properly notify or re-execute deploy after property file is updated
  notifies :run, "execute[deployDestinations]"
end

execute "deployDestinations" do
  command "java -jar #{node['chub-hornetq']['staging_dir']}/#{node['chub-hornetq']['destinations_jar_name']} -d #{prop_file}"
  cwd node['chub-hornetq']['staging_dir']
  action :nothing
  notifies :restart, "service[hornetq]", :delayed
end


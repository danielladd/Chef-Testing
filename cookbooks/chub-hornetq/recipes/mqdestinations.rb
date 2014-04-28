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
  command   "rm #{node['chub-hornetq']['staging_dir']}/#{node['chub-hornetq']['destinations_deploy_prop']}"
  action    :nothing
  only_if   { ::File.exists?("#{node['chub-hornetq']['staging_dir']}/#{node['chub-hornetq']['destinations_deploy_prop']}") }
end

prop_file = "#{node['chub-hornetq']['staging_dir']}/#{node['chub-hornetq']['destinations_deploy_prop']}"
remote_file "#{node['chub-hornetq']['staging_dir']}/#{node['chub-hornetq']['destinations_jar_name']}" do
  source     node['chub-hornetq']['destinations_deploy_jar_url']
  owner      "hornetq"
  group      "minions"
  notifies   :run, "execute[delete mq property file]", :immediately
end

template prop_file do
  source   "destinations.deploy.properties.erb"
  owner    "hornetq"
  group    "minions"
  mode     0745
  action   :create_if_missing
  #TODO: This does not properly notify or re-execute deploy after property file is updated
  notifies :run, "execute[deployDestinations]", :immediately
end

execute "deployDestinations" do
  command   "java -jar #{node['chub-hornetq']['staging_dir']}/#{node['chub-hornetq']['destinations_jar_name']} -d #{prop_file}"
  cwd       node['chub-hornetq']['staging_dir']
  user      "hornetq"
  group     "minions" 
  action    :nothing
  umask      003
  notifies  :restart, "service[hornetq]", :delayed
end


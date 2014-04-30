#
# Cookbook Name:: chub-csdashboard
# Recipe:: default
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
include_recipe "chub_java::oracle7"

group 'chub-csdashboard' do
    action :create
    system true
end

user 'chub-csdashboard' do
    comment "Application user for chub-csdashboard"
    gid 'chub-csdashboard'
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group 'chub-csdashboard' do
    action :modify
    append true
    members ['chub-csdashboard', 'chadmin']
end

directory node['chub-csdashboard']['app']['deploy_dir'] do
  action :create
  owner 'chub-csdashboard'
  group 'chub-csdashboard'
  mode 0777
end

directory node['chub-csdashboard']['app']['config_dir'] do
  action :create
  owner 'chub-csdashboard'
  group 'chub-csdashboard'
  mode 0777
end

directory node['chub-csdashboard']['app']['log_dir'] do
  action :create
  owner 'chub-csdashboard'
  group 'chub-csdashboard'
  mode 0777
end

touchfile = node['chub-csdashboard']['app']['touchfile']

remote_file "#{node['chub-csdashboard']['app']['deploy_dir']}/#{node['chub-csdashboard']['app']['app_name']}.jar" do
  source "#{node['chub-csdashboard']['app']['jar_file_url']}"
  not_if do
    File.exists?(touchfile)
  end
  owner 'chub-csdashboard'
  group 'chub-csdashboard'
  action :create	# This should pull the file down forcefully
end

template "/etc/init/csdashboard.conf" do
    source "csdashboard.conf.erb"
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[csdashboard]", :delayed
end

service "csdashboard" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end
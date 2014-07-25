#
# Cookbook Name:: chub_rundeck
# Recipe:: mysql_base
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

node.set[:mysql][:bind_address] = node[:ipaddress]
node.save

packages = %w{libssl-dev zlib1g-dev libreadline-dev libyaml-dev libmysqlclient-dev}
packages.each do |dev_pkg|
  package dev_pkg
end

include_recipe "database::mysql"
include_recipe "mysql::client"

mysql_service 'default' do
  version            '5.5'
  port               node[:mysql][:port]
  data_dir           node[:mysql][:data_dir]
  template_source    'my.cnf.erb'
  action             :create
end


# Sensu
include_recipe "chub_sensu::client"

remote_file "#{node[:chub_sensu][:root_plugin_path]}/mysql-replication-status.rb" do
    source "#{node[:chub_sensu][:root_sensu_community_plugins_repo_url]}/plugins/mysql/mysql-replication-status.rb"
    mode 0755
end

remote_file "#{node[:chub_sensu][:root_plugin_path]}/mysql-alive.rb" do
    source "#{node[:chub_sensu][:root_sensu_community_plugins_repo_url]}/plugins/mysql/mysql-alive.rb"
    mode 0755
end

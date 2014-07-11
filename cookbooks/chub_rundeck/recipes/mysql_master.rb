#
# Cookbook Name:: chub_rundeck
# Recipe:: mysql_master
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
include_recipe "chub_rundeck::mysql_base"

mysql_connection_info = {
  :host     => "localhost",
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

database node[:chub_rundeck][:db_name] do
  connection    mysql_connection_info
  provider      Chef::Provider::Database::Mysql
  action        :create
end

database_user node[:chub_rundeck][:db_user] do
  connection       mysql_connection_info
  database_name    node[:chub_rundeck][:db_name]
  password         node[:chub_rundeck][:db_pass]
  provider         Chef::Provider::Database::MysqlUser
  privileges       [:all]
  host             "%"
  action           :create
end

database_user node[:chub_rundeck][:db_user] do
  connection       mysql_connection_info
  database_name    node[:chub_rundeck][:db_name]
  password         node[:chub_rundeck][:db_pass]
  provider         Chef::Provider::Database::MysqlUser
  privileges       [:all]
  host             "%"
  action           :grant
end

ruby_block "store_mysql_master_status" do
  block do
    require 'mysql'
    node.set[:mysql][:master] = true
    m = Mysql.new("localhost", "root", node[:mysql][:server_root_password])
    m.query("show master status") do |row|
      row.each_hash do |h|
        node.set[:mysql][:master_file] = h['File']
        node.set[:mysql][:master_position] = h['Position']
      end
    end
    Chef::Log.info "Storing database master replication status: #{node[:mysql][:master_file]} #{node[:mysql][:master_position]}"
    node.save
  end
  # only execute if mysql is running
  only_if "pgrep 'mysqld$'"
  # subscribe to mysql service to catch restarts
  subscribes :create, resources(:mysql_service => "default")
end




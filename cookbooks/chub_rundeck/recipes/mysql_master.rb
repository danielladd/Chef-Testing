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

node.set[:mysql][:server_root_password] = 'password'
node.set[:mysql][:port] = '3308'
node.set[:mysql][:data_dir] = '/data'
node.set[:mysql][:bind_address] = node[:ipaddress]
node.set[:mysql][:server_id] = 1
node.set[:mysql][:log_bin] = "/var/log/mysql/mysql-bin.log"
node.set[:mysql][:database_to_replicate] = "rundeckdb"
node.set[:mysql][:cluster_name] = "rundeckcluster"
node.set[:mysql][:server_repl_password] = "password"

packages = ["libssl-dev","zlib1g-dev","libreadline-dev", "libyaml-dev", "libmysqlclient-dev"]

packages.each do |dev_pkg|
  package dev_pkg
end

include_recipe "database::mysql"
include_recipe "mysql::client"
include_recipe "mysql::server"

template '/etc/mysql/conf.d/mysite.cnf' do
  owner 'mysql'
  owner 'mysql'      
  source 'my.cnf.erb'
  notifies :restart, 'mysql_service[default]'
end

mysql_connection_info = {
  :host     => 'localhost',
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

database 'rundeckdb' do
  connection    mysql_connection_info
  provider      Chef::Provider::Database::Mysql
  action        :create
end

database_user 'rundeckuser' do
  connection      mysql_connection_info
  database_name   "rundeckdb"
  password        'rundeck'
  provider        Chef::Provider::Database::MysqlUser
  privileges      [:all]
  action          :create
end

database_user 'rundeckuser' do
  connection      mysql_connection_info
  database_name   "rundeckdb"
  password        'rundeck'
  provider        Chef::Provider::Database::MysqlUser
  privileges      [:all]
  action          :grant
end


## mysql::master
ruby_block "store_mysql_master_status" do
  block do
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
  subscribes :create, resources(:service => "mysql")
end




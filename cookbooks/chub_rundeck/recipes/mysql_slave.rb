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
node.set[:mysql][:server_id] = 2
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


## mysql::slave
ruby_block "start_replication" do
  block do
    dbmasters = search(:node, "mysql_master:true AND mysql_cluster_name:#{node[:mysql][:cluster_name]}")
 
    if dbmasters.size != 1
      Chef::Log.error("#{dbmasters.size} database masters, cannot set up replication!")
    else
      dbmaster = dbmasters.first
      Chef::Log.info("Using #{dbmaster.name} as master")
 
      m = Mysql.new("localhost", "root", node[:mysql][:server_root_password])
      command = %Q{
      CHANGE MASTER TO
        MASTER_HOST="#{dbmaster.mysql.bind_address}",
        MASTER_USER="repl",
        MASTER_PASSWORD="#{dbmaster.mysql.server_repl_password}",
        MASTER_LOG_FILE="#{dbmaster.mysql.master_file}",
        MASTER_LOG_POS=#{dbmaster.mysql.master_position};
      }
      Chef::Log.info "Sending start replication command to mysql: "
      Chef::Log.info "#{command}"
 
      m.query("stop slave")
      m.query(command)
      m.query("start slave")
    end
  end
  not_if do
    #TODO this fails if mysql is not running - check first
    m = Mysql.new("localhost", "root", node[:mysql][:server_root_password])
    slave_sql_running = ""
    m.query("show slave status") {|r| r.each_hash {|h| slave_sql_running = h['Slave_SQL_Running'] } }
    slave_sql_running == "Yes"
  end
end




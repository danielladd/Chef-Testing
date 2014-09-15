#
# Cookbook Name:: phpapp
# Recipe:: mysql_server
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "mysql::server"
include_recipe "mysql::ruby"

sites = data_bag("wp-sites")
 
sites.each do |site|
  opts = data_bag_item("wp-sites", site)

  mysql_database opts["database"] do
    connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
    action :create
  end

  mysql_database_user opts["db_username"] do
    connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
    password opts["db_password"]
    database_name opts["database"]
    privileges [:select,:update,:insert,:create,:delete]
    host node['phpapp']['db_user_host']
    action :grant
  end
end
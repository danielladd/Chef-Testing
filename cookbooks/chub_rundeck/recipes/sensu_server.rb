#
# Cookbook Name:: chub_rundeck
# Recipe:: sensu_server
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "chub_sensu::server"

handlerList = ["email"]

## Pipeline Handler
sensu_handler "pipeline_team" do
    type "set"
    handlers handlerList
end

# Checks
sensu_check "mysql_replication_status" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/mysql-replication-status.rb -h #{node[:chub_rundeck][:dbslave]} -u #{node[:chub_rundeck][:db_user]} -p #{node[:chub_rundeck][:db_pass]} -w 180 -c 300"
    handlers ["pipeline_team"]
    subscribers ["rundeck_mysql_slave"]
    interval 60
    additional(:occurrences => 2)
end

# Checks
sensu_check "mysql_alive" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/mysql-alive.rb -h #{node[:chub_rundeck][:dbmaster]} -u #{node[:chub_rundeck][:db_user]} -p #{node[:chub_rundeck][:db_pass]} -d #{node[:chub_rundeck][:db_name]}"
    handlers ["pipeline_team"]
    subscribers ["rundeck_mysql_master"]
    interval 60
    additional(:occurrences => 2)
end

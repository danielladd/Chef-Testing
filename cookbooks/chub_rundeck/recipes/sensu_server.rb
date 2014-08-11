#
# Cookbook Name:: chub_rundeck
# Recipe:: sensu_server
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#
handlerList = ["email"]

sensu_client node.name do
    address node[:ipaddress]
    subscriptions node[:roles] + ["external_checks"]
end


## Pipeline Handler
sensu_handler "pipeline_team" do
    type "set"
    handlers handlerList
end

# Checks
sensu_check "mysql_replication_status" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/mysql-replication-status.rb -h localhost -u root -p #{node[:mysql][:server_root_password]} -w 180 -c 300"
    handlers ["pipeline_team"]
    subscribers ["rundeck_mysql_slave"]
    interval 60
    additional(:occurrences => 2)
end

sensu_check "mysql_alive" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/mysql-alive.rb -h localhost -u #{node[:chub_rundeck][:db_user]} -p #{node[:chub_rundeck][:db_pass]} -d #{node[:chub_rundeck][:db_name]}"
    handlers ["pipeline_team"]
    subscribers ["rundeck_mysql_master", "pagerduty_pipeline"]
    interval 60
    additional(:occurrences => 2)
end

sensu_check "rundeck_server_http" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-http.rb -u http://localhost/api/1/system/info?authtoken=ovv597NCVu90k4OV7n3vduEvRD714DkE"
    handlers ["pipeline_team"]
    subscribers ["rundeck_server"]
    interval 60
    additional(:occurrences => 2)
end

sensu_check "rundeck_loadbalance_http" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-http.rb -u http://orch.nexus.commercehub.com/api/1/system/info?authtoken=ovv597NCVu90k4OV7n3vduEvRD714DkE"
    handlers ["pipeline_team", "pagerduty_pipeline"]
    subscribers ["external_checks"]
    interval 60
    additional(:occurrences => 2)
end


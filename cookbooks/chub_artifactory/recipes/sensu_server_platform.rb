#
# Cookbook Name:: chub_artifactory
# Recipe:: server
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "chub_sensu::server"

handlerList = ["email"]

## artifactory_alerts Handler
sensu_handler "artifactory_alerts" do
    type "set"
    handlers handlerList
end

# TODO: Fine tune these settings
# Checks
sensu_check "artifactory_check_disk" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-disk.rb"
    handlers ["artifactory_alerts"]
    subscribers ["artifactory_alerts"]
    interval 60
end

sensu_check "artifactory_check_cpu" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-cpu.rb -c 90 -w 70"
    handlers ["artifactory_alerts"]
    subscribers ["artifactory_alerts"]
    interval 300
    additional(:occurrences => 3)
end

sensu_check "artifactory_check_ram" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-ram.rb -c 5 -w 10"
    handlers ["artifactory_alerts"]
    subscribers ["artifactory_alerts"]
    interval 60
    additional(:occurrences => 2)
end

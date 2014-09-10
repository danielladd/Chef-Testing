#
# Cookbook Name:: chub_pipeline
# Recipe:: server
#
# Copyright (C) 2014 CommerceHub
#
# All rights reserved - Do Not Redistribute
#

handlerList = ["email"]

## Pipeline Handler
sensu_handler "pipeline_team" do
    type "set"
    handlers handlerList
end

# TODO: Fine tune these settings
# Checks
sensu_check "pipeline_check_disk" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-disk.rb"
    handlers ["pipeline_team"]
    subscribers ["pipeline_team"]
    interval 60
end

sensu_check "pipeline_check_cpu" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-cpu.rb -c 90 -w 70"
    handlers ["pipeline_team"]
    subscribers ["pipeline_team"]
    interval 60
    additional(:occurrences => 2)
end

sensu_check "pipeline_check_ram" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-ram.rb -c 5 -w 10"
    handlers ["pipeline_team"]
    subscribers ["pipeline_team"]
    interval 60
    additional(:occurrences => 2)
end

## Metrics to Graphite
sensu_check "pipeline_vmstat_metrics" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/vmstat-metrics.rb --scheme hosts.:::name:::"
    handlers ["graphite_tcp"]
    subscribers ["pipeline_team"]
    type "metric"
    interval 60
end

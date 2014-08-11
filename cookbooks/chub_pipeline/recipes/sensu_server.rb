#
# Cookbook Name:: chub_pipeline
# Recipe:: server
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

handlerList = ["email"]

## PagerDuty Handler
if node[:chub_pipeline].attribute?(:pagerduty) and node[:chub_pipeline][:pagerduty].attribute?(:api_key)
    remote_file "#{node[:chub_sensu][:root_handler_path]}/pagerduty.rb" do
        source "https://raw2.github.com/sensu/sensu-community-plugins/master/handlers/notification/pagerduty.rb"
        mode 0755
    end

    template "#{node[:chub_sensu][:root_handler_config_path]}/pagerduty.json" do
        source "pagerduty.json.erb"
        mode 0644
        variables(:api_key => node[:chub_pipeline][:pagerduty][:api_key])
    end

    sensu_handler "pagerduty_pipeline" do
        type "pipe"
        command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_handler_path]}/pagerduty.rb"
    end
end


#TODO: Does this need to key off of other properties, more team specific properties
if node.attribute?(:graphite) and node[:graphite].attribute?(:host)
    ## Graphite Handler
    template "#{node[:chub_sensu][:root_handler_config_path]}/graphite_tcp_pipeline.json" do
        source "graphite_tcp.json.erb"
        mode 0644
        variables(
            :graphite_host => node[:graphite][:host],
            :graphite_port => node[:graphite][:port]
        )
    end

    ## Metrics to Graphite
    sensu_check "pipeline_vmstat_metrics" do
        command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/vmstat-metrics.rb --scheme hosts.:::name:::"
        handlers ["graphite_tcp_pipeline"]
        subscribers ["pipeline_team"]
        type "metric"
        interval 60
    end
end


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

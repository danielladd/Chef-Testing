#
# Cookbook Name:: chub_rolodex
# Recipe:: server
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

handlerList = ["email"]

## PagerDuty Handler
if node[:chub_rolodex].attribute?(:pagerduty) and node[:chub_rolodex][:pagerduty].attribute?(:api_key)
    remote_file "#{node[:chub_sensu][:root_handler_path]}/pagerduty.rb" do
        source "https://raw2.github.com/sensu/sensu-community-plugins/master/handlers/notification/pagerduty.rb"
        mode 0755
    end

    template "#{node[:chub_sensu][:root_handler_config_path]}/pagerduty.json" do
        source "pagerduty.json.erb"
        mode 0644
        variables(:api_key => node[:chub_rolodex][:pagerduty][:api_key])
    end

    sensu_handler "pagerduty_rolodex" do
        type "pipe"
        command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_handler_path]}/pagerduty.rb"
    end
end


#TODO: Does this need to key off of other properties, more team specific properties
if node.attribute?(:rolodex) and node[:rolodex].attribute?(:graphite) and node[:rolodex][:graphite].attribute?(:host)
    ## Graphite Handler
    template "#{node[:chub_sensu][:root_handler_config_path]}/graphite_tcp_rolodex.json" do
        source "graphite_tcp.json.erb"
        mode 0644
        variables(
            :graphite_host => node[:rolodex][:graphite][:host],
            :graphite_port => node[:rolodex][:graphite][:port]
        )
    end

    ## Metrics to Graphite
    sensu_check "rolodex_vmstat_metrics" do
        command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/vmstat-metrics.rb --scheme hosts.:::name:::"
        handlers ["graphite_tcp_rolodex"]
        subscribers ["rolodex"]
        type "metric"
        interval 60
    end
end


## Pipeline Handler
sensu_handler "rolodex" do
    type "set"
    handlers handlerList
end

# TODO: Fine tune these settings
# Checks
sensu_check "rolodex_check_disk" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-disk.rb"
    handlers ["rolodex"]
    subscribers ["rolodex"]
    interval 60
end

sensu_check "rolodex_check_cpu" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-cpu.rb -c 90 -w 70"
    handlers ["rolodex"]
    subscribers ["rolodex"]
    interval 60
    additional(:occurrences => 2)
end

sensu_check "rolodex_check_ram" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-ram.rb -c 5 -w 10"
    handlers ["rolodex"]
    subscribers ["rolodex"]
    interval 60
    additional(:occurrences => 2)
end

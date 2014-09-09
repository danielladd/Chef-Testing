#
# Cookbook Name:: chub_apartment
# Recipe:: server
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

handlerList = ["email", "pagerduty"]


#TODO: Does this need to key off of other properties, more team specific properties
if node.attribute?(:apartment) and node[:apartment].attribute?(:graphite) and node[:apartment][:graphite].attribute?(:host)
    ## Graphite Handler
    template "#{node[:chub_sensu][:root_handler_config_path]}/graphite_tcp_apartment.json" do
        source "graphite_tcp.json.erb"
        mode 0644
        variables(
            :graphite_host => node[:apartment][:graphite][:host],
            :graphite_port => node[:apartment][:graphite][:port]
        )
    end

    ## Metrics to Graphite
    sensu_check "apartment_vmstat_metrics" do
        command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/vmstat-metrics.rb --scheme hosts.:::name:::"
        handlers ["graphite_tcp_apartment"]
        subscribers ["apartment"]
        type "metric"
        interval 60
    end
end


## Pipeline Handler
sensu_handler "apartment" do
    type "set"
    handlers handlerList
end

# TODO: Fine tune these settings
# Checks
sensu_check "apartment_check_disk" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-disk.rb"
    handlers ["apartment"]
    subscribers ["apartment"]
    interval 60
	additional(:pager_team => "apartment")
end

sensu_check "apartment_check_cpu" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-cpu.rb -c 90 -w 70"
    handlers ["apartment"]
    subscribers ["apartment"]
    interval 60
    additional(:occurrences => 2, :pager_team => "apartment")
end

sensu_check "apartment_check_ram" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-ram.rb -c 5 -w 10"
    handlers ["apartment"]
    subscribers ["apartment"]
    interval 60
    additional(:occurrences => 2, :pager_team => "apartment")
end

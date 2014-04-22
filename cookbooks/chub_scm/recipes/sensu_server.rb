#
# Cookbook Name:: chub_scm
# Recipe:: server
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "chub_sensu::server"

handlerList = ["email"]


#TODO: Does this need to key off of other properties, more team specific properties
if node.attribute?(:graphite) and node[:graphite].attribute?(:host)
    ## Graphite Handler
    template "#{node[:chub_sensu][:root_handler_config_path]}/graphite_tcp_scm.json" do
        source "graphite_tcp.json.erb"
        mode 0644
        variables(
            :graphite_host => node[:graphite][:host],
            :graphite_port => node[:graphite][:port]
        )
    end

    ## Metrics to Graphite
    sensu_check "scm_vmstat_metrics" do
        command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/vmstat-metrics.rb --scheme hosts.:::name:::"
        handlers ["graphite_tcp_scm"]
        subscribers ["scm_team"]
        type "metric"
        interval 60
    end
end


## SCM Handler
sensu_handler "scm_team" do
    type "set"
    handlers handlerList
end

# TODO: Fine tune these settings
# Checks
sensu_check "scm_check_disk" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-disk.rb"
    handlers ["scm_team"]
    subscribers ["scm_team"]
    interval 60
end

sensu_check "scm_check_cpu" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-cpu.rb -c 90 -w 70"
    handlers ["scm_team"]
    subscribers ["scm_team"]
    interval 60
    additional(:occurrences => 2)
end

sensu_check "scm_check_ram" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-ram.rb -c 5 -w 10"
    handlers ["scm_team"]
    subscribers ["scm_team"]
    interval 60
    additional(:occurrences => 2)
end

sensu_check "scm_check_proc" do
    command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/check-proc.rb -p rhodecode -C 1"
    handlers ["scm_team"]
    subscribers ["scm_team"]
    interval 60
end

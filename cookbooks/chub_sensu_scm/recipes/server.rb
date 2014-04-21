#
# Cookbook Name:: chub_sensu_scm
# Recipe:: server
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "base"
include_recipe "sensu"
include_recipe "sensu::rabbitmq"
include_recipe "sensu::redis"
include_recipe "sensu::server_service"
include_recipe "sensu::api_service"
include_recipe "sensu::dashboard_service"

# TODO: investigate chef_node plugin
# https://github.com/sensu/sensu-community-plugins/blob/master/handlers/other/chef_node.rb

# TODO: evaluate ChefNodesStatusChecker
# https://github.com/sensu/sensu-community-plugins/blob/master/plugins/chef/check-chef-nodes.rb

# TODO: review intervals

%w{sensu-plugin mail redphone json}.each do |gem_name|
    gem_package gem_name do
        action :install
        options "--no-rdoc --no-ri"
    end
end

handlerList = Array.new

## Email Handler
if node[:chub_sensu_scm].attribute?(:email) and node[:chub_sensu_scm][:email].attribute?(:recipient) 
    remote_file "/etc/sensu/handlers/mailer.rb" do
        source "https://raw.github.com/sensu/sensu-community-plugins/master/handlers/notification/mailer.rb"
        mode 0755
    end

    # TODO: use smtp authentication
    template "/etc/sensu/conf.d/mailer.json" do
        source "mailer.json.erb"
        mode 0644
    end

    sensu_handler "email" do
        type "pipe"
        command "/usr/bin/ruby1.9.3 /etc/sensu/handlers/mailer.rb"
    end

    handlerList << "email"
end

## PagerDuty Handler
if node[:chub_sensu_pipeline].attribute?(:pagerduty) and node[:chub_sensu_scm][:pagerduty].attribute?(:api_key)
    remote_file "/etc/sensu/handlers/pagerduty.rb" do
        source "https://raw2.github.com/sensu/sensu-community-plugins/master/handlers/notification/pagerduty.rb"
        mode 0755
    end

    template "/etc/sensu/conf.d/pagerduty.json" do
        source "pagerduty.json.erb"
        mode 0644
    end

    sensu_handler "pagerduty" do
        type "pipe"
        command "/usr/bin/rub1.y9.3 /etc/sensu/handlers/pagerduty.rb"
    end

    handlerList << "pagerduty"
end

## Graphite Handler
template "/etc/sensu/conf.d/handlers/graphite_tcp.json" do
    source "graphite_tcp.json.erb"
    mode 0644
    only_if { node.attribute?(:graphite) and node[:graphite].attribute?(:host) }
end


## Default Handler
sensu_handler "default" do
    type "set"
    handlers handlerList
end

## Standard Checks
sensu_check "check-disk" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-disk.rb"
    handlers ["default"]
    subscribers ["all"]
    interval 60
end

sensu_check "check-cpu" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-cpu.rb -c 90 -w 70"
    handlers ["default"]
    subscribers ["all"]
    interval 60
    additional(:occurrences => 2)
end

sensu_check "check-ram" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-ram.rb -c 5 -w 10"
    handlers ["default"]
    subscribers ["all"]
    interval 60
    additional(:occurrences => 2)
end

## Metrics to Graphite
sensu_check "vmstat_metrics" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/vmstat-metrics.rb --scheme hosts.:::name:::"
    handlers ["graphite_tcp"]
    subscribers ["all"]
    type "metric"
    interval 60
end
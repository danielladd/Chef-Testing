#
# Cookbook Name:: chub_sensu
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

directory "#{node[:chub_sensu][:root_handler_config_path]}" do
    action :create
end

%w{sensu-plugin mail redphone json}.each do |gem_name|
    gem_package gem_name do
        action :install
        options "--no-rdoc --no-ri"
    end
end

## Email Handler
if node[:chub_sensu].attribute?(:email) and node[:chub_sensu][:email].attribute?(:recipient)
    remote_file "#{node[:chub_sensu][:root_handler_path]}/mailer.rb" do
        source "https://raw.githubusercontent.com/zarry/sensu-community-plugins/mailer_by_subscription/handlers/notification/mailer.rb"
        #source "https://raw.github.com/sensu/sensu-community-plugins/master/handlers/notification/mailer.rb"
        mode 0755
    end

    # TODO: use smtp authentication
    template "#{node[:chub_sensu][:root_handler_config_path]}/mailer.json" do
        source "mailer.json.erb"
        mode 0644
    end

    sensu_handler "email" do
        type "pipe"
        command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_handler_path]}/mailer.rb"
    end
end


if node.attribute?(:graphite) and node[:graphite].attribute?(:host)
    ## Graphite Handler
    template "#{node[:chub_sensu][:root_handler_config_path]}/graphite_tcp.json" do
        source "graphite_tcp.json.erb"
        #only_if { node.attribute?(:graphite) and node[:graphite].attribute?(:host) }
        mode 0644
        variables(
            :graphite_host => node[:graphite][:host],
            :graphite_port => node[:graphite][:port]
        )
    end

    ## Metrics to Graphite
    sensu_check "vmstat_metrics" do
        command "/usr/bin/ruby1.9.3 #{node[:chub_sensu][:root_plugin_path]}/vmstat-metrics.rb --scheme hosts.:::name:::"
        handlers ["graphite_tcp"]
        subscribers ["all"]
        type "metric"
        interval 60
    end
end




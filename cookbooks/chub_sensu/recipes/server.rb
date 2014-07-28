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
if node[:chub_sensu].attribute?(:email)
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

remote_file "/usr/local/bin/rabbitmqadmin" do
    source "http://#{node[:hostname]}:15672/cli/rabbitmqadmin"
    action :create_if_missing
    owner "sensu"
    group "adm"
    mode "0754"
end

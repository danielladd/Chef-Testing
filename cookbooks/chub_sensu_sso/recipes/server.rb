#
# Cookbook Name:: chub_sensu_sso
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

%w{sensu-plugin mail redphone}.each do |gem_name|
    gem_package gem_name do
        action :install
        options "--no-rdoc --no-ri"
    end
end

handlerList = Array.new

## Email Handler
if node[:chub_sensu_sso].attribute?(:email) and node[:chub_sensu_sso][:email].attribute?(:recipient) 
    cookbook_file "/etc/sensu/handlers/mailer.rb" do
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
if node[:chub_sensu_sso].attribute?(:pagerduty) and node[:chub_sensu_sso][:pagerduty].attribute?(:api_key)
    cookbook_file "/etc/sensu/handlers/pagerduty.rb" do
        mode 0755
    end

    template "/etc/sensu/conf.d/pagerduty.json" do
        source "pagerduty.json.erb"
        mode 0644
    end

    sensu_handler "pagerduty" do
        type "pipe"
        command "/usr/bin/ruby1.9.3 /etc/sensu/handlers/pagerduty.rb"
    end

    handlerList << "pagerduty"
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
    interval 300
end

sensu_check "check-cpu" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-cpu.rb -c 90 -w 80"
    handlers ["default"]
    subscribers ["all"]
    interval 120
    additional(:occurrences => 5)
end

sensu_check "check-ram" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-ram.rb -c 5 -w 10"
    handlers ["default"]
    subscribers ["all"]
    interval 300
    additional(:occurrences => 2)
end

## SSO Checks
unless Chef::Config[:solo]
    ldap_nodes = partial_search(:node, "role:ldap AND chef_environment:#{node.chef_environment}", :keys => {'name' => ['name'], 'fqdn' => ['fqdn']} )
    if ldap_nodes.empty?
        Chef::Log.warn("No nodes with role ldap found in environment #{node.chef_environment}, skipping LDAP replication check")
    else
        sensu_check "check-openldap-syncrepl" do
            command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-syncrepl.rb --port 636 --base dc=vault,dc=commercehub,dc=com --retries 5 --user cn=searchrole,dc=vault,dc=commercehub,dc=com --password search --hosts #{ldap_nodes.collect { |it| it['fqdn'] }.join(',')}"
            handlers ["default"]
            subscribers ["monitor"]
            interval 60
            additional(:occurrences => 4)
        end
    end
end

if node[:chub_sensu_sso].attribute?(:loadbalancer_urls)
    node[:chub_sensu_sso][:loadbalancer_urls].each do |name, url|
        sensu_check "check-lb-#{name}" do
            command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb --url #{url} --response-code 200"
            handlers ["default"]
            subscribers ["monitor"]
            interval 60
            additional(:occurrences => 3)
        end
    end
end

sensu_check "check-vault-health" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb --url http://localhost:8081/healthcheck --response-code 200 --response-bytes 5000"
    handlers ["default"]
    subscribers ["vault"]
    interval 60
    additional(:occurrences => 3)
end

sensu_check "check-census-health" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb --url http://localhost:8081/healthcheck --response-code 200 --response-bytes 5000"
    handlers ["default"]
    subscribers ["census"]
    interval 60
    additional(:occurrences => 3)
end

sensu_check "check-castle-health" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb -s -k --url http://localhost:8080#{node[:chub_castle] && node[:chub_castle][:app_context]}/admin/healthcheck --response-code 200 --response-bytes 5000"
    handlers ["default"]
    subscribers ["castle"]
    interval 60
    additional(:occurrences => 3)
end

sensu_check "check-plaza-health" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb --url http://localhost:8081/healthcheck --response-code 200"
    handlers ["default"]
    subscribers ["plaza"]
    interval 60
    additional(:occurrences => 3)
end

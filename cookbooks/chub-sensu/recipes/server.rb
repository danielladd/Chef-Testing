#
# Cookbook Name:: chub-sensu
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

# TODO: investigate specialized handlers (mailer, irc, pagerduty)

# TODO: evaluate ChefNodesStatusChecker
# https://github.com/sensu/sensu-community-plugins/blob/master/plugins/chef/check-chef-nodes.rb

# TODO: review intervals

%w{sensu-plugin mail redphone}.each do |gem_name|
    gem_package gem_name do
        action :install
        options "--no-rdoc --no-ri"
    end
end

## Email Handler
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
	not_if do node['chub-sensu']['email']['recipient'].nil? end
end

## PagerDuty Handler
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
    command "/usr/bin/ruby1.9.3 /etc/sensu/handlers/pagerduty.rb"
end

## Default Handler
sensu_handler "default" do
	type "set"
	handlers ["email"]
	not_if do node['chub-sensu']['email']['recipient'].nil? end
end

## Standard Checks
sensu_check "check-disk" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-disk.rb"
    handlers ["default", "pagerduty"]
    subscribers ["all"]
    interval 60
end

sensu_check "check-cpu" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-cpu.rb -c 90 -w 70"
    handlers ["default", "pagerduty"]
    subscribers ["all"]
    interval 60
    additional(:occurrences => 2)
end

sensu_check "check-ram" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-ram.rb -c 5 -w 10"
    handlers ["default", "pagerduty"]
    subscribers ["all"]
    interval 60
    additional(:occurrences => 2)
end



## SSO Checks
# TODO: consider using chef search to eliminate the need for node names here; figure out how we handle chef-solo
# http://docs.opscode.com/dsl_recipe_method_search.html
sensu_check "check-openldap-syncrepl-ssodev1" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-syncrepl.rb --port 636 --base dc=vault,dc=commercehub,dc=com --retries 5 --user cn=searchrole,dc=vault,dc=commercehub,dc=com --password search --hosts ssodev1ldap1.nexus.commercehub.com,ssodev1ldap2.nexus.commercehub.com"
    handlers ["default"]
    subscribers ["monitor"]
    interval 60
    additional(:occurrences => 2)
end
sensu_check "check-openldap-syncrepl-ssoqa1" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-syncrepl.rb --port 636 --base dc=vault,dc=commercehub,dc=com --retries 5 --user cn=searchrole,dc=vault,dc=commercehub,dc=com --password search --hosts ssoqa1ldap1.nexus.commercehub.com,ssoqa1ldap2.nexus.commercehub.com"
    handlers ["default"]
    subscribers ["monitor"]
    interval 60
    additional(:occurrences => 2)
end

sensu_check "check-vault-lb-ssodev1" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb --url https://ssodev1-vault.nexus.commercehub.com:8443/info --response-code 200"
    handlers ["default"]
    subscribers ["monitor"]
    interval 60
    additional(:occurrences => 3)
end

sensu_check "check-vault-lb-ssoqa1" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb --url https://ssoqa1-vault.nexus.commercehub.com:8443/info --response-code 200"
    handlers ["default"]
    subscribers ["monitor"]
    interval 60
    additional(:occurrences => 3)
end

sensu_check "check-census-lb-ssodev1" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb --url https://ssodev1-census.nexus.commercehub.com:8443/info --response-code 200"
    handlers ["default"]
    subscribers ["monitor"]
    interval 60
    additional(:occurrences => 3)
end

sensu_check "check-census-lb-ssoqa1" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb --url https://ssoqa1-census.nexus.commercehub.com:8443/info --response-code 200"
    handlers ["default"]
    subscribers ["monitor"]
    interval 60
    additional(:occurrences => 3)
end

sensu_check "check-castle-lb-ssodev1" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb --url https://ssodev1-castle.nexus.commercehub.com/login --response-code 200"
    handlers ["default"]
    subscribers ["monitor"]
    interval 60
    additional(:occurrences => 3)
end

sensu_check "check-castle-lb-ssoqa1" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb --url https://ssodev1-castle.nexus.commercehub.com/login --response-code 200"
    handlers ["default"]
    subscribers ["monitor"]
    interval 60
    additional(:occurrences => 3)
end

sensu_check "check-plaza-lb-ssodev1" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb --url https://ssodev1-plaza.nexus.commercehub.com/buildInfo --response-code 200"
    handlers ["default"]
    subscribers ["monitor"]
    interval 60
    additional(:occurrences => 3)
end

sensu_check "check-plaza-lb-ssoqa1" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb --url https://ssodev1-plaza.nexus.commercehub.com/buildInfo --response-code 200"
    handlers ["default"]
    subscribers ["monitor"]
    interval 60
    additional(:occurrences => 3)
end


sensu_check "check-vault-health" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb --url http://localhost:8081/healthcheck --response-code 200 --response-bytes 5000"
    handlers ["default"]
    subscribers ["vault"]
    interval 60
    additional(:occurrences => 3)
end

sensu_check "check-castle-health" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb -s -k --url https://localhost:8443/login --response-code 200"
    handlers ["default"]
    subscribers ["castle"]
    interval 60
    additional(:occurrences => 3)
end

sensu_check "check-plaza-health" do
    command "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb --url http://localhost:8081/healthcheck --response-code 200 --response-bytes 5000"
    handlers ["default"]
    subscribers ["plaza"]
    interval 60
    additional(:occurrences => 3)
end

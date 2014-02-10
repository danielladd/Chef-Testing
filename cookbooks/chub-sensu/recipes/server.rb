#
# Cookbook Name:: chub-sensu
# Recipe:: default
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

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

%w{sensu-plugin mail}.each do |gem_name|
    gem_package gem_name do
        action :install
        options "--no-rdoc --no-ri"
    end
end

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
    command "mailer.rb"
end

sensu_handler "default" do
    type "set"
    handlers ["email"]
end

sensu_check "check-disk" do
    command "check-disk.rb"
    handlers ["default"]
    subscribers ["all"]
    interval 60
end

# TODO: consider using chef search to eliminate the need for node names here; figure out how we handle chef-solo
# http://docs.opscode.com/dsl_recipe_method_search.html
sensu_check "check-openldap-syncrepl-ssodev1" do
    command "check-syncrepl.rb --port 636 --base dc=vault,dc=commercehub,dc=com --retries 5 --user cn=searchrole,dc=vault,dc=commercehub,dc=com --password search --hosts ssodev1ldap1.nexus.commercehub.com,ssodev1ldap2.nexus.commercehub.com"
    handlers ["default"]
    subscribers ["monitor"]
    interval 60
    additional(:occurrences => 2)
end
sensu_check "check-openldap-syncrepl-ssoqa1" do
    command "check-syncrepl.rb --port 636 --base dc=vault,dc=commercehub,dc=com --retries 5 --user cn=searchrole,dc=vault,dc=commercehub,dc=com --password search --hosts ssoqa1ldap1.nexus.commercehub.com,ssoqa1ldap2.nexus.commercehub.com"
    handlers ["default"]
    subscribers ["monitor"]
    interval 60
    additional(:occurrences => 2)
end

sensu_check "check-vault-health" do
    command "check-http.rb --url http://localhost:8081/healthcheck --response-code 200 --response-bytes 5000"
    handlers ["default"]
    subscribers ["vault"]
    interval 60
    additional(:occurrences => 3)
end

sensu_check "check-castle-health" do
    command "check-http.rb -s -k --url https://localhost:8443/login --response-code 200"
    handlers ["default"]
    subscribers ["castle"]
    interval 60
    additional(:occurrences => 3)
end

sensu_check "check-plaza-health" do
    command "check-http.rb --url http://localhost:8081/healthcheck --response-code 200 --response-bytes 5000"
    handlers ["default"]
    subscribers ["plaza"]
    interval 60
    additional(:occurrences => 3)
end

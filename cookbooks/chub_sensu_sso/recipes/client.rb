#
# Cookbook Name:: chub_sensu_sso
# Recipe:: client
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "base"
include_recipe "sensu"

sensu_client node.name do
    address node.ipaddress
    subscriptions node.roles + ["all"]
end

%w{sensu-plugin net-ldap}.each do |gem_name|
    gem_package gem_name do
        action :install
        options "--no-rdoc --no-ri"
    end
end

%w{check-http check-disk check-syncrepl check-cpu check-ram check-procs}.each do |plugin|
    cookbook_file "/etc/sensu/plugins/#{plugin}.rb" do
        mode 0755
    end
end

include_recipe "sensu::client_service"

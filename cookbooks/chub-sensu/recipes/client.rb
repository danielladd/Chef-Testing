#
# Cookbook Name:: chub-sensu
# Recipe:: default
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "sensu"

sensu_client node.name do
    address node.ipaddress
    subscriptions node.roles + ["all"]
end

gem_package "sensu-plugin" do
    action :install
    options "--no-rdoc --no-ri"
end

remote_file "/etc/sensu/plugins/check-http.rb" do
    source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/http/check-http.rb"
    mode 0755
end

remote_file "/etc/sensu/plugins/check-disk.rb" do
    source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/system/check-disk.rb"
    mode 0755
end

include_recipe "sensu::client_service"

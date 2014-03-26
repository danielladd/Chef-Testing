#
# Cookbook Name:: chub_sensu_pipeline
# Recipe:: client
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "base"
include_recipe "sensu"

sensu_client node.name do
    address node[:ipaddress]
    subscriptions node[:roles] + ["all"]
end

%w{sensu-plugin net-ldap}.each do |gem_name|
    gem_package gem_name do
        action :install
        options "--no-rdoc --no-ri"
    end
end

remote_file "/etc/sensu/plugins/check-http.rb" do
    source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/http/check-http.rb"
    mode 0755
end

remote_file "/etc/sensu/plugins/check-disk.rb" do
    source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/system/check-disk.rb"
    mode 0755
end

remote_file "/etc/sensu/plugins/check-syncrepl.rb" do
    source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/openldap/check-syncrepl.rb"
    mode 0755
end

remote_file "/etc/sensu/plugins/check-cpu.rb" do
   source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/system/check-cpu.rb"
   mode 0755
end

remote_file "/etc/sensu/plugins/check-ram.rb" do
    source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/system/check-ram.rb"
    mode 0755
end

remote_file "/etc/sensu/plugins/check-procs.rb" do
    source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/processes/check-procs.rb"
    mode 0755
end

remote_file "/etc/sensu/plugins/vmstat-metrics.rb" do
    source "https://raw.githubusercontent.com/sensu/sensu-community-plugins/master/plugins/system/vmstat-metrics.rb"
    mode 0755
end

include_recipe "sensu::client_service"
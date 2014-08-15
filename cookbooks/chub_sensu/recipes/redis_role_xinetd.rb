#
# Cookbook Name:: chub_sensu
# Recipe:: redis_role_xinetd
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

directory "#{node[:chub_sensu][:redis][:check_redis_root]}" do
    action :create
end

cookbook_file "#{node[:chub_sensu][:redis][:check_redis_root]}/#{node[:chub_sensu][:redis][:check_redis_file]}" do
  source "#{node[:chub_sensu][:redis][:check_redis_file]}"
  mode "0777"
  action :create
end

include_recipe "xinetd"

template "/etc/xinetd.d/redischk" do
  source "xinetd.redis.erb"
  action :create
  notifies :restart, "service[xinetd]", :delayed
end

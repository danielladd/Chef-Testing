#
# Cookbook Name:: chub_elasticsearch
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
directory "/usr/local/var/data/snapshots" do
  owner "elasticsearch"
  group "elasticsearch"
  mode 00755
end

execute "sysctl_vm_max_map_count" do
  command "sysctl -w vm.max_map_count=#{node[:chub_elasticsearch][:vm_max_map_count]}"
  action :nothing
end

template "/etc/sysctl.d/90-elasticsearch.conf" do
  source "elasticsearch.sysctl.erb"
  variables({:vm_max_map_count => node[:chub_elasticsearch][:vm_max_map_count]})
  notifies :run, "execute[sysctl_vm_max_map_count]", :immediately
end

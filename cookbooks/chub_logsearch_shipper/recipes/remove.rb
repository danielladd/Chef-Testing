#
# Cookbook Name:: chub_logsearch_shipper
# Recipe:: remove
#
# Copyright 2014, CommerceTechnology, Inc
#
# All rights reserved - Do Not Redistribute
#

directory "c:/Program Files/logsearch-shipper" do
  action :nothing
  recursive true
end

execute 'uninstall_shipper' do
  cwd 'c:/Program Files/logsearch-shipper'
  command 'LogsearchShipper.Service.exe uninstall --sudo'
  only_if do File.exists?("c:/Program Files/logsearch-shipper/LogsearchShipper.Service.exe") end
  action :nothing
  notifies :delete, "directory[c:/Program Files/logsearch-shipper]", :immediately
end

service "logsearch_shipper_net" do
  supports :restart => true, :reload => true,  :status => true
  action [:disable, :stop]
  only_if { File.exists?("c:/Program Files/logsearch-shipper") }
  notifies :run, "execute[uninstall_shipper]",  :immediately 
end

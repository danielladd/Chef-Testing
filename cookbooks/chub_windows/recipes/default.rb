#
# Cookbook Name:: chub_windows
# Recipe:: default
#
# Copyright 2014, Commerce Technologies, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "windows"
include_recipe "java"

registry_key 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment' do
    values [{:name => 'JAVA_HOME', :type => :string, :data => node['java']['windows']['home']}]
    action :create
end

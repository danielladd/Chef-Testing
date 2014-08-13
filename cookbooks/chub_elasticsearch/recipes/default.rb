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

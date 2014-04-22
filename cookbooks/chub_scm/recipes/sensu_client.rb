#
# Cookbook Name:: chub_scm
# Recipe:: client
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "chub_sensu::client"

sensu_client node.name do
    address node[:ipaddress]
    subscriptions node[:roles] + ["scm_team"]
end
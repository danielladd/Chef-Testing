#
# Cookbook Name:: chub_sensu
# Recipe:: redis_slave
#
# Copyright (C) 2014 CommerceHub
#
# All rights reserved - Do Not Redistribute
#

master_node = Hash.new

if Chef::Config[:solo] or node[:chub_sensu][:test_run] == true
  #Define your data as attributes in vagrant
  master_node = { :address => node.sensu.redis.master.address, :port => node.sensu.redis.master.port }
else
  anode = search(:node, "role:sensu_redis_master").first
  master_node = { :address => anode.fqdn, :port => anode.redisio.servers[0].port }
end

log "Master Address -> #{master_node[:address]} Port -> #{master_node[:port]} " do
  level :info
end

node.override.redisio.servers = [{:port => node.sensu.redis.port, :slaveof => {:address => master_node[:address], :port => master_node[:port] } }]

include_recipe "redisio"
include_recipe "redisio::enable"
include_recipe "chub_sensu::redis_role_xinetd"

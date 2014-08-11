#
# Cookbook Name:: chub_sensu
# Recipe:: redis_sentinel
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

master_node = Hash.new
if Chef::Config[:solo]
  #Define your data as attributes in vagrant
  master_node = { :address => node.sensu.redis.master.address, :port => node.sensu.redis.master.port }
  
  quorum_count = node.sensu.redis.quorum_count
else
  masters = search(:node, "role:sensu_redis_master").first
  master_node = { :address => masters.ipaddress, :port => masters.redisio.servers[0].port }

  quorum_cout = search(:node, "role:sensu_redis_sentinel").count
end

log "Master Node -> #{master_node[:address]} and Quorum Count -> #{quorum_count}"  do
    level :info
end

node.default[:redisio][:sentinels] = [
    {
        "name" => "sensu",
        "master_ip" => "#{master_node[:address]}",
        "master_port" => "#{master_node[:port]}",
        "quorum_count" => "#{quorum_count}",
        "failover-timeout" => "5000",
        "down-after-milliseconds" => "60000"
    }
]

include_recipe "redisio::sentinel"
include_recipe "redisio::sentinel_enable"

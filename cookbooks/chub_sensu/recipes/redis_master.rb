#
# Cookbook Name:: chub_sensu
# Recipe:: redis_master
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

node.override.redisio.servers = [{:port => node.sensu.redis.port}]

include_recipe "redisio"
include_recipe "redisio::enable"
include_recipe "chub_sensu::redis_role_xinetd"
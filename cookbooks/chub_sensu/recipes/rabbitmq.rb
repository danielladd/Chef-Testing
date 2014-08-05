#
# Cookbook Name:: chub_sensu
# Recipe:: rabbitmq
#
# Copyright (C) 2014 CommerceHub
# 
# All rights reserved - Do Not Redistribute
#

cluster_disk_nodes = Array.new

if Chef::Config[:solo]
  node.rabbitmq.cluster_disk_nodes.each do |node|
    cluster_disk_nodes << "rabbit@#{node}"
    log "Cluster Node -> rabbit@#{node}"
  end
else
  nodes = search(:node, "role:sensu_mq")
  nodes.each  do |node|
      cluster_disk_nodes << "rabbit@#{node[:hostname]}"
      log "Cluster Node -> rabbit@#{node[:hostname]}"
  end
end


node.default.rabbitmq.cluster_disk_nodes = cluster_disk_nodes
log "FULL CLUSTER -> #{cluster_disk_nodes}"

include_recipe 'sensu::rabbitmq'
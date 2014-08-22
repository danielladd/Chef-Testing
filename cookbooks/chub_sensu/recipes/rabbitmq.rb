#
# Cookbook Name:: chub_sensu
# Recipe:: rabbitmq
#
# Copyright (C) 2014 CommerceHub
#
# All rights reserved - Do Not Redistribute
#

cluster_disk_nodes = Array.new

if Chef::Config[:solo] or node[:chub_sensu][:test_run] == true
  # Define the nodes in the cluster_disk_nodes attribute in your vagrant
else
  nodes = search(:node, "role:sensu_mq")
  nodes.each  do |node|
      cluster_disk_nodes << "rabbit@#{node[:hostname]}"
  end
end

node.default.rabbitmq.cluster_disk_nodes = cluster_disk_nodes

include_recipe 'sensu::rabbitmq'

rabbitmq_policy "ha-all" do
  pattern "^.*"
  params ({ "ha-mode" => "all" })
  priority 1
  action :set
end

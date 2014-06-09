#
# Cookbook Name:: chub_mc_logs
# Recipe:: default
#
# Copyright 2014, CommerceTechnology, Inc
#
# All rights reserved - Do Not Redistribute
#

group "chub_mc_logger" do
    action :create
    system true
end

user "chub_mc_logger" do
    comment "Application user for chub_mc_logger"
    gid "chub_mc_logger"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "chub_mc_logger" do
    action :modify
    append true
    members ["chub_mc_logger", "chadmin"]
end

execute "restart_rsyslog" do
  command "initctl restart rsyslog"
  action :nothing
end

logIsOn = false #define as truth value of whether logging should be on for machines running this recipe
if logIsOn 
  template "/etc/rsyslog.conf" do
    source "rsyslog.conf.erb"
    variables({
      :mcResource => node[:chub_mc_logs][:mc_resource],
      :logServer => node[:chub_mc_logs][:log_server]
    })
    owner "chub_mc_logger"
    group "chub_mc_logger"
    mode 0644
    action :create
    notifies :run, 'execute[restart_rsyslog]', :immediately
  end
else
  template "/etc/rsyslog.conf" do
    source "empty.conf.erb"
    owner "chub_mc_logger"
    group "chub_mc_logger"
    mode 0644
    action :create
    notifies :run, 'execute[restart_rsyslog]', :immediately
  end
end #end condition
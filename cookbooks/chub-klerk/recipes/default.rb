#
# Cookbook Name:: chub-klerk
# Recipe:: default
#
# Copyright (C) 2014 CommerceHub
#
# All rights reserved - Do Not Redistribute
#

include_recipe "sudo"

# Deployments may sometimes need to trigger a run of chef-client.
# In some contexts, such as a Bamboo deployment plan, it is easiest if using sudo for this command doesn't require re-authenticating.
# TODO: With chef-kick in place, is this still needed?
sudo "chef-client" do
    group "sudo"
    runas "root"
    nopasswd true
    commands ["/usr/bin/chef-client"]
end

sudo "admin" do
    group "admin"
    runas "ALL"
    nopasswd true
    commands ["ALL"]
end

include_recipe "chub_java::oracle8"

group "klerk" do
    action :create
    system true
end

user "klerk" do
    comment "Application user for Klerk"
    gid "klerk"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "klerk" do
    action :modify
    append true
    members ["klerk", "chadmin"]
end

directory "/opt/klerk" do
    owner "klerk"
    group "klerk"
    mode 0550
end

directory "/etc/opt/klerk" do
    owner "root"
    group "root"
    mode 0755
end

directory "/var/opt/klerk" do
    owner "klerk"
    group "klerk"
    mode 0770
end

directory "/var/log/klerk" do
    owner "klerk"
    group "klerk"
    mode 0770
end

template "/etc/opt/klerk/klerk.yml" do
    source "klerk.yml.erb"
    variables({
        "mongo_uri" => node["chub-klerk"]["mongo_uri"],
        "klerk_database_name" => node["chub-klerk"]["klerk_database_name"],
        "blobstore_database_name" => node["chub-klerk"]["blobstore_database_name"],
        "blobstore_mongo_uri" => node["chub-klerk"]["blobstore_mongo_uri"],
        "hazelcast_group_name" => node["chub-klerk"]["hazelcast_group_name"],
        "hazelcast_group_password" => node["chub-klerk"]["hazelcast_group_password"],
        "antivirus_hosts" => node["chub-klerk"]["antivirus_hosts"],
        "product_data_event_endpoints" => node["chub-klerk"]["product_data_event_endpoints"],
        "product_data_application_metadata_update_job_finished_event_endpoint" => node["chub-klerk"]["product_data_application_metadata_update_job_finished_event_endpoint"],
        "dead_product_data_application_metadata_update_job_finished_event_endpoint" => node["chub-klerk"]["dead_product_data_application_metadata_update_job_finished_event_endpoint"],
        "sprite_conductor_url" => node["chub-klerk"]["sprite_conductor_url"],
        "sprite_output_container_prefix" => node["chub-klerk"]["sprite_output_container_prefix"],
        "sprite_notification_id" => node["chub-klerk"]["sprite_notification_id"],
        "sprite_manifest_update_notification_endpoint" => node["chub-klerk"]["sprite_manifest_update_notification_endpoint"],
        "jms_provider_url" => node["chub-klerk"]["jms_provider_url"]
    })
    owner "root"
    group "klerk"
    mode 0640
    notifies "restart", "service[klerk]"
end

template "/etc/init/klerk.conf" do
    source "klerk.conf.erb"
    variables({
        "java_heap_size" => node["chub-klerk"]["java_heap_size"]
    })
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[klerk]"
end

remote_file "/opt/klerk/klerk-app.jar" do
    source node["chub-klerk"]["app_url"]
    #action :create_if_missing
    owner "klerk"
    group "klerk"
    mode 0440
    notifies "restart", "service[klerk]"
end

service "klerk" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end

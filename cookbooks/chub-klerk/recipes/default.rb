# Deployments may sometimes need to trigger a run of chef-client.
# In some contexts, such as a Bamboo deployment plan, it is easiest if using sudo for this command doesn't require re-authenticating.
# TODO: further discussion on making this part of the base configuration?
include_recipe "sudo"
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

include_recipe "java"

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
        "mongo_addresses" => node["chub-klerk"]["mongo_addresses"],
        "klerk_database_name" => node["chub-klerk"]["klerk_database_name"],
        "blobstore_database_name" => node["chub-klerk"]["blobstore_database_name"],
        "quartz_database_url" => node["chub-klerk"]["quartz_database_url"],
        "hazelcast_group_name" => node["chub-klerk"]["hazelcast_group_name"],
        "hazelcast_group_password" => node["chub-klerk"]["hazelcast_group_password"],
        "event_notification_endpoints" => node["chub-klerk"]["event_notification_endpoints"]
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
    owner "klerk"
    group "klerk"
    mode 0440
    notifies "restart", "service[klerk]"
end

service "klerk" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end

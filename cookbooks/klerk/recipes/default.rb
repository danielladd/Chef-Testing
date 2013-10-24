include_recipe "java"

directory "/var/log/klerk" do
end

directory "/opt/klerk" do
end

directory "/var/klerk" do
end

template "/etc/klerk.yml" do
    source "klerk.yml.erb"
    variables({
        "mongo_host" => node["klerk"]["mongo_host"],
        "mongo_port" => node["klerk"]["mongo_port"],
        "klerk_database_name" => node["klerk"]["klerk_database_name"],
        "blobstore_database_name" => node["klerk"]["blobstore_database_name"],
        "quartz_database_url" => node["klerk"]["quartz_database_url"]
    })
    notifies "restart", "service[klerk]"
end

template "/etc/init/klerk.conf" do
    source "klerk.conf.erb"
    variables({
        "java_heap_size" => node["klerk"]["java_heap_size"]
    })
    notifies "restart", "service[klerk]"
end

remote_file "/opt/klerk/klerk-app.jar" do
    source node["klerk"]["app_url"]
    notifies "restart", "service[klerk]"
end

service "klerk" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end

# TODO: support specifying java version via attribute
include_recipe "chub_java::oracle7"

group "app" do
    action :create
    system true
    append true
end

user "app" do
    comment "Application user"
    gid "app"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "app" do
    action :modify
    append true
    members ["app", "chadmin"]
end

directory "/opt/app" do
    owner "app"
    group "app"
    mode 0550
end

directory "/var/app" do
    owner "app"
    group "app"
    mode 0770
end

directory "/var/log/app" do
    owner "app"
    group "app"
    mode 0770
end

template "/etc/init/app.conf" do
    source "app.conf.erb"
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[app]"
end

remote_file "/opt/app/app.jar" do
    source node[:chub_app][:app_url]
    owner "app"
    group "app"
    mode 0440
    notifies "restart", "service[app]"
end

service "app" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end

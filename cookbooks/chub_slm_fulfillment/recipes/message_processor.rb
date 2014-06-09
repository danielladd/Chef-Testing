service_name 	= "slm_message_processor"
project_name    = "slm_fulfillment"
group_name      = project_name
user_name       = project_name

include_recipe "chub_slm_fulfillment::users_and_folders"

[
    {
        dest: "/etc/init/#{service_name}.conf",
        source: "#{service_name}.conf.erb",
        mode: 0644,
        restart: true
    },{
        dest: "/etc/#{project_name}/#{project_name}.conf",
        source: "application.conf.erb",
        action: :create_if_missing,
        mode: 0644,
        restart: true
    }
].each do |data|
    template data[:dest] do
        source data[:source]
        action :create     || data[:action]
        owner data[:owner] || "root"
        group data[:group] || "root"
        mode data[:mode]
        notifies "restart", "service[#{service_name}]" if data[:restart]
    end
end

remote_file "/opt/#{project_name}/#{project_name}.jar" do
	action :create_if_missing
    source node[:chub_slm_fulfillment][:jar_url]
    owner user_name
    group group_name
    mode 0440
    notifies "restart", "service[#{service_name}]"
end

service service_name do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end


# Stop All Services
# Purge Pacakage
# Rerun chef


service "sensu-client" do
    action [:stop, :disable]
end

service "sensu-server" do
    action [:stop, :disable]
end

service "sensu-api" do
    action [:stop, :disable]
end

execute "killall" do
  command "killall -u sensu -s 9"
  returns [0,1]
  action :run
end

package "sensu_remove" do
  package_name "sensu"
  action :purge
end

execute "cleanup" do
  command "rm -rf /etc/sensu && rm -rf /var/log/sensu"
  action :run
end

if not Chef::Config[:solo] then
    ruby_block "Remove recipe from run-list" do
        block do
            node.run_list.remove("recipe[chub_sensu::upgrade_service]")
        end
        only_if { node.run_list.include?("recipe[chub_sensu::upgrade_service]") }
    end
end

node.default[:sensu][:init_style] = "runit"

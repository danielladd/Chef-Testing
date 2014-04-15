#
# Cookbook Name:: chub-missioncontrol
# Recipe:: upgrade_landingstrip
#
# Copyright 2013, CommerceHub Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Forcefully install the latest landingstrip .war file from Bamboo, delete the landingstrip folder 
# directory, and then remove this recipe from the runlist

execute 'clear_tomcat_app_directory' do
	command "rm -fr #{node['tomcat']['webapp_dir']}/#{node['chub-missioncontrol']['app']['app_name']}"
	action :nothing
end

file "#{node['tomcat']['webapp_dir']}/#{node['chub-missioncontrol']['app']['app_name']}.war" do
	action :delete
end

remote_file "#{node['tomcat']['webapp_dir']}/#{node['chub-missioncontrol']['app']['app_name']}.war" do
	source "#{node['chub-missioncontrol']['app']['war_file_url']}/?os_username=#{node['chub-missioncontrol']['app']['bamboo_user']}&os_password=#{node['chub-missioncontrol']['app']['bamboo_password']}"
	owner "chub-missioncontrol"
	group "chub-missioncontrol"
	action :create	# This should pull the file down forcefully
	notifies :run, 'execute[clear_tomcat_app_directory]', :immediately
	notifies :restart, "service[tomcat]", :delayed
end

if not Chef::Config[:solo] then
	ruby_block "Remove Landingstrip Upgrade recipe from run-list" do
		block do
			node.run_list.remove("recipe[chub-missioncontrol::upgrade_landingstrip]")
		end
		only_if { node.run_list.include?("recipe[chub-missioncontrol::upgrade_landingstrip]") }
	end
end
#
# Cookbook Name: chub_artifactory
# Recipe:: default
#
# Copyright 2014, CommerceHub Inc.
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
include_recipe "chub_java::oracle7"

group "chub_#{node[:chub_artifactory][:app_name]}" do
    action :create
    system true
end

user "chub_#{node[:chub_artifactory][:app_name]}" do
    comment "Application user for chub_#{node[:chub_artifactory][:app_name]}"
    gid "chub_#{node[:chub_artifactory][:app_name]}"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "chub_#{node[:chub_artifactory][:app_name]}" do
    action :modify
    append true
    members ["chub_#{node[:chub_artifactory][:app_name]}", "chadmin"]
end

unless File.exists?("#{node[:chub_artifactory][:touchfile]}")

  directory node[:chub_artifactory][:staging_dir] do
    action :create
    owner "chub_#{node[:chub_artifactory][:app_name]}"
    group "chub_#{node[:chub_artifactory][:app_name]}"
    mode 0777
  end

  directory node[:chub_artifactory][:deploy_dir] do
    action :create
    owner "chub_#{node[:chub_artifactory][:app_name]}"
    group "chub_#{node[:chub_artifactory][:app_name]}"
    mode 0777
  end

 directory node[:chub_artifactory][:work_dir] do
    action :create
    owner "chub_#{node[:chub_artifactory][:app_name]}"
    group "chub_#{node[:chub_artifactory][:app_name]}"
    mode 0777
  end

  service "#{node[:chub_artifactory][:app_name]}" do
      provider Chef::Provider::Service::Upstart
      action [ "disable", "stop" ]
  end

  file "#{node[:chub_artifactory][:staging_dir]}/#{node[:chub_artifactory][:app_name]}.jar" do
      action   :delete
      mode     "0755"
      owner    "chub_#{node[:chub_artifactory][:app_name]}"
      group    "chub_#{node[:chub_artifactory][:app_name]}"
  end

  remote_file "#{node[:chub_artifactory][:staging_dir]}/#{node[:chub_artifactory][:app_name]}.jar" do
    source "#{node[:chub_artifactory][:jar_file_url]}"
    owner "chub_#{node[:chub_artifactory][:app_name]}"
    group "chub_#{node[:chub_artifactory][:app_name]}"
    action :create	# This should pull the file down forcefully
  end

  file "#{node[:chub_artifactory][:deploy_dir]}/#{node[:chub_artifactory][:app_name]}.jar" do
      action   :delete
      mode     "0755"
      owner    "chub_#{node[:chub_artifactory][:app_name]}"
      group    "chub_#{node[:chub_artifactory][:app_name]}"
  end

  remote_file "Copy deploy jar file from staging" do 
    path "#{node[:chub_artifactory][:deploy_dir]}/#{node[:chub_artifactory][:app_name]}.jar"
    source "file://#{node[:chub_artifactory][:staging_dir]}/#{node[:chub_artifactory][:app_name]}.jar"
    owner "chub_#{node[:chub_artifactory][:app_name]}"
    group "chub_#{node[:chub_artifactory][:app_name]}"
    mode 0755
  end

  if node[:chub_artifactory][:jmx_on]
    template "/etc/init/#{node[:chub_artifactory][:app_name]}.conf" do
      source "appjmx.conf.erb"
      owner "root"
      group "root"
      mode 0644
      notifies "restart", "service[#{node[:chub_artifactory][:app_name]}]"
    end
  else
      template "/etc/init/#{node[:chub_artifactory][:app_name]}.conf" do
      source "app.conf.erb"
      owner "root"
      group "root"
      mode 0644
      notifies "restart", "service[#{node[:chub_artifactory][:app_name]}]"
    end
  end #end condition 

  service "#{node[:chub_artifactory][:app_name]}" do
      provider Chef::Provider::Service::Upstart
      action [ "enable", "start" ]
  end

  file node[:chub_artifactory][:touchfile] do
      action   :create
      mode     "0755"
      owner    "chub_#{node[:chub_artifactory][:app_name]}"
      group    "chub_#{node[:chub_artifactory][:app_name]}"
  	content  "deployed"
  end

  file node[:chub_artifactory][:touchfile] do
      action   :touch
      mode     "0755"
      owner    "chub_#{node[:chub_artifactory][:app_name]}"
      group    "chub_#{node[:chub_artifactory][:app_name]}"
  end

end#close unless block

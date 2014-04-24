#
# Cookbook Name:: chub_onboarding_webservice
# Recipe:: batchagent
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

group "onboarding_webservice" do
    action :create
    system true
end

user "onboarding_webservice" do
    comment "Application user for onboarding_webservice"
    gid "onboarding_webservice"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "onboarding_webservice" do
    action :modify
    append true
    members ["onboarding_webservice", "chadmin"]
end

directory node["chub_onboarding_webservice"]["stagingDir"] do
  action :create
  owner "onboarding_webservice"
  group "onboarding_webservice"
  mode 0550
end

directory node["chub_onboarding_webservice"]["deployDir"] do
  action :create
  owner "onboarding_webservice"
  group "onboarding_webservice"
  mode 0550
end

remote_file "#{node["chub_onboarding_webservice"]["deployDir"]}/#{node["chub_onboarding_webservice"]["jarName"]}" do
  source node["chub_onboarding_webservice"]["deployJarUrl"]
  notifies :run, "template[/etc/init/onboarding_webservice.conf]"	
end

template "/etc/init/onboarding_webservice.conf" do
    source "onboarding_webservice.conf.erb"
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[onboarding_webservice]", :delayed
end

link "/etc/onboarding_webservice" do
  to "#{node["chub_onboarding_webservice"]["deployDir"]}/config"
end

link "/var/log/onboarding_webservice" do
  to "#{node["chub_onboarding_webservice"]["deployDir"]}/log"
end

service "onboarding_webservice" do
    provider Chef::Provider::Service::Upstart
    action [ "enable", "start" ]
end


#
# Cookbook Name:: chub_commscontrolcenter
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

# hostsfile_entry '10.10.30.116' do
#   hostname  'appagent01.commercehub.com'
# end

# hostsfile_entry '10.10.30.116' do
#   hostname  'appagent01'
# end

# hostsfile_entry '10.30.3.30' do
#   hostname  'appagent30a.commercehub.com'
# end

# hostsfile_entry '10.30.3.30' do
#   hostname  'appagent30a'
# end

group "commscontrolcenter" do 
	action :create
	system true
	append true
end

user "commscontrolcenter" do
	comment "Application user for CommsControlCenter"
	gid "commscontrolcenter"
	system true
end

user "chadmin" do
end

group "commscontrolcenter" do
	action :modify
	append true
	members ["commscontrolcenter", "chadmin"]
end

directory "/opt/commscontrolcenter" do
	owner "commscontrolcenter"
	group "commscontrolcenter"
	mode 0550
end

directory "/etc/commscontrolcenter" do
	owner "root"
	group "commscontrolcenter"
	mode 0755
end

directory "/var/commscontrolcenter" do
	owner "commscontrolcenter"
	group "commscontrolcenter"
	mode 0770
end

directory "/var/log/commscontrolcenter" do
	owner "commscontrolcenter"
	group "commscontrolcenter"
	mode 0770
end

template "/etc/commscontrolcenter/controlcenter-config.groovy" do
	source "controlcenter-config.groovy.erb"
	owner "root"
	group "commscontrolcenter"
	mode 0640
	notifies "restart", "service[commscontrolcenter]"
end

template "/etc/init/commscontrolcenter.conf" do
    source "commscontrolcenter.conf.erb"
    owner "root"
    group "root"
    mode 0644
    notifies "restart", "service[commscontrolcenter]"
end

remote_file "/opt/commscontrolcenter/commscontrolcenter.jar" do
	source "http://bamboom1:8085/browse/FTG-CMC-120/artifact/shared/CommsControlCenter-Prod/commscontrolcenter.jar?os_username=mess&os_password=messuser"
	owner "commscontrolcenter"
	group "commscontrolcenter"
	mode 0440
	notifies "restart", "service[commscontrolcenter]"
end

service "commscontrolcenter" do
	provider Chef::Provider::Service::Upstart
	action [ "enable", "start" ]
end


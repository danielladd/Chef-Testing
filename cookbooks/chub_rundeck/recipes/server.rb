#
# Cookbook Name:: chub_rundeck
# Recipe:: server
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

include_recipe "rundeck::default"

directory "/var/lib/rundeck/.ssh" do
    action :create
    owner 'rundeck'
    group 'rundeck'
    mode 00744
end 

file "/var/lib/rundeck/.ssh/id_rsa" do
    action :create
    owner 'rundeck'
    group 'rundeck'
    mode 00600
    content node[:rundeck][:ssh][:private_key]
end

# TODO: Create necessary directory structure if not present? 
node[:chub_rundeck][:resources].each do |project, nodes|
  template "/var/rundeck/projects/#{project}/etc/resources.xml" do
    source "resources.xml.erb"
    mode 0440
    owner "rundeck"
    group "rundeck"
    variables({
       :nodes => node[:chub_rundeck][:resources]["#{project}"]
    })
  end
end

cookbook_file "/etc/rundeck/jaas-ldap.conf" do
  source "jaas-ldap.conf"
  mode 00644
  owner "rundeck"
  group "rundeck"
end
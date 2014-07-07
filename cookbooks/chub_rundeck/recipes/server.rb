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

# Using unwind as an alternative
# https://github.com/bryanwb/chef-rewind#unwind



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

cookbook_file "/etc/krb5.conf" do
  source  "krb5.conf"
  owner   "root"
  mode    00644
end

#TODO: Consider using LWRP rundeck_plugin
remote_file "/var/lib/rundeck/libext/rundeck-winrm-plugin-1.1.jar" do
  source    node[:chub_rundeck][:winrm_plugin_url]
  owner     "root"
  group     "root"
  notifies  :restart, "service[rundeckd]", :delayed
end

cookbook_file "/etc/rundeck/jaas-ldap.conf" do
  source "jaas-ldap.conf"
  mode 00644
  owner "rundeck"
  group "rundeck"
  notifies   :restart, "service[rundeckd]", :delayed
end

cookbook_file "/etc/rundeck/admin.aclpolicy" do
  source "admin.aclpolicy"
  mode 00644
  owner "rundeck"
  group "rundeck"
  notifies   :restart, "service[rundeckd]", :delayed
end

cookbook_file "/var/lib/rundeck/exp/webapp/WEB-INF/web.xml" do
  source "web.xml"
  mode 00644
  owner "root"
  group "root"
  notifies   :restart, "service[rundeckd]", :delayed
end

link "/etc/nginx/sites-enabled/000-default" do
    action :delete
    only_if "test -L /etc/nginx/sites-enabled/000-default"
end

include_recipe "rundeck::proxy"
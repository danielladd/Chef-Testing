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

directory node[:chub_rundeck][:rundeck_ssh_path] do
  action    :create
  owner     node[:chub_rundeck][:rundeck_user]
  group     node[:chub_rundeck][:rundeck_group]
  mode      00744
end 

file "#{node[:chub_rundeck][:rundeck_ssh_path]}/id_rsa" do
  action     :create
  owner      node[:chub_rundeck][:rundeck_user]
  group      node[:chub_rundeck][:rundeck_group]
  mode       00600
  content    node[:rundeck][:ssh][:private_key]
end

node[:chub_rundeck][:resources].each do |project, nodes|
  directory "#{node[:chub_rundeck][:root_project_path]}/#{project}/etc/" do
    recursive    true
    action       :create 
  end

  template "#{node[:chub_rundeck][:root_project_path]}/#{project}/etc/resources.xml" do
    source    "resources.xml.erb"
    mode      0440
    owner     node[:chub_rundeck][:rundeck_user]
    group     node[:chub_rundeck][:rundeck_group]
    variables({
       :nodes => node[:chub_rundeck][:resources]["#{project}"]
    })
  end
end

cookbook_file "/etc/krb5.conf" do
  source    "krb5.conf"
  owner     "root"
  mode      00644
end

rundeck_plugin 'rundeck-winrm-plugin-1.1.jar' do
  url         node[:chub_rundeck][:winrm_plugin_url]
  notifies    :restart, "service[rundeckd]", :delayed
end

package "libmysql-java"

link "/var/lib/rundeck/bootstrap/mysql-connector-java-5.1.31-bin.jar" do
  action     :create
  to         "/usr/share/java/mysql.jar"
  only_if    "test -e /usr/share/java/mysql.jar"
end

template "#{node[:chub_rundeck][:rundeck_config_path]}/rundeck-config.properties" do
  source      'rundeck-config.properties.erb'
  owner       node[:chub_rundeck][:rundeck_user]
  group       node[:chub_rundeck][:rundeck_group]
  mode        00644
  notifies    :restart, 'service[rundeckd]'
end

cookbook_file "#{node[:chub_rundeck][:rundeck_config_path]}/jaas-ldap.conf" do
  source      "jaas-ldap.conf"
  mode        00644
  owner       node[:chub_rundeck][:rundeck_user]
  group       node[:chub_rundeck][:rundeck_group]
  notifies    :restart, "service[rundeckd]", :delayed
end

cookbook_file "#{node[:chub_rundeck][:rundeck_config_path]}/admin.aclpolicy" do
  source      "admin.aclpolicy"
  mode        00644
  owner       node[:chub_rundeck][:rundeck_user]
  group       node[:chub_rundeck][:rundeck_group]
  notifies    :restart, "service[rundeckd]", :delayed
end

cookbook_file "/var/lib/rundeck/exp/webapp/WEB-INF/web.xml" do
  source      "web.xml"
  mode        00644
  owner       "root"
  group       "root"
  notifies    :restart, "service[rundeckd]", :delayed
end

link "/etc/nginx/sites-enabled/000-default" do
  action     :delete
  only_if    "test -L /etc/nginx/sites-enabled/000-default"
end

include_recipe "rundeck::proxy"
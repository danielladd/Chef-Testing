#
# Cookbook Name:: chub-hornetq
# Recipe:: hub
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

group "hornetq" do
  action  :create
  system  true
end

user "hornetq" do
  comment  "Application user for hornetq"
  gid      "hornetq"
  system   true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "hornetq" do
  action   :modify
  append   true
  members  ["hornetq", "chadmin"]
end

unless File.exists?("#{node['chub-hornetq']['touchfile']}")

  directory node['chub-hornetq']['staging_dir'] do
    action   :create
    owner    "hornetq"
    group    "minions"
    mode     0771
  end

  directory node['chub-hornetq']['app_dir'] do
    action   :create
    owner    "hornetq"
    group    "minions"
    mode     0771
  end

  execute "delete property file" do
    command   "rm #{node['chub-hornetq']['staging_dir']}/#{node['chub-hornetq']['deploy_prop']}"
    action    :nothing
    only_if   { ::File.exists?("#{node['chub-hornetq']['staging_dir']}/#{node['chub-hornetq']['deploy_prop']}") }
  end

  prop_file = "#{node['chub-hornetq']['staging_dir']}/#{node['chub-hornetq']['deploy_prop']}"

  remote_file "#{node['chub-hornetq']['staging_dir']}/#{node['chub-hornetq']['jar_name']}" do
    source    node['chub-hornetq']['deploy_jar_url']
    owner     "hornetq"
    group     "minions"
    #notifies :create, "template[#{prop_file}]"	
    notifies  :run, "execute[delete property file]", :immediately
  end

  template prop_file do
    source     "deploy.properties.erb"
    owner      "hornetq"
    group      "minions"
    mode       0765
    action     :create_if_missing
    #TODO: This does not properly notify or re-execute deploy after property file is updated
    notifies   :run, "execute[deploy]", :immediately
  end

  execute "deploy" do
    command    "java -jar #{node['chub-hornetq']['staging_dir']}/#{node['chub-hornetq']['jar_name']} -d #{prop_file}"
    creates    "#{node['chub-hornetq']['app_dir']}/config/jndi.properties"
    cwd        node['chub-hornetq']['staging_dir']
    action     :nothing
    user       "hornetq"
    group      "minions" 
    umask      003
    notifies   :restart, "service[hornetq]", :delayed
  end

  # Update file permissions to allow execute access
  file "#{node['chub-hornetq']['app_dir']}/bin/hornetq" do
    mode   "0755"
    action :touch
  end

  file "#{node['chub-hornetq']['app_dir']}/bin/wrapper" do
    mode   "0755"
    action :touch
  end

  execute "installService" do
    command   "./hornetq install"
    cwd       "#{node['chub-hornetq']['app_dir']}/bin"
    creates   "/etc/rc0.d/K20hornetq"
    action    :run
    #TODO - THIS
    # not_if { ::File.exists?()}
  end

  link "/etc/hornetq" do
    to "#{node['chub-hornetq']['app_dir']}/config"
  end

  link "/var/log/hornetq" do
    to "#{node['chub-hornetq']['app_dir']}/logs"
  end

  service "hornetq" do
    action [ :start ]
  end

  file node['chub-hornetq']['touchfile'] do
    action   :touch
    mode     "0755"
    owner    hornetq
    group    minions
  end

end
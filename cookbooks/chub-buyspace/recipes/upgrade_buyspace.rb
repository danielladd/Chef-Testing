#
# Cookbook Name:: chub-buyspace
# Recipe:: upgrade_buyspace
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

# Forcefully install the latest buyspace .war file from Bamboo, delete the ROOT 
# directory, and then remove this recipe from the runlist

template "#{node["tomcat"]["config_dir"]}/server.xml" do
  source "tomcat_server.xml.erb"
  owner "tomcat7"
  group "tomcat7"
  mode 0770
  notifies :restart, "service[tomcat7]", :delayed
end
  
template "#{node['chub-buyspace']['config_dir']}/#{node['chub-buyspace']['buyspace_conf']}" do
  source "buyspace-config.groovy.erb"
  owner "tomcat7"
  group "tomcat7"
  mode 0775
  notifies :restart, "service[tomcat7]", :delayed
end

template "#{node['chub-buyspace']['config_dir']}/#{node['chub-buyspace']['logging_conf']}" do
  source "logging.properties.erb"
  owner "tomcat7"
  group "tomcat7"
  mode 0770
  notifies :restart, "service[tomcat7]", :delayed
end

template "/etc/chadmin/check_up.sh" do
  source "check_up.sh.erb"
  owner "chadmin"
  group "chadmin"
  mode 0770
end

template "/etc/tomcat7/Catalina/localhost/static-images.xml" do
  source "static-images.xml.erb"
  owner "tomcat7"
  group "tomcat7"
  mode 0770
end

remote_file  "#{node['chub-buyspace']['data_dir']}/#{node['chub-buyspace']['staged_war_name']}" do
  source "http://mpbamboo.nexus.commercehub.com/browse/BS-BSM-292/artifact/shared/buyspace.war/buyspace.war"
  owner "tomcat7"
  group "tomcat7"
  action :create  # This should pull the file down forcefully
  notifies :run, 'execute[clear_tomcat_app_directory]', :immediately
  notifies :restart, "service[tomcat7]", :delayed
end

trigger_file = "/#{node['chub-buyspace']['data_dir']}/#{node['chub-buyspace']['staged_war_name']}"
service "tomcat7" do
    action [ "stop" ]
    only_if { File.exists?(trigger_file) }
end

execute 'clear_tomcat_app_directory' do
  command "rm -fr #{node['chub-buyspace']['app_dir']}/ROOT"
  action :nothing
  only_if { File.exists?(trigger_file) }
end

file "#{node['chub-buyspace']['app_dir']}/ROOT.war" do
  action :delete
  only_if { File.exists?(trigger_file) }
end

remote_file "#{node['chub-buyspace']['app_dir']}/ROOT.war" do
    source "file://#{node['chub-buyspace']['data_dir']}/#{node['chub-buyspace']['staged_war_name']}"
    owner "tomcat7"
    group "tomcat7"
    mode 0775
    notifies :run, 'execute[clear_tomcat_app_directory]', :immediately
    only_if { File.exists?(trigger_file) }
end

service "tomcat7" do
    action [ "start" ]
    only_if { File.exists?(trigger_file) }
end

file trigger_file do
  action :delete
  only_if { File.exists?(trigger_file) }
end
    
    
   
    
    
    
    
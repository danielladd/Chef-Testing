#
# Cookbook Name:: chub-buyspace
# Recipe:: buyspace
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

=begin
Using http://mpwiki01.nexus.commercehub.com/display/bs/Setting+Up+A+QA+Environment
as a starting point for this cookbook.
=end

group "#{node['chub-buyspace']['group']}" do
	action :create
	system true
end

user "#{node['chub-buyspace']['user']}" do
	comment "Application user for buyspace"
	gid "#{node['chub-buyspace']['group']}"
	system true
end

directory "#{node['chub-buyspace']['config_dir']}" do
	owner "root"
	group "#{node['chub-buyspace']['group']}"
	mode 0755
end

directory "#{node['chub-buyspace']['app_dir']}" do
	owner "#{node['chub-buyspace']['user']}"
	group "#{node['chub-buyspace']['group']}"
	mode 0774
end

directory "#{node['chub-buyspace']['log_dir']}" do
	owner "#{node['chub-buyspace']['user']}"
	group "#{node['chub-buyspace']['group']}"
	mode 0774
end

directory "#{node['chub-buyspace']['data_dir']}" do
	owner "#{node['chub-buyspace']['user']}"
	group "#{node['chub-buyspace']['group']}"
	mode 0774
end

directory "#{node['chub-buyspace']['temp_dir']}" do
	owner "tomcat#{node['tomcat']['base_version']}"
	group "#{node['chub-buyspace']['group']}"
	mode 0775
end

template "#{node['chub-buyspace']['config_dir']}/#{node['chub-buyspace']['buyspace_conf']}" do
	source "buyspace-config.groovy.erb"
	mode 0554
	owner "#{node['chub-buyspace']['user']}"
	group "#{node['chub-buyspace']['group']}"
	notifies :restart, "service[tomcat]", :delayed
end

template "#{node['chub-buyspace']['config_dir']}/#{node['chub-buyspace']['logging_conf']}" do
	source "logging.properties.erb"
	mode 0554
	owner "#{node['chub-buyspace']['user']}"
	group "#{node['chub-buyspace']['group']}"
	notifies :restart, "service[tomcat]", :delayed
end

execute 'clear_tomcat_app_directory' do
	command "rm -fr #{node['chub-buyspace']['app_dir']}/ROOT"
	action :nothing
end

remote_file "#{node['chub-buyspace']['app_dir']}/ROOT.war" do
	source "http://mpbamboo.nexus.commercehub.com/browse/BS-BSM/latestSuccessful/artifact/shared/buyspace.war/buyspace.war"
	owner "#{node['chub-buyspace']['user']}"
	group "#{node['chub-buyspace']['group']}"
	action :create_if_missing
	notifies :run, 'execute[clear_tomcat_app_directory]', :immediately
	notifies :restart, "service[tomcat]", :delayed
end



=begin
TODO:
- buyspace_app
	-deployed file changes?
		-does it need checksumming?
=end
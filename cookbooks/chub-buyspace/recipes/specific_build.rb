#
# Cookbook Name:: chub-buyspace
# Recipe:: specific_build
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

# Forcefully install a specific build, based on that build number. This will
# likely be most valuable should a rollback be needed.  Copy from the
# upgrade_buyspace recipe




execute 'clear_tomcat_app_directory' do
	command "rm -fr #{node['chub-buyspace']['app_dir']}/ROOT"
	action :nothing
end

file "#{node['chub-buyspace']['app_dir']}/ROOT.war" do
	action :delete
end

remote_file "#{node['chub-buyspace']['app_dir']}/ROOT.war" do
	source "http://mpbamboo.nexus.commercehub.com/browse/BS-BSM-#{ node['chub-buyspace']['install_specific_build'] }/artifact/shared/buyspace.war/buyspace.war"
	owner "#{node['chub-buyspace']['user']}"
	group "#{node['chub-buyspace']['group']}"
	action :create	# This should pull the file down forcefully
	#notifies :delete, "directory[#{node['chub-buyspace']['app_dir']}/ROOT]", "immediately", recursive true
	notifies :run, 'execute[clear_tomcat_app_directory]', :immediately
	#notifies :restart "service[tomcat7]", :delayed
end
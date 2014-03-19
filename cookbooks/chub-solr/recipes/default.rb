#
# Cookbook Name:: chub-solr
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

node.set['java']['install_flavor']							= 'oracle'
node.set['java']['oracle']['accept_oracle_download_terms']	= true
node.set['java']['jdk_version']								= 7

node.set['tomcat']['base_version']	= 7
node.set['tomcat']['loglevel']		= 'WARN'	# default is 'INFO'

# override_attributes(
#   'tomcat' => {
#     'java_options' => "${JAVA_OPTS} -Xmx128M -Djava.awt.headless=true -Dsolr.solr.home=#{node['chub-solr']['home']}/solr/cores"
#   }
# )
node.set['tomcat']['catalina_options'] = "-Dsolr.solr.home=#{node['chub-solr']['cores_dir']}"
#node.set['tomcat']['catalina_options'] = " -Dsolr.solr.home=#{node['chub-solr']['base']}"
node.set['tomcat']['port'] = "8983"

if node[:instance_role] == 'vagrant'
#if Chef::Config[:solo]
	node.set["tomcat"]["keystore_password"]		= 'throwawaypassword'
	node.set["tomcat"]["truststore_password"]	= 'throwawaypassword'
end

include_recipe "java"
include_recipe "tomcat"


# Packaged Prereqs
%w{
	unzip
}.each do |pkg|
	package pkg do
		action :install
	end
end


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

node.normal['tomcat']['base_version']	= 7
node.normal['tomcat']['loglevel']		= 'WARN'	# default is 'INFO'
node.normal['tomcat']['catalina_options'] = "-Dsolr.solr.home=#{node['chub-solr']['cores_dir']}"
node.normal['tomcat']['port'] = "8983"

if node[:instance_role] == 'vagrant'
	node.normal["tomcat"]["keystore_password"]		= 'throwawaypassword'
	node.normal["tomcat"]["truststore_password"]	= 'throwawaypassword'
end

include_recipe "chub_java::oracle7"
include_recipe "tomcat"

# Packaged Prereqs
%w{
	unzip
}.each do |pkg|
	package pkg do
		action :install
	end
end


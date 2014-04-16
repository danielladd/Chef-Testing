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

node.default['tomcat']['base_version']		= 7
node.default["tomcat"]["config_dir"]		= "/etc/tomcat#{node["tomcat"]["base_version"]}"
node.default['tomcat']['loglevel']			= 'WARN'	# default is 'INFO'
node.default['tomcat']['port']				= node['chub-solr']['port']
node.default['tomcat']['catalina_options']	= "-Dsolr.solr.home=#{node['chub-solr']['base']}"

if node[:instance_role] == 'vagrant'
	node.set["tomcat"]["keystore_password"]		= 'throwawaypassword'
	node.set["tomcat"]["truststore_password"]	= 'throwawaypassword'
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


#
# Cookbook Name:: chub-hornetq
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


# Enforcing needed settings, but these should be applied at the Role level
node.set['java']['install_flavor'] = 'oracle'
node.set['java']['oracle']['accept_oracle_download_terms'] = true
node.set['java']['jdk_version'] = 7

node.set['tomcat']['base_version'] = 7
node.set['tomcat']['loglevel'] = 'WARN'		# default is 'INFO'

#if node[:instance_role] == 'vagrant'
if Chef::Config[:solo]
	node.set["tomcat"]["keystore_password"] = 'throwawaypassword'
	node.set["tomcat"]["truststore_password"] = 'throwawaypassword'
end

include_recipe "java"
include_recipe "tomcat"

# Packaged Prereqs
%w{
	libaio1
}.each do |pkg|
	package pkg do
		action :install
	end
end

# # if local file cache is not available, download from internet
# uri = URI(url)
# request = Net::HTTP.new uri.host
# response = request.request_head uri.path
# if response.code.to_i == 200
# 	# use local http
# else
# 	# use jboss.org site
# 	# consider throwing a warning
# end


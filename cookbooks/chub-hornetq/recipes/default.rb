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


include_recipe "java"


# Packaged Prereqs
%w{
	libaio1
	unzip
}.each do |pkg|
	package pkg do
		action :install
	end
end


# TODO:
# - Test for internally-cached hornetq download in buyspace.rb

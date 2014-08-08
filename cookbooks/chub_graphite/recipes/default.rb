#
# Cookbook Name:: chub_graphite
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

node.normal[:graphite][:web][:debug]	= "True"

include_recipe 'graphite'

# This can be removed when this pull request is accepted:
#	https://github.com/hw-cookbooks/graphite/pull/171
if node['graphite']['web']['ldap']['SERVER'].length > 0
	package 'python-ldap' do
		action :install
	end
end

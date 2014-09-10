#
# Cookbook Name: chub_orderstream_iis
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

include_recipe "iis"

iis_pool 'DefaultAppPool' do
	pool_name "DefaultAppPool"
	action :config
	thirty_two_bit node[:chub_orderstream_iis][:default_app_pool_config][:enable_32_bit]
	runtime_version node[:chub_orderstream_iis][:default_app_pool_config][:managed_runtime_version ]
end

iis_site 'Default Web Site' do
	site_name "Default Web Site"
	action :delete
	application_pool "DefaultAppPool"
end

iis_site 'OrderStream' do
	site_name node[:chub_orderstream_iis][:orderstream_site_name]
	action :add
	path node[:chub_orderstream_iis][:orderstream_site_root]
	application_pool "DefaultAppPool"
end

iis_config "/site.name:#{node[:chub_orderstream_iis][:orderstream_site_name]} /+bindings.[protocol='#{node[:chub_orderstream_iis][:orderstream_site_protocol]}',bindingInformation='#{node[:chub_orderstream_iis][:orderstream_site_ip_address]}:#{node[:chub_orderstream_iis][:orderstream_site_port}:']" do
	action :config
end	

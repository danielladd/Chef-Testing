#
# Cookbook Name:: chub-solr
# Recipe:: buyspace
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

include_recipe "chub-solr"

#check the filenames & path on this
execute 'Extract_SOLR_Tarball' do
	command "tar -zxvf #{node['chub-solr']['base_dir']}/solr-#{node['chub-solr']['version']}.tar.gz -C #{node['chub-solr']['base_dir']}"
	action :nothing
end

#check the filenames & paths
execute 'Extract_SOLR_Config_Zip' do
	command "unzip #{node['chub-solr']['base_dir']}/solr.zip -d #{node['chub-solr']['config_dir']}"
	# command "echo 'I'm totally extracting that thing you wanted now...'"
	action :nothing
end

directory "#{node['chub-solr']['config_dir']}" do
	action :create
end

directory "#{node['chub-solr']['base_dir']}" do
	action :create
end

# look at the chub-hornetq::buyspace.rb:~54 and chub-buyspace
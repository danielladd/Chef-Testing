#
# Cookbook Name:: chub_tomcat
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


case node['platform_family']
when "windows"
	windows_package "tomcat" do
	action :install
	source 'http://artifactory01/artifactory/webapp/browserepo.html?pathId=tomcat-distributions:apache-tomcat/apache-tomcat/7.0.42/apache-tomcat-7.0.42.exe'
else
  include_recipe 'tomcat::default'
end

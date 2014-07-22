#
# Cookbook Name:: chub_nxlog
# Recipe:: client
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
when "debian", "ubuntu"
  node.default.chub_nxlog.root_path = "/usr/lib/nxlog"

  package node[:chub_nxlog][:package_name] do
    version    node[:chub_nxlog][:package_version]
    action     :install
  end
when "windows"
  node.default.chub_nxlog.root_path = "C:\\Program Files (x86)\\nxlog"

  # Figure out how to install on windows
  # MSI?
end

path = ""
node[:chub_nxlog][:logfiles].each do |log|
    path << " #{log.type},"
end
path << " => logstash"

template "#{node[:chub_nxlog][:config_directory]}/nxlog.conf" do 
  source    node[:chub_nxlog][:template_file]
  action    :create
  variables({
    :endpoint => node[:chub_nxlog][:endpoint],
    :port => node[:chub_nxlog][:endpoint_port],
    :logfiles => node[:chub_nxlog][:logfiles],
    :route_path => path,
    :cafile => "#{node[:chub_nxlog][:root_path]}/#{node[:chub_nxlog][:logstash_cert]}"
  })
end
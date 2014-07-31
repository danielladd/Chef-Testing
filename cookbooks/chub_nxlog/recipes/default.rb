#
# Cookbook Name:: chub_nxlog
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
path = String.new
logFileArray = Array.new

case node['platform_family']
when "ubuntu"
  node.default.chub_nxlog.root_path = "/usr/lib/nxlog"
  node.default.chub_nxlog.config_directory = "/etc/nxlog" 
  apt_package "libapr1" do
    action :install
  end
  apt_package "libdbi1" do
    action :install
  end
  apt_package "libperl5.14" do
    action :install
  end
  remote_file "#{Chef::Config[:file_cache_path]}/nxlog-ce.deb" do
    checksum node[:chub_nxlog][:checksum]["#{node[:chub_nxlog][:package_name]}-#{node[:chub_nxlog][:package_version]}_amd64.ubuntu.deb"]
    source "http://artifactory01.nexus.commercehub.com/artifactory/ext-distribution-local/nxlog/#{node[:chub_nxlog][:package_name]}-#{node[:chub_nxlog][:package_version]}_amd64.ubuntu.deb"
    notifies :upgrade, "apt_package[nxlog-ce]", :immediately
  end
  apt_package "nxlog-ce" do
    source "#{Chef::Config[:file_cache_path]}/nxlog.deb"
    action :nothing
  end
when "windows"
  node.default.chub_nxlog.config_directory = "C:\\Program Files (x86)\\nxlog\\conf"
  node.default.chub_nxlog.root_path = "C:\\Program Files (x86)\\nxlog"
  windows_package "NXLOG-CE" do
    installer_type :msi
    source "#{Chef::Config[:file_cache_path]}/nxlog.msi"
    action :nothing
  end
  remote_file "#{Chef::Config[:file_cache_path]}/nxlog.msi" do
    checksum node[:chub_nxlog][:checksum]["#{node[:chub_nxlog][:package_name]}-#{node[:chub_nxlog][:package_version]}.msi"]
    source "http://artifactory01.nexus.commercehub.com/artifactory/ext-distribution-local/nxlog/#{node[:chub_nxlog][:package_name]}-#{node[:chub_nxlog][:package_version]}.msi"
    notifies :install, "windows_package[NXLOG-CE]", :immediately
  end
end

node[:chub_log][:logfiles].each_with_index do |(logname,logfile),index|
  unless index == 0
    path << ","
  end
    path << " #{logfile.type}"

  logFileArray << { :logname => logname, :logfile => logfile[:path], :logtype => logfile[:type] }

end
path << " => logstash"

template "#{node[:chub_nxlog][:config_directory]}/nxlog.conf" do 
  source      node[:chub_nxlog][:template_file]
  action      :create
  variables({
    :endpoint => node[:chub_log][:endpoint],
    :port => 2353,
    :logfiles => logFileArray,
    :route_path => path,
  })
  notifies    :restart, "service[nxlog]", :delayed
end

directory "#{node[:chub_nxlog][:root_path]}/data" do
  action    :create
end

service "nxlog" do
  action         [:enable, :start]
  init_command    "/etc/init.d/nxlog"
end

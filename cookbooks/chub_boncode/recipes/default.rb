#
# Cookbook Name: chub_boncode
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

include_recipe "windows"

directory node[:chub_boncode][:site_settings][:site_root] do
    action :create_if_missing
end

directory "#{node[:chub_boncode][:site_settings][:site_root]}/bin" do
    action :create_if_missing
end

template "#{node[:chub_boncode][:site_settings][:site_root]}/bin/BonCodeAJP13.settings" do
    source "BonCodeSite.settings.erb"
  	action :create
end

template "#{node[:chub_boncode][:site_settings][:site_root]}/web.config" do
    source "web.config.erb"
  	action :create
end

cookbook_file "#{node[:chub_boncode][:install_location]}/Unzip.ps1" do
	source "Unzip.ps1"
end

cookbook_file "#{node[:chub_boncode][:install_location]}/BonCodeAjp13_#{node[:chub_boncode][:version]}.zip" do
	source "AJP13_#{node[:chub_boncode][:version]}.zip"
end

powershell "AJP Unzip" do
	code  <<-EOH
	node[:chub_boncode][:install_location]\\Unzip.ps1 -InstallDir node[:chub_boncode][:install_location] -Version node[:chub_boncode][:version]
	EOH
end 

template "#{node[:chub_boncode][:install_location]}/installer.settings" do
    source "installer.settings.erb"
  	action :create
end

windows_package "Install BonCode" do
  source "#{node[:chub_boncode][:install_location]}/Boncode/#{node[:chub_boncode][:version]}/Connector_Setup.exe"
  installer_type :msi 
  options "/VERYSILENT /SUPPRESSMSGBOXES /LOG /SP- /NOCANCEL /NORESTART"
  action :action 
end

template "C:/windows/BonCodeAJP13.settings" do
    source "BonCodeRoot.settings.erb"
  	action :create
end

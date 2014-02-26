#
# Cookbook Name:: Base
# Recipe:: base_linux-deb
#
# Cookbook that installs standard packages
#
# Copyright 2013, CommerceHub
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

execute "apt-get update"

package_list = %w{
	build-essential
	zsh
	vim
	nmap
	curl
	wget
	netcat
	htop
	strace
	sysstat
	ruby1.9.3
	mercurial
}

package_list.each do |pkg|
	package pkg do
		action :install
	end
end

include_recipe "git"
unless node['instance_role'] == 'vagrant'
	include_recipe "chef-client"
end
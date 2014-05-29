#
# Cookbook Name:: chub-buyspace
# Recipe:: buyspace
#
# Copyright 2013, CommerceHub Inc.
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

=begin
Using http://mpwiki01.nexus.commercehub.com/display/bs/Setting+Up+A+QA+Environment
as a starting point for this cookbook.
=end

hostsfile_entry '127.0.1.1' do
  action    :remove
end

hostsfile_entry node['ipaddress'] do
  hostname  node['fqdn']
  aliases   [node['hostname']]
  action    :create
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "tomcat7" do
    action :modify
    append true
    members ["chadmin", "tomcat7"]
end

directory "#{node['chub-buyspace']['config_dir']}" do
	owner "tomcat7"
	group "tomcat7"
	mode 0775
end

directory "#{node['chub-buyspace']['app_dir']}" do
	owner "tomcat7"
	group "tomcat7"
	mode 0775
end

directory "/etc/buyspace/temp" do
  owner "tomcat7"
  group "tomcat7"
  mode 0775
end

directory "#{node['chub-buyspace']['log_dir']}" do
	owner "tomcat7"
	group "tomcat7"
	mode 0775
end

directory "/etc/chadmin" do
  owner "tomcat7"
  group "tomcat7"
  mode 0770
end

directory "/var/buyspace" do
  owner "tomcat7"
  group "tomcat7"
  mode 0775
end

package "cifs-utils" do
  action :install
end  

image_dir = "/var/buyspace/images"
image_dir_existed = File.exists?(image_dir)
directory image_dir do
  owner "tomcat7"
  group "tomcat7"
  mode 0777
  not_if {image_dir_existed}
end

execute "mount_windows_share" do
  command "echo #{node['chub-buyspace']['images']['shareDirectory']} #{node['chub-buyspace']['images']['shareMount']} cifs username=#{node['chub-buyspace']['images']['shareUser']},pass=#{node['chub-buyspace']['images']['sharePassword']},iocharset=utf8,rw,noperm >> /etc/fstab"
  not_if {image_dir_existed}
end

execute "mount all" do
  command "mount -a"
  not_if {image_dir_existed}
end

#mount "#{node['chub-buyspace']['images']['baseDirectory']}" do
#  device node['chub-buyspace']['images']['shareDirectory']
#  fstype "cifs"
#  action :enable
#  username "#{node['chub-buyspace']['images']['shareUser']}"
#  password "#{node['chub-buyspace']['images']['sharePassword']}"
#end

##{node['chub-buyspace']['images']['shareDirectory']} //mpqa02.nexus.commercehub.com/images_qa7
##{node['chub-buyspace']['images']['shareMount']} /var/buyspace/images/
##{node['chub-buyspace']['images']['shareUser']} mpqatomcat
##{node['chub-buyspace']['images']['sharePassword']} MarketPl@ce

directory "#{node['chub-buyspace']['temp_dir']}" do
	owner "tomcat7"
	group "tomcat7"
	mode 0775
end

directory "/var/lib/tomcat7/data" do
  owner "tomcat7"
  group "tomcat7"
  mode 0770
end

directory "/var/lib/tomcat7/webapps" do
  owner "tomcat7"
  group "tomcat7"
  mode 0770
end

directory "/usr/share/tomcat7/ehcache" do
  owner "tomcat7"
  group "tomcat7"
  mode 0770
end

directory "/usr/share/tomcat7/ehcache/marketplace" do
  owner "tomcat7"
  group "tomcat7"
  mode 0770
end

=begin
TODO:
- buyspace_app
	-deployed file changes?
		-does it need checksumming?
=end
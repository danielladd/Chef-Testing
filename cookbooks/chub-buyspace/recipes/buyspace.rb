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

#Add the directory underneath our shares
dataTransferDir = "#{node['chub-buyspace']['dataTransfer']['mountPath']}"
dataTransferDirExists = File.exists?(dataTransferDir)
directory dataTransferDir do
  owner "tomcat7"
  group "tomcat7"
  mode 0777
  not_if {dataTransferDirExists}
end

execute "Add data transfer mount" do
  command "echo #{node['chub-buyspace']['dataTransfer']['sharePath']} #{node['chub-buyspace']['dataTransfer']['mountPath']} cifs username=#{node['chub-buyspace']['dataTransfer']['shareUser']},pass=#{node['chub-buyspace']['dataTransfer']['sharePassword']},iocharset=utf8,rw,noperm >> /etc/fstab"
  not_if {dataTransferDirExists}
end

image_dir = "#{node['chub-buyspace']['images_dir']}"
image_dir_existed = File.exists?(image_dir)
directory image_dir do
  owner "tomcat7"
  group "tomcat7"
  mode 0777
  not_if {image_dir_existed}
end

cdnDir = "#{node['chub-buyspace']['cdn']['mountPath']}"
cdnDirExisted = File.exists?(cdnDir)
directory cdnDir do
  owner "tomcat7"
  group "tomcat7"
  mode 0777
  not_if {cdnDirExisted}
end

execute "Add cdn mount" do
  command "echo #{node['chub-buyspace']['cdn']['sharePath']} #{node['chub-buyspace']['cdn']['mountPath']} cifs username=#{node['chub-buyspace']['cdn']['shareUser']},pass=#{node['chub-buyspace']['cdn']['sharePassword']},iocharset=utf8,rw,noperm >> /etc/fstab"
  not_if {cdnDirExisted}
end

imageDatastore1Dir = "#{node['chub-buyspace']['imageDatastore1']['mountPath']}"
imageDatastore1DirExisted = File.exists?(imageDatastore1Dir)
directory imageDatastore1Dir do
  owner "tomcat7"
  group "tomcat7"
  mode 0777
  not_if {imageDatastore1DirExisted}
end

execute "Add image datastore 1 mount" do
  command "echo #{node['chub-buyspace']['imageDatastore1']['sharePath']} #{node['chub-buyspace']['imageDatastore1']['mountPath']} cifs username=#{node['chub-buyspace']['imageDatastore1']['shareUser']},pass=#{node['chub-buyspace']['imageDatastore1']['sharePassword']},iocharset=utf8,rw,noperm >> /etc/fstab"
  not_if {imageDatastore1DirExisted}
end

imageDatastore2Dir = "#{node['chub-buyspace']['imageDatastore2']['mountPath']}"
imageDatastore2DirExisted = File.exists?(imageDatastore2Dir)
directory imageDatastore2Dir do
  owner "tomcat7"
  group "tomcat7"
  mode 0777
  not_if {imageDatastore2DirExisted}
end

execute "Add image datastore 2 mount" do
  command "echo #{node['chub-buyspace']['imageDatastore2']['sharePath']} #{node['chub-buyspace']['imageDatastore2']['mountPath']} cifs username=#{node['chub-buyspace']['imageDatastore2']['shareUser']},pass=#{node['chub-buyspace']['imageDatastore2']['sharePassword']},iocharset=utf8,rw,noperm >> /etc/fstab"
  not_if {imageDatastore2DirExisted}
end

execute "mount all" do
  command "mount -a"
end

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

cron "remove old buyspace-app logs" do
  minute "0"
  hour "0"
  command 'find /var/log/buyspace -name \'*buyspace-app.log*\' -mtime +14 -exec rm {} \;'
end

cron "remove old tomcat localhost_access logs" do
  minute "0"
  hour "0"
  command 'find /var/log/tomcat7 -name \'localhost_access_log*.txt\' -mtime +14 -exec rm {} \;'
end

cron "remove old tomcat localhost logs" do
  minute "0"
  hour "0"
  command 'find /var/log/tomcat7 -name \'localhost.*log\' -mtime +14 -exec rm {} \;'
end

cron "remove tomcat catalina zipped logs" do
  minute "0"
  hour "0"
  command 'find /var/log/tomcat7 -name \'catalina.*gz\' -mtime +14 -exec rm {} \;'
end

cron "remove tomcat catalina logs" do
  minute "0"
  hour "0"
  command 'find /var/log/tomcat7 -name \'catalina.*log\' -mtime +14 -exec rm {} \;'
end

cron "remove tomcat host-manager logs" do
  minute "0"
  hour "0"
  command 'find /var/log/tomcat7 -name \'host-manager.*log\' -mtime +14 -exec rm {} \;'
end

cron "remove tomcat host-manager logs" do
  minute "0"
  hour "0"
  command 'find /var/log/tomcat7 -name \'manager.*log\' -mtime +14 -exec rm {} \;'
end

=begin
TODO:
- buyspace_app
	-deployed file changes?
		-does it need checksumming?
=end
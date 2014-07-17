#
# Cookbook Name:: chub_rundeck
# Recipe:: mysql_backup
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
include_recipe "cron"

group "mysql" do
  action    :create
  system    true
end

user "mysql" do
  comment    "Application user for mysql"
  gid        "mysql"
  system     true
end

group "mysql" do
  action     :modify
  append     true
  members    ["mysql"]
end

directory node[:mysql][:backup_root_path] do
  owner        "mysql"
  group        "mysql"
  mode         0655
  recursive    true
  action       :create
end

template "#{node[:mysql][:backup_root_path]}/backup.sh" do
  source    "mysql_backup.erb"
  owner     "mysql"
  group     "mysql"
  action    :create
end

cron_d "mysql_backup" do
  minute     00
  hour       01
  user       "mysql"
  command    "bash /opt/mysql/backup.sh"
  action     :create
end

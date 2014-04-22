#
# Cookbook Name:: Base
# Recipe:: users
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

users = data_bag('users')

users.each do |login|
  user = data_bag_item('users', login)
  home = "/home/#{user['user']}"
  groups = user['group']
  shell = user['shell']
  system = user['system']
  pass = user['password']

  if shell.nil? or shell == ''
    shell = '/bin/bash'
  end

  if system.nil?
    system = false
  end

  if pass.nil? or pass == ''
    #pass = "randomlongpassword"
    pass = "$1$miusDUAL$rfsyWxpxUCd8IeXj5.RhT/"
  end

  user user['user'] do
    system    system
    password  pass
    shell     shell
    home      home
    supports  :manage_home => true
    action    :create
  end

  groups.each do |name|
    group name do
      members user['user']
      append true
      action :modify
      only_if "cut -d: -f1 /etc/group | grep #{name}"
    end
  end

end
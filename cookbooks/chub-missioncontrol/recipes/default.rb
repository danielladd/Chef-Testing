#
# Cookbook Name:: chub-missioncontrol
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
include_recipe "chub_java::oracle7"
include_recipe "mongodb"

group "chub-missioncontrol" do
    action :create
    system true
end

user "chub-missioncontrol" do
    comment "Application user for chub-missioncontrol"
    gid "chub-missioncontrol"
    system true
end

user "chadmin" do
    # Placeholder user; in "real" VMs, this user is expected to already exist.
    # This definition makes it so that in Vagrant VMs, the user exists so that the group definition below doesn't fail.
end

group "chub-missioncontrol" do
    action :modify
    append true
    members ["chub-missioncontrol", "chadmin"]
end
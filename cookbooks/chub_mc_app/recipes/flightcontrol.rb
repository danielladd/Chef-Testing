#
# Cookbook Name: chub_mc_app
# Recipe:: flightcontrol
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

include_recipe "chub_mc_app::default"

begin
  t = resources(:template => "/etc/init/#{node[:chub_mc_app][:app_name]}.conf")
  t.source "flightcontrol.conf.erb"
  t.cookbook "chub_mc_app"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "could not find template flightcontrol.conf.erb to modify"
end
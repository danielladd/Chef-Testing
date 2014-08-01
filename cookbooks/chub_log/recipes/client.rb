#
# Cookbook Name:: chub_log
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

node.default.chub_nxlog.logfiles = node[:chub_log][:logfiles]
node.default.chub_nxlog.endpoint = node[:chub_log][:endpoint]
node.default.chub_nxlog.endpoint_port = node[:chub_log][:endpoint_port]
node.default.chub_nxlog.logstash_cert = node[:chub_log][:logstash_cert]

if platform_family?("windows")
  include_recipe "chub_logsearch_shipper::remove"
end
include_recipe "chub_nxlog::default"


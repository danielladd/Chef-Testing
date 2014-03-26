#
# Cookbook Name:: base
# Recipe:: regression_maid
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
# This recipe sends a message to Pagerduty each Monday at 9am in order to
# notify the recipient that they are on-call.

include_recipe "cron"

user "maid" do
    comment "regression maid user"
    gid "adm"
    system true
end

directory "/opt/regression_maid" do
	mode 554
	owner "maid"
	group "adm"
	action :create
	recursive true
end

directory "/var/log/regression_maid" do
	mode 554
	owner "maid"
	group "adm"
	action :create
end

git "regression_maid" do
  repository 'http://mpgit03.nexus.commercehub.com/lzarou/regression_maid.git'
  reference 'master'
  action :sync
  destination '/opt/regression_maid'
end

cron_d "regression_maid_run" do
	minute 00
	hour '06-19'
	weekday '1-5'
	command "ruby /opt/regression_maid/HungJobs.rb -e 'Webdriver' > /var/log/regression_maid/lastRun.log"
end

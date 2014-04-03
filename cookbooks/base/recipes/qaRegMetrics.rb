#
# Cookbook Name:: base
# Recipe:: qaRegMetrics
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

include_recipe "cron"

user "qaregmetrics" do
    comment "regression metrics user"
    gid "adm"
    system true
end

directory "/opt/daily_reg_stats" do
        mode 554
        owner "qaregmetrics"
        group "adm"
        action :create
        recursive true
end

directory "/var/log/qaRegMetrics" do
        mode 554
        owner "qaregmetrics"
        group "adm"
        action :create
end

git "qaRegMetrics" do
  repository 'git@mpgit03.nexus.commercehub.com:pipeline/qaregmetrics.git'
  reference 'master'
  action :sync
  destination '/opt/daily_reg_stats'
end

cron_d "qaRegMetrics_run" do
        minute '02'
        hour '06'
        command "cd /opt/daily_reg_stats/ChartFactory/ ; ./update.sh > /var/log/qaRegMetrics/lastRun.log"
end


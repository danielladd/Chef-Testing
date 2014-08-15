#
# Cookbook Name:: base
# Recipe:: pagerduty_handoff
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
include_recipe "python"

# Attributes
node.default['base']['pagerduty']['courtesy']['schedules']['auth_token']	= 'zCNqqraNGpQBGdxjqcMu'
node.default['base']['pagerduty']['courtesy']['base_url']				= 'https://commercehub.pagerduty.com/api/v1/'
node.default['base']['pagerduty']['courtesy']['schedules']				= [
																	'BuySpace_Engineers',
																	'COMMS_OnCall',
																	'CoreEngineers_Oncall',
																	'DBA_NoOp',
																	'DBA_OnCall_Primary',
																	'DBA_OnCall_Secondary',
																	'dev_Oncall',
																	'Git Admin',
																	'IT_OnCall',
																	'OpsEngineers_OnCall',
																	'Pipeline',
																	'Primary OnCall Operations Engineers',
																	'Secondary OnCall Operations Engineers',
																	'Shipping_and_Logistics_Team',
																	'SSO'
																	]
node.default['base']['pagerduty']['courtesy']['smtp_server']		= 'mail.commercehub.com'
node.default['base']['pagerduty']['courtesy']['smtp_from_address']	= 'pagerduty@commercehub.com'
node.default['base']['pagerduty']['courtesy']['warning_offset']		= ''


# git "pagerduty_notifications" do
# 	repository 'https://github.com/ryanhoskin/pagerduty_notifications.git'
# 	reference 'master'
# 	action :checkout
# 	destination '/opt/pagerduty_notifications'

# end

package_list = %w{
	python-pip
}

package_list.each do |pkg|
	package pkg do
		action :install
	end
end

directory "/opt/pagerduty_notifications" do
	mode 554
	owner "root"
	group "adm"
	action :create
	recursive true
end

template "/opt/pagerduty_notifications/pagerduty_warning.py" do
	source "pagerduty_warning.py.erb"
	mode 554
	owner "root"
	group "adm"
	variables( 
		:auth_token => 	node['base']['pagerduty']['courtesy']['auth_token'],
		:base_url => 	node['base']['pagerduty']['courtesy']['base_url'],
		:schedules => 	node['base']['pagerduty']['courtesy']['schedules'],
		:smtp_server => 	node['base']['pagerduty']['courtesy']['smtp_server'],
		:smtp_from_address => 	node['base']['pagerduty']['courtesy']['smtp_from_address'],
		:warning_offset => 	node['base']['pagerduty']['courtesy']['warning_offset']
	)
end

unless `which pip`
	package 'python-pip' do
		action :install
	end
else
	output = `pip list`
	unless output.include?("requests") 
		execute "pip install requests" do
			command "pip install requests"
		end
	# else
	# 	Chef::Log.info "pip already installed"
	end
end

output = `pip list`
unless output.include?("requests") 
	execute "pip install requests" do
		command "pip install requests"
	end
# else
# 	Chef::Log.info "pip already installed"
end

cron_d "pagerduty_warning" do
	minute 1
	hour 9
	weekday "Mon,Fri"
	command '/opt/pagerduty_notifications/pagerduty_warning.py'
end

node.default[:base][:pagerduty][:user_report][:auth_token]			= 'zCNqqraNGpQBGdxjqcMu'
node.default[:base][:pagerduty][:user_report][:uri]					= 'https://commercehub.pagerduty.com/api/v1/users'
node.default[:base][:pagerduty][:user_report][:smtp_server]			= 'mail.commercehub.com'
node.default[:base][:pagerduty][:user_report][:smtp_from_address]	= 'pagerduty@commercehub.com'
node.default[:base][:pagerduty][:user_report][:smtp_to_address]		= 'tmcgaughan@commercehub.com'

directory "/opt/pagerduty_user_report" do
	mode 554
	owner "root"
	group "adm"
	action :create
	recursive true
end

template "/opt/pagerduty_user_report/get_users.rb" do
	source "get_users.rb.erb"
	mode 554
	owner "root"
	group "adm"
	variables( 
		:api_key =>				node[:base][:pagerduty][:user_report][:auth_token],
		:uri =>					node[:base][:pagerduty][:user_report][:uri],
		:smtp_server =>			node[:base][:pagerduty][:user_report][:smtp_server],
		:smtp_from_address =>	node[:base][:pagerduty][:user_report][:smtp_from_address],
		:smtp_to_address =>		node[:base][:pagerduty][:user_report][:smtp_to_address]
	)
end

output = `gem list`
unless output.include?("httparty") 
	execute "gem install httparty" do
		command "gem install httparty --no-rdoc --no-ri"
	end
end

cron "pagerduty_user_report" do
	minute '1'
	hour '7'
	day "1"
	command '/opt/pagerduty_user_report/get_users.rb'
end

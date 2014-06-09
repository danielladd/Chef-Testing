service_name    = "slm_message_processor"
project_name    = "slm_fulfillment"
group_name      = project_name
user_name       = project_name

directory "/tmp/#{project_name}/database_setup" do
	owner: "root"
	group: "root"
	mode: 0770
end

[
	{
		jar: "exceptions-db-ratchet.jar",
		url: node[:chub_slm_fulfillment][:exceptions][:db_jar],
		db_name: node[:chub_slm_fulfillment][:exceptions][:db_name]
	},{
		jar: "intervals-db-ratchet.jar",
		url: node[:chub_slm_fulfillment][:intervals][:db_jar],
		db_name: node[:chub_slm_fulfillment][:intervals][:db_name]
	},{
		jar: "measurements-db-ratchet.jar",
		url: node[:chub_slm_fulfillment][:measurements][:db_jar],
		db_name: node[:chub_slm_fulfillment][:measurements][:db_name]
	}
].each do |data|
	remote_file "/tmp/#{project_name}/database_setup/#{data[:jar]}" do
	    source data[:url]
	    owner user_name
	    group group_name
	    mode 0770
	end

	#Run the jar to initialize the DB.
	execute do
		command "java -jar /tmp/#{project_name}/database_setup/#{data[:jar]} -s #{node[:chub_slm_fulfillment][:db_server]} -d #{data[:db_name]} -u #{node[:chub_slm_fulfillment][:db_user]} -p #{node[:chub_slm_fulfillment]{:db_pass}}"
	end	
end
name "salesforcews_live"
description "A linux machine running salesforce web service (in production)"
run_list "recipe[base]", "recipe[chub_mc_webservices]", "recipe[chub_mc_webservices::salesforce_webservice]"
default_attributes "chub_mc_webservice" => {
	"salesforce" => {
    	"jar_file_name" => "crm-standalone.jar",
		"jar_file_url" => "http://bamboom1:8085/browse/MC-WSSAL/latest/artifact/shared/Salesforce-Web-Service-Jar-Live/build/libs/crm-standalone.jar?os_username=mess&os_password=messuser",
		
		"config" => {
			"salesforceClient" => {
				"host" => "https://test.salesforce.com",
				"clientId" => "",
				"clientSecret" => "",
				"username" => "",
				"password" => ""
			},
		},
	},
}

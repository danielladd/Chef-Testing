name "salesforcews_live"
description "A linux machine running salesforce web service (in production)"
run_list "recipe[base]", "recipe[chub_mc_webservices]", "recipe[chub_mc_webservices::salesforce_webservice]"
default_attributes "chub_mc_webservice" => {
	"salesforce" => {
    	"jar_file_name" => "crm-service-standalone.jar",
		"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/crm/0.1/crm-service-standalone.jar",
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

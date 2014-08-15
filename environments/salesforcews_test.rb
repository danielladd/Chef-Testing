name "salesforcews_test"
description "A linux machine running salesforce web service (in test)"
cookbook_versions({
	"chub_mc_webservice" => "= 0.1.0"
})
default_attributes(
    "chub_mc_webservice" => {
   		"jar_file_name" => "crm-service-standalone.jar",
		"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/crm/0.1/crm-service-standalone.jar",	
		"salesforce_config" => {
			"salesforceClient" => {
				"host" => "https://test.salesforce.com",
				"clientId" => "",
				"clientSecret" => "",
				"username" => "",
				"password" => ""
			},
		},
	}
)
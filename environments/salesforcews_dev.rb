name "salesforcews_dev"
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
				"clientId" => "3MVG98dostKihXN5fgPZri6UVPuAVRp5BSnfLhUOXRgBzJ4E0sdqGoL3VJxCjrNC9ZTv2mhCfWpazBSBdR9Oe",
				"clientSecret" => "64733457986452344",
				"username" => "mbouchard@commercehub.com.IntPro1",
				"password" => "sMLc4YI4obXr"
			},
		},
	}
)
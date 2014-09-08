name "platformws_test"
description "A linux machine running platform WS (in test)"
cookbook_versions({
	"chub_mc_webservice" => "= 0.1.0",
	"chub_mc_logs" => "= 0.1.0"
})
default_attributes(
    "chub_mc_webservice" => {
   		"jar_file_name" => "platformws-standalone.jar",
		"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/platformws/0.1/platformws-standalone.jar",
		"platform_config" => {
			"db" => "testmcmongo01",
			"db_port" => "\"27017\""
		}
	},
	"chub_mc_logs" => {
		"mc_resource" => "platform-webservice",
		"log_server" => "lsdev.nexus.commercehub.com"
	}	
)


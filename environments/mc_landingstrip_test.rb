name "mc_landingstrip_test"
description "Mission Control LandingStrip Test Environment"
cookbook_versions({
	"chub_mc_app" => "= 0.1.0",
	"chub_mc_logs" => "= 0.1.0"
})
default_attributes( 
	"chub_mc_app" => {
		"port" => "9100",
		"app_name" => "landingstrip",
		"jar_file_url" => "http://artifactory01/artifactory/simple/inteng-snapshot/landingstrip/0.1/landingstriptest.jar"
	},
	"chub_mc_logs" => {
		"mc_resource" => "landingstrip",
		"log_server" => "lsdev.nexus.commercehub.com"
	}	
)
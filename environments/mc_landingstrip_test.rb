name "mc_landingstrip_test"
description "Mission Control LandingStrip Test Environment"
cookbook_versions({
	"chub_mc_app" => "= 0.2.1",
	"chub_mc_logs" => "= 0.1.0"
})
default_attributes( 
	"chub_mc_app" => {
		"port" => "9100",
		"app_name" => "landingstrip",
		"config_vars" => {
			"useBridge" => "true",
			"disableRecompile" => "false",
			"enableReload" => "false",
			"mcHost" => "testmissioncontrol",
			"appHost" => "testmissioncontrol",
			"authService" => "devmcauth",
			"appMachineNames" => "\"tmchost01;tmchost02\"",
			"mongoHost" => "testmcmongo01"
		},
		"jar_file_url" => "http://artifactory01.nexus.commercehub.com/artifactory/inteng-snapshot/com/commercehub/landingstrip/%5BRELEASE%5D/landingstrip-%5BRELEASE%5D.jar"
	},
	"chub_mc_logs" => {
		"mc_resource" => "landingstrip",
		"log_server" => "lsdev.nexus.commercehub.com"
	}	
)
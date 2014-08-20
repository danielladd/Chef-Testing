name "mc_flightcontrol_dev"
description "Mission Control FlightControl Development Environment"
cookbook_versions({
	"chub_mc_app" => "= 0.2.2",
	"chub_mc_logs" => "= 0.1.0"
})
default_attributes( 
	"chub_mc_app" => {
		"port" => "9200",
		"app_name" => "flightcontrol",
		"config_vars" => {
			"useBridge" => "true",
			"disableRecompile" => "false",
			"enableReload" => "false",
			"mcHost" => "devmissioncontrol",
			"appHost" => "devmissioncontrol/flightcontrol",
			"authService" => "devmcauth",
			"pgenServiceHost" => "dmcflightws01"
		},
		"jar_file_url" => "http://artifactory01.nexus.commercehub.com/artifactory/inteng-snapshot/com/commercehub/flightcontrol/%5BRELEASE%5D/flightcontrol-%5BRELEASE%5D.jar"
	},
	"chub_mc_logs" => {
		"mc_resource" => "flightcontrol",
		"log_server" => "lsdev.nexus.commercehub.com"
	}	
)
name "mc_landingstrip_dev"
description "Mission Control LandingStrip Development Environment"
cookbook_versions({
	"chub_mc_app" => "= 0.2.2",
	"chub_mc_logs" => "= 0.1.0"
})
default_attributes( 
	"chub_mc_app" => {
		"port" => "9100",
		"app_name" => "landingstrip",
		"jmx_on" => true,
		"jmx_port" => "9010",
		"config_vars" => {
			"useBridge" => "true",
			"disableRecompile" => "false",
			"enableReload" => "false",
			"mcHost" => "devmissioncontrol",
			"appHost" => "devmissioncontrol",
			"server.port" => "9100",
			"authService" => "devmcauth",
			"mongoHost" => "devmcmongo01",
			"connmanHost" => "http://democonnmgr03:18080/connmgr",
			"csdashHost" => "http://csdashtest:8080"
		},
		"jar_file_url" => "http://artifactory01.nexus.commercehub.com/artifactory/inteng-snapshot/com/commercehub/landingstrip/%5BRELEASE%5D/landingstrip-%5BRELEASE%5D.jar"
	},
	"chub_mc_logs" => {
		"mc_resource" => "landingstrip",
		"log_server" => "lsdev.nexus.commercehub.com"
	}	
)
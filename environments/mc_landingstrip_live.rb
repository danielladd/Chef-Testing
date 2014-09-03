name "mc_landingstrip_live"
description "Mission Control LandingStrip Live Environment"
cookbook_versions({
	"chub_mc_app" => "= 0.2.2",
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
			"mcHost" => "missioncontrol",
			"appHost" => "missioncontrol",
			"server.port" => "9100",
			"authService" => "mcauth",
			"mongoHost" => "mcmongo01",
			"connmanHost" => "http://connmgr",
			"csdashHost" => "http://csdash:8080"
		},
		"jar_file_url" => "http://artifactory01.nexus.commercehub.com/artifactory/inteng-release/com/commercehub/landingstrip/1.%5BRELEASE%5D/landingstrip-1.%5BRELEASE%5D.jar"
	},
	"chub_mc_logs" => {
		"mc_resource" => "landingstrip",
		"log_server" => "lsdev.nexus.commercehub.com"
	}	
)
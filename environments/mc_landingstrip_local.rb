name "mc_landingstrip_local"
description "Mission Control LandingStrip Local Environment"
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
			"mcHost" => "lmchost01",
			"mcHostPort" => "9100",
			"appHost" => "lmchost01",
			"server.port" => "9100",
			"authService" => "devmcauth",
			"mongoHost" => "localmcmongo01",
			"connmanHost" => "http://democonnmgr03:18080/connmgr",
			"csdashHost" => "http://csdashtest:8080",
			"isLocal" => "true"
		},
		"jar_file_url" => "http://artifactory01.nexus.commercehub.com/artifactory/inteng-snapshot/com/commercehub/landingstrip/%5BRELEASE%5D/landingstrip-%5BRELEASE%5D.jar"
	},
	"chub_mc_logs" => {
		"mc_resource" => "landingstrip",
		"log_server" => "lsdev.nexus.commercehub.com"
	}	
)
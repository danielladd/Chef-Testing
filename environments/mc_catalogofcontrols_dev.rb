name "mc_catalogofcontrols_dev"
description "Mission Control CatalogofControls Dev Environment"
cookbook_versions({
	"chub_mc_app" => "= 0.2.0",
	"chub_mc_logs" => "= 0.1.0"
})
default_attributes( 
	"chub_mc_app" => {
		"port" => "9400",
		"app_name" => "catalogofcontrols",
		"config_vars" => {
			"useBridge" => "true",
			"disableRecompile" => "false",
			"enableReload" => "false",
			"mcHost" => "devmissioncontrol",
			"appHost" => "devmissioncontrol/catalogofcontrols",
			"authService" => "devmcauth",
			"appMachine1" => "dmccatalog01",
			"appMachine2" => "dmccatalog02"
		},
		"jar_file_url" => "http://artifactory01.nexus.commercehub.com/artifactory/inteng-snapshot/com/commercehub/catalogofcontrols/%5BRELEASE%5D/catalogofcontrols-%5BRELEASE%5D.jar"
	},
	"chub_mc_logs" => {
		"mc_resource" => "catalogofcontrols",
		"log_server" => "lsdev.nexus.commercehub.com"
	}	
)
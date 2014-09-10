name "mc_systemscontrol_dev"
description "Mission Control SystemsControl Dev Environment"
cookbook_versions({
	"chub_mc_app" => "= 0.2.2",
	"chub_mc_logs" => "= 0.1.0"
})
default_attributes( 
	"chub_mc_app" => {
		"port" => "9500",
		"app_name" => "systemscontrol",
		"config_vars" => {
			"useBridge" => "true",
			"disableRecompile" => "false",
			"enableReload" => "false",
			"mcHost" => "devmissioncontrol",
			"appHost" => "devmissioncontrol/systemscontrol",
			"server.port" => "9500",
			"authService" => "devmcauth",
			"anaxConf" => "\"/opt/systemscontrol/anaximander.conf\""
		},
		"jar_file_url" => "http://artifactory01.nexus.commercehub.com/artifactory/inteng-snapshot/com/commercehub/systemscontrol/%5BRELEASE%5D/systemscontrol-%5BRELEASE%5D.jar"
	},
	"chub_mc_logs" => {
		"mc_resource" => "systemscontrol",
		"log_server" => "lsdev.nexus.commercehub.com"
	}	
)
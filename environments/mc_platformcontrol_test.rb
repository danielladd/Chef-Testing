name "mc_platformcontrol_test"
description "Mission Control PlatformControl Test Environment"
cookbook_versions({
	"chub_mc_app" => "= 0.2.0",
	"chub_mc_logs" => "= 0.1.0"
})
default_attributes( 
	"chub_mc_app" => {
		"port" => "9300",
		"app_name" => "platformcontrol",
		"config_vars" => {
			"useBridge" => "true",
			"disableRecompile" => "false",
			"enableReload" => "false",
			"mcHost" => "testmissioncontrol",
			"appHost" => "testmissioncontrol/platformcontrol",
			"authService" => "devmcauth",
			"appMachine1" => "tmcplatctrl01",
			"appMachine2" => "tmcplatctrl02"
		},
		"jar_file_url" => "http://artifactory01.nexus.commercehub.com/artifactory/inteng-snapshot/com/commercehub/platformcontrol/%5BRELEASE%5D/platformcontrol-%5BRELEASE%5D.jar"
	},
	"chub_mc_logs" => {
		"mc_resource" => "platformcontrol",
		"log_server" => "lsdev.nexus.commercehub.com"
	}	
)
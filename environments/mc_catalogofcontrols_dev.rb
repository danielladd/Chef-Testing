name "mc_catalogofcontrols_dev"
description "Mission Control CatalogofControls Development Environment"
cookbook_versions({
	"chub_mc_app" => "= 0.1.0",
	"chub_mc_logs" => "= 0.1.0"
})
default_attributes( 
	"chub_mc_app" => {
		"port" => "9400",
		"app_name" => "catalogofcontrols",
		"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/catalogofcontrols/0.1/catalogofcontrols.jar"
	},
	"chub_mc_logs" => {
		"mc_resource" => "catalogofcontrols",
		"log_server" => "lsdev.nexus.commercehub.com"
	}	
)
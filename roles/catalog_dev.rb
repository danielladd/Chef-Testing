name "catalogofcontrols_dev"
description "A linux machine running catalogofcontrols of controls (in development)"
run_list "recipe[base]", "recipe[chub_mc_app]", "recipe[chub_mc_logs]"
default_attributes "chub_mc_app" => {
	"port" => "9400",
	"app_name" => "catalogofcontrols",
	"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/catalogofcontrols/0.1/catalogofcontrols.jar"
},
"chub_mc_logs" => {
	"mc_resource" => "catalogofcontrols",
	"log_server" => "lsdev.nexus.commercehub.com"
}


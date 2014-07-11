name "catalogofcontrols_test"
description "A linux machine running catalogofcontrols of controls (in development)"
run_list "recipe[base]", "recipe[chub_mc_app]", "recipe[chub_mc_logs]"
default_attributes "chub_mc_app" => {
	"port" => "9400",
	"app_name" => "catalogofcontrols",
	"jar_file_url" => "http://artifactory01/artifactory/simple/inteng-snapshot/catalogofcontrols/0.1/catalogofcontrolstest.jar"
},
"chub_mc_logs" => {
	"mc_resource" => "catalogofcontrols",
	"log_server" => "lsdev.nexus.commercehub.com"
}


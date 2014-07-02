name "platformcontrol_dev"
description "A linux machine running platformcontrol (in development)"
run_list "recipe[base]", "recipe[chub_mc_app]", "recipe[chub_mc_logs]"
default_attributes "chub_mc_app" => {
	"port" => "9300",
	"app_name" => "platformcontrol",
	"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/platformcontrol/0.1/platformcontrol.jar"
},
"chub_mc_logs" => {
	"mc_resource" => "platformcontrol",
	"log_server" => "lsdev.nexus.commercehub.com"
}

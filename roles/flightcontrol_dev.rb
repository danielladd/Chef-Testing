name "flightcontrol_dev"
description "A linux machine running flightcontrol_dev (in development)"
run_list "recipe[base]", "recipe[chub_mc_app]", "recipe[chub_mc_logs]"
default_attributes "chub_mc_app" => {
	"port" => "9200",
	"app_name" => "flightcontrol",
	"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/flightcontrol/0.1/flightcontrol.jar"
},
"chub_mc_logs" => {
	"mc_resource" => "flightcontrol",
	"log_server" => "lsdev.nexus.commercehub.com"
}


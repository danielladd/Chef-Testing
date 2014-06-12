name "landingstrip_live"
description "A linux machine running landingstrip (in development)"
run_list "recipe[base]", "recipe[chub_mc_app]", "recipe[chub_mc_logs]"
default_attributes "chub_mc_app" => {
	"port" => "9100",
	"app_name" => "landingstrip",
	"jar_file_url" => "http://artifactory01/artifactory/simple/inteng-snapshot/landingstrip/0.1/landingstriplive.jar"
},
"chub_mc_logs" => {
	"mc_resource" => "landingstrip",
	"log_server" => "lsdev.nexus.commercehub.com",
	"logs_on" => false
}
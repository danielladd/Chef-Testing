name "landingstrip_dev"
description "A linux machine running landingstrip (in development)"
run_list "recipe[base]", "recipe[chub_mc_app]", "recipe[chub_mc_logs]"
default_attributes "chub_mc_app" => {
	"port" => "9100",
	"app_name" => "landingstrip",
	"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/landingstrip/0.1/landingstrip.jar"
},
"chub_mc_logs" => {
	"mc_resource" => "landingstrip",
	"log_server" => "lsdev01.nexus.commercehub.com"
}

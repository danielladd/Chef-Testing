name "flightcontrol_dev"
description "A linux machine running flightcontrol_dev (in development)"
run_list "recipe[base]", "recipe[ulimit]", "recipe[mongodb::10gen_repo]", "recipe[mongodb]", "recipe[chub_mc_app]"
default_attributes "chub_mc_app" => {
	"port" => "9200",
	"app_name" => "flightcontrol",
	"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/flightcontrol/0.1/flightcontrol.jar"
}

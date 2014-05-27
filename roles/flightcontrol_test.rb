name "flightcontrol_test"
description "A linux machine running flightcontrol_test (in development)"
run_list "recipe[base]", "recipe[chub_mc_app]"
default_attributes "chub_mc_app" => {
	"port" => "9200",
	"app_name" => "flightcontrol",
	"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/flightcontrol/0.1/flightcontroltest.jar"
}

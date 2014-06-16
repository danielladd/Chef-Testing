name "systemsws_test"
description "A linux machine running Systems WS (in test)"
run_list "recipe[base]", "recipe[chub_mc_webservices]", "recipe[chub_mc_webservices::systems_webservice]"
default_attributes "chub_mc_webservice" => {
	"systems" => {
    	"jar_file_name" => "systems-service-standalone.jar",
		"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/systemsws/0.1/systems-service-standalone.jar"
		}
}


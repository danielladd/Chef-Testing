name "flightws_dev"
description "A linux machine running flight WS (in development)"
run_list "recipe[base]", "recipe[chub_mc_webservices]", "recipe[chub_mc_webservices::flight_webservice]"
default_attributes "chub_mc_webservice" => {
	"flight" => {
    	"jar_file_name" => "flight-service-standalone.jar",
		"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/flightws/0.1/flight-service-standalone.jar"
		}
}


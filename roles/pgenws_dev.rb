name "pgenws_dev"
description "A linux machine running pgen WS (in development)"
run_list "recipe[base]", "recipe[chub_mc_webservices]", "recipe[chub_mc_webservices::pgen_webservice]"
default_attributes "chub_mc_webservice" => {
	"pgen" => {
    	"jar_file_name" => "PayloadGeneratorWebService-standalone.jar",
		"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/pgenws/0.1/PayloadGeneratorWebService-standalone.jar"
		}
}


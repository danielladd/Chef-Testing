name "connmanws_dev"
description "A linux machine running connection manager WS (in development)"
run_list "recipe[base]", "recipe[chub_mc_webservices]", "recipe[chub_mc_webservices::connman_webservice]"
default_attributes "chub_mc_webservice" => {
	"connman" => {
    	"jar_file_name" => "ConnMgrService-standalone.jar",
		"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/connmanws/0.1/ConnMgrService-standalone.jar"
		}
}


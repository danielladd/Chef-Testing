name "mc_systemsws_dev"
description "A linux machine running Systems WS (in dev)"
cookbook_versions({
	"chub_mc_webservice" => "= 0.1.0"
})
default_attributes(
   "chub_mc_webservice" => {
    	"jar_file_name" => "systems-service-standalone.jar",
		"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/systemsws/0.1/systems-service-standalone.jar"
	}
)	


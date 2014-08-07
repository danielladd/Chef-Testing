name "connmanws_test"
description "A linux machine running connman WS (in test)"
cookbook_versions({
	"chub_mc_webservice" => "= 0.1.0"
})
default_attributes(
    "chub_mc_webservice" => {
   		"jar_file_name" => "ConnMgrService-standalone.jar",
		"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/connmanws/0.1/ConnMgrService-standalone.jar"
	}
)
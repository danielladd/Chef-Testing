name "connmanws_test"
description "A linux machine running connman WS (in test)"
run_list "recipe[base]", "recipe[chub_mc_webservices]", "recipe[chub_mc_webservices::connman_webservice]"
default_attributes "chub_mc_webservice" => {
	"connman" => {
    	"jar_file_name" => "ConnMgrService-standalone.jar",
		"jar_file_url" => "http://bamboom1:8085/browse/MC-WSCON/latest/artifact/shared/ConnMan-Web-Service-Jar/ConnMgrService-standalone.jar?os_username=mess&os_password=messuser"
		}
}

name "netsuitews_test"
description "A linux machine running netsuite webservice(in test)"
run_list "recipe[base]", "recipe[chub_mc_webservices]", "recipe[chub_mc_webservices::netsuite_webservice]"
default_attributes  "chub_mc_webservice" => {
	"netsuite" => {
    	"jar_file_name" => "billing-standalone.jar",
		"jar_file_url" => "http://bamboom1:8085/browse/MC-WSNET/latest/artifact/shared/NetSuite-Web-Service-Jar-Test/billing-standalone.jar?os_username=mess&os_password=messuser"
		}
}

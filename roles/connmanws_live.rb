name "connmanws_live"
description "A linux machine running connman WS (in production)"
run_list "recipe[base]", "recipe[chub_mc_webservices]", "recipe[chub_mc_webservices::connman_webservice]"
default_attributes "chub_mc_webservice" => {
	"connman" => {
    	"jar_file_name" => "OnboardingService-standalone.jar",
		"jar_file_url" => "http://bamboom1:8085/browse/MC-WSON/latest/artifact/shared/Onboarding-Web-Service-Jar-Live/OnboardingService-standalone.jar?os_username=mess&os_password=messuser"
		}
}

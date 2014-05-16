name "onboardingws_dev"
description "A linux machine running onboarding WS (in development)"
run_list "recipe[base]", "recipe[chub_mc_webservices]", "recipe[chub_mc_webservices::onboarding_webservice]"
default_attributes "chub_mc_webservice" => {
	"onboarding" => {
    	"jar_file_name" => "OnboardingService-standalone.jar",
		"jar_file_url" => "bamboom1:8085/browse/MC-WSON/latest/artifact/shared/Onboarding-Web-Service-Jar/OnboardingService-standalone.jar"
		},
}

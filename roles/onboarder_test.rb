name "onboarder_test"
description "A linux machine running onboarder (in development)"
run_list "recipe[base]", "recipe[ulimit]", "recipe[mongodb::10gen_repo]", "recipe[mongodb]", "recipe[chub_mc_app]"
default_attributes "chub_mc_app" => {
	"port" => "9300",
	"app_name" => "onboarder",
	"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/onboarder/0.1/onboardertest.jar"
}

name "csdashboard_dev"
description "A linux machine running csdashboard (in development)"
run_list "recipe[base]", "recipe[ulimit]", "recipe[mongodb::10gen_repo]", "recipe[mongodb]", "recipe[chub_mc_app]"
default_attributes "chub_mc_app" => {
	"port" => "9200",
	"app_name" => "csdashboard",
	"jar_file_url" => "http://bamboom1:8085/browse/MC-CSD/latest/artifact/shared/CS-Dashboard-Jar/csd.jar/?os_username=mess&os_password=messuser",
}

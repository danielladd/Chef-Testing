name "connman_dev"
description "A linux machine running connman (in development)"
run_list "recipe[base]", "recipe[ulimit]", "recipe[mongodb::10gen_repo]", "recipe[mongodb]", "recipe[chub_mc_app]"
default_attributes "chub_mc_app" => {
	"port" => "9400",
	"app_name" => "connman",
	"jar_file_url" => "http://bamboom1:8085/browse/MC-CNM/latest/artifact/shared/Connection-Manager-Jar/connman.jar?os_username=mess&os_password=messuser"
}

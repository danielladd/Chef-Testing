name "flightcontrol_live"
description "A linux machine running flightcontrol_live (in development)"
run_list "recipe[base]", "recipe[ulimit]", "recipe[mongodb::10gen_repo]", "recipe[mongodb]", "recipe[chub_mc_app]"
default_attributes "chub_mc_app" => {
	"port" => "9200",
	"app_name" => "flightcontrol",
	"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/flightcontrol/0.1/flightcontrollive.jar"
},
"ulimit" => {
  "users" => {
	"mongodb" => {
	  "filehandle_limit" => 64000,
	  "process_limit" => 32000,
	  "memory_limit" => "unlimited"
	},
	"root" => {
	  "filehandle_limit" => 64000,
	  "process_limit" => 32000,
	  "memory_limit" => "unlimited"
	}
  }
},
"mongodb" => {
  "enable_rest" => true,
  "dbpath" => "/data/db"
}

name "mc_mongo_dev"
description "A linux machine running mongodb for missioncontrol (in development)"
run_list "recipe[base]", "recipe[ulimit]", "recipe[mongodb::10gen_repo]", "recipe[mongodb]"
default_attributes "ulimit" => {
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
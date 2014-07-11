name "rundeck_db_master"
description "role for rundeck_db_master machines"
default_attributes(
  "mysql" => {
     "server_root_password" => "password",
     "server_repl_password" => "password",
     "port" => "3306",
     "server_id" => 1,
  },
)
run_list "recipe[base::users]","recipe[chub_rundeck::mysql_master]"



name "rundeck_db_slave"
description "role for rundeck_db_slave machines"
default_attributes(
  "mysql" => {
     "server_root_password" => "password",
     "server_repl_password" => "password",
     "port" => "3306",
     "server_id" => 2,
  },
)
run_list "recipe[base::users]","recipe[chub_rundeck::mysql_slave]"

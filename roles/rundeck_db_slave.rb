name "rundeck_db_slave"
description "role for rundeck_db_slave machines"
default_attributes(
  "sensu" => {
      "rabbitmq" => {
          "host" => "sensu01.nexus.commercehub.com"
      }
  },
  "mysql" => {
     "server_root_password" => "idontknowwhatiamdoing",
     "server_repl_password" => "idontknowwhatiamdoing",
     "port" => "3306",
     "server_id" => 2,
  },
)
run_list "recipe[base::users]","recipe[chub_rundeck::mysql_slave]","recipe[chub_rundeck::mysql_backup]"

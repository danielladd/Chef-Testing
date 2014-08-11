name "rundeck_db_master"
description "role for rundeck_db_master machines"
default_attributes(
  "sensu" => {
      "rabbitmq" => {
          "host" => "monmq01.nexus.commercehub.com"
      }
  },
  "mysql" => {
     "server_root_password" => "idontknowwhatiamdoing",
     "server_repl_password" => "idontknowwhatiamdoing",
     "port" => "3306",
     "server_id" => 1,
  },
)
run_list "recipe[base::users]","recipe[chub_rundeck::mysql_master]"



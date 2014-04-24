name "rundeck_server"
description "role for pipeline team machines"
default_attributes "rundeck" => {
  "admin" => {
    "password" => "securepassword1"
   }
}
run_list "recipe[rundeck::default]"
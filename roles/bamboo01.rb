name "bamboo01"
description "Basic Bamboo Server"
default_attributes(
  "chub_log" => {
    "logfiles" => {
      "*.log" => {
        "path" => 'C:/Program Files/Bamboo/logs/*.log',
        "type" => "bamboo_log"
      }
    }
  }
)
override_attributes({
})
run_list "role[windows_base]", "role[bamboo01_logs]", "recipe[chub_log::client]" 

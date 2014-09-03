name "bambooM1"
description "Basic Bamboo Server"
default_attributes(
  "chub_log" => {
    "logfiles" => {
      "atlassian-bamboo.log" => {
        "path" => 'D:/bambooM1/logs/atlassian-bamboo.log',
        "type" => "bamboo_log"
      },
      "test.log" => {
        "path" => 'D:/bambooM1/logs/test.log',
        "type" => "bamboo_log"
      }
    }
  }
)
override_attributes({
})
run_list "role[windows_base]", "role[bambooM1_logs]", "recipe[chub_log::client]" 

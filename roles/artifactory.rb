name "artifactory"
description "Basic Artifactory Server"
default_attributes(
  "chub_log" => {
    "logfiles" => {
      "artifactory_log" => {
        "path" => '/opt/artifactory/logs/artifactory.log',
        "type" => "artifactory_log"
      },
      "test_log" => {
        "path" => '/opt/artifactory/logs/test.log',
        "type" => "artifactory_log"
      }
    }
  }
)
override_attributes({
})
run_list "role[base]", "recipe[chub_log::client]", "recipe[artifactory-master::default]"

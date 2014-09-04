name "artifactory"
description "Basic Artifactory Server"
default_attributes(
  "chub_log" => {
    "endpoint" => "lsVCenter4.nexus.commercehub.com",
    "logfiles" => {
      "artifactory_log" => {
        "path" => '/var/lib/artifactory/artifactory-powerpack-3.0.3/logs/artifactory.log',
        "type" => "artifactory_log"
      },
      "artifactory_tomcat" => {
        "path" => '/var/lib/artifactory/artifactory-powerpack-3.0.3/tomcat/logs/*.log',
        "type" => "artifactory_log"
      },
      "artifactory_test" => {
        "path" => '/var/lib/artifactory/artifactory-powerpack-3.0.3/logs/test.log',
        "type" => "artifactory_log"
      }
    }
  }
)
override_attributes({
})
run_list "role[base]", "role[artifactory_alerts]", "recipe[chub_log::client]", "recipe[artifactory-master::default]"

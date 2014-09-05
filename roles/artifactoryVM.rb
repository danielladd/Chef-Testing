name "artifactoryVM"
description "Basic Open Source Artifactory Server"
default_attributes(
  "chub_log" => {
    "endpoint" => "lsVCenter4.nexus.commercehub.com",
    "logfiles" => {
      "artifactory_log" => {
        "path" => '/opt/artifactory/logs/artifactory.log',
        "type" => "artifactory_log"
      },
      "artifactory_tomcat" => {
        "path" => '/opt/artifactory/tomcat/logs/*.log',
        "type" => "artifactory_log"
      },
      "artifactory_test" => {
        "path" => '/opt/artifactory/logs/test.log',
        "type" => "artifactory_log"
      }
    }
  }
)
override_attributes({
})
run_list "role[base]", "recipe[chub_log::client]", "recipe[artifactory-master::default]"

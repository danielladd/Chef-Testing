name "albers"
description "A windows machine running Albers"
run_list "recipe[chub_windows]", "recipe[chub_albers]", "recipe[chub_logsearch_shipper]"
default_attributes(
  "java" => {
    "windows" => {
      "url" => "http://artifactory01.nexus.commercehub.com/artifactory/java-distributions/jdk/7u51-b13/jdk-7u51-windows-x64.exe",
      "home" => 'C:\Program Files\Java\jdk1.7.0_51'
    }
  }
)

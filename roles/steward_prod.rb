name "steward_prod"
description "A windows machine running the Steward service for CSDash (prod)"
run_list "role[dev]", "recipe[chub_windows]", "recipe[chub_log::client]", "recipe[windows::reboot_handler]"
default_attributes(
     "java" => {
    "windows" => {
      "url" => "http://artifactory01.nexus.commercehub.com/artifactory/java-distributions/jdk/7u51-b13/jdk-7u51-windows-x64.exe",
      "home" => 'C:\Program Files\Java\jdk1.7.0_51'
    }
  },
  "chub_log" => {
    "logfiles" => {
      "steward" => {
         "path"=>"c:\\null.txt",
         "type" => "noop"
      }
    }
  }
)
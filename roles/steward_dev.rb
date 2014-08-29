name "steward_dev"
description "A windows machine running the Steward service for CSDash (dev)"
run_list "role[dev]", "recipe[chub_windows]", "recipe[chub_log::client]", "recipe[windows::reboot_handler]"
default_attributes(
     "java" => {
    "windows" => {
      "url" => "http://artifactory01.nexus.commercehub.com/artifactory/java-distributions/jdk/7u51-b13/jdk-7u51-windows-x64.exe",
      "home" => 'C:\Program Files\Java\jdk1.7.0_51'
    }
  }
)

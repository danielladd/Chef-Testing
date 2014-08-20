name "dev"
description "Development Environment"
default_attributes(
  "elasticsearch" => {
    "version" => "1.1.0",
    "cluster" => {
      "name" => "vagrant"
    }
  }, 
  "chub_logstash" => {
    "endpoint" => "lsdev.nexus.commercehub.com",
    "esgateway" => "esdev.nexus.commercehub.com"
  }
)
name "sensu_logs"
description "role for the logstash server defining the sensu logs and parsing rules"
default_attributes(
  "chub_log" => {
    "endpoint" => "lsdev.nexus.commercehub.com",
    "endpoint_port" => "2352",
    "logfiles" => {
      "sensu_server_log" => {
        "path" => '/var/log/sensu/sensu-server.log',
        "type" => "sensu_server_log",
        "format" => "json"
      },
      "sensu_api_log" => {
        "path" => '/var/log/sensu/sensu-api.log',
        "type" => "sensu_api_log",
        "format" => "json"
      },
      "sensu_dashboard_log" => {
        "path" => '/var/log/uchiwa.log',
        "type" => "sensu_dashboard_log"
      }
    }
  }
)

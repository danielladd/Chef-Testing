name "sensu_redis_logs"
description "role defining a sensu redis logs"
default_attributes(
  "chub_log" => {
    "logfiles" => {
      "redis_log" => {
        "path" => '/var/log/redis*.log',
        "type" => "redis_log"
      }
    },
    "types" => {
      "redis_log" => {
        "name" => "redis_log",
        "body" => " grok {\n    match => [ \"message\", \"\\[%{NUMBER:id}\\] (?<timestamp>%{MONTHDAY} %{MONTH} %{TIME}) [\\*#] %{GREEDYDATA:log_message}\" ]\n  }\n"
      }
    }
  }
)

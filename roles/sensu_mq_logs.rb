name "sensu_mq_logs"
description "role defining a sensu mq node, auto clustering should be enabled just apply this and it should join cluster"
run_list *%w[
]
default_attributes(
  "chub_log" => {
    "endpoint" => "lsdev.nexus.commercehub.com",
    "endpoint_port" => "2352",
    "logfiles" => {
      "rabbitmq_log_01" => {
        "path" => '/var/log/rabbitmq/rabbit@monmq01.log',
        "type" => "rabbitmq_log"
      },
      "rabbitmq_log_02" => {
        "path" => '/var/log/rabbitmq/rabbit@monmq02.log',
        "type" => "rabbitmq_log"
      }
    },
    "types" => {
      "rabbitmq_log" => {
        "name" => "rabbitmq_log",
        "body" => " multiline {\n          pattern => \"=.*\"\n          what => \"previous\"\n          negate => \"true\"\n        }\n  grok {\n    match => [ \"message\", \"(?m)=%{GREEDYDATA:log_level}==== %{GREEDYDATA:timestamp} ===\\n%{GREEDYDATA:log_message}\" ]\n  }\n"
      }
    }
  }
)

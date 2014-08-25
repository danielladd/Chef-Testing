name "sensu_mq_logs"
description "role defining a sensu mq node, auto clustering should be enabled just apply this and it should join cluster"
run_list *%w[
]
default_attributes(
  "chub_log" => {
    "endpoint" => "MAC-QA-LZ",
    #"endpoint" => "lsdev.nexus.commercehub.com",
    "endpoint_port" => "2352",
    "logfiles" => {
      "rabbitmq_log" => {
        "path" => '/var/log/rabbitmq/rabbit@monmq01.log',
        "type" => "rabbitmq_log"
      },
      "rabbitmq_log" => {
        "path" => '/var/log/rabbitmq/rabbit@monmq02.log',
        "type" => "rabbitmq_log"
      }
    },
    "types" => {
      "rabbitmq_log" => {
        "name" => "rabbitmq_log",
        "body" => " multiline {\n          pattern => \"=.*\"\n          what => \"previous\"\n          negate => \"true\"\n        }\n  grok {\n    match => [ \"message\", \"(?m) %{GREEDYDATA:log_level}\" ]\n  }\n"
      }
    }
  }
)

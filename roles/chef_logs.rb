name "chef_logs"
description "role for machines with chef logs"
default_attributes(
  "chub_log" => {
    "types" => {
      "chef_nginx" => {
        "name" => "chef_nginx",
        "body" => "  grok {\n    match => [ \"message\", \"%{IPORHOST:clientip} %{USER:ident} %{USER:auth} \\[%{HTTPDATE:timestamp}\\]  \\\"(?:%{WORD:verb} %{NOTSPACE:request}(?: HTTP/%{NUMBER:httpversion})?|%{DATA:rawrequest})\\\" %{NUMBER:response} %{QS:request_time} (?:%{NUMBER:bytes}|-) %{QS:referrer} %{QS:user_agent} \\\"%{URIHOST:upstream_addr}\\\" %{QS:upstream_status} %{QS:upstream_response_time} %{QS:chef_version} %{QS:chef_ops_sign} %{QS:chef_ops_userid} \\\"%{TIMESTAMP_ISO8601:chef_timestamp}\\\" %{QS:chef_hash} %{POSINT:request_length}\" ]\n  }\n"
      }
    }
  }
)

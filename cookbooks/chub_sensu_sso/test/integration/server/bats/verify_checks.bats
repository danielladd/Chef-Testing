#!/usr/bin/env bats

load test_helper

@test "openldap syncrepl check is correct" {
  run cat /etc/sensu/conf.d/checks/check-openldap-syncrepl.json
  assert_output <<OUT
{
  "checks": {
    "check-openldap-syncrepl": {
      "command": "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-syncrepl.rb --port 636 --base dc=vault,dc=commercehub,dc=com --retries 5 --user cn=searchrole,dc=vault,dc=commercehub,dc=com --password search --hosts ldap01.example.com,ldap02.example.com",
      "handlers": [
        "default"
      ],
      "subscribers": [
        "monitor"
      ],
      "interval": 60,
      "occurrences": 2
    }
  }
}
OUT
}

@test "loadbalancer urls are checked" {
  run cat /etc/sensu/conf.d/checks/check-lb-app1.json
  assert_output <<OUT
{
  "checks": {
    "check-lb-app1": {
      "command": "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb --url http://app1.example.com/ping --response-code 200",
      "handlers": [
        "default"
      ],
      "subscribers": [
        "monitor"
      ],
      "interval": 60,
      "occurrences": 3
    }
  }
}
OUT
  run cat /etc/sensu/conf.d/checks/check-lb-app2.json
  assert_output <<OUT
{
  "checks": {
    "check-lb-app2": {
      "command": "/usr/bin/ruby1.9.3 /etc/sensu/plugins/check-http.rb --url https://app2.example.com/ --response-code 200",
      "handlers": [
        "default"
      ],
      "subscribers": [
        "monitor"
      ],
      "interval": 60,
      "occurrences": 3
    }
  }
}
OUT
}

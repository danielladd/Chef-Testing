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

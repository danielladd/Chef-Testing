chub_log Cookbook
=================
This is a wrapper cookbook used for shipping logs to logstash.  Included is also a vagrantfile for testing logstash parsing rules.


Requirements
------------
#### packages
- `chub_nxlog` - chub_log needs chub_nxlog as that is how it ships logs
- `chub_logsearch_shipper` - chub_log uses chub_logsearch_shipper simply to remove that deprecated recipe.  This dependency will be removed soon

Attributes
----------
TODO: List you cookbook attributes here.

Usage
-----
#### chub_log::client

Just include `chub_log::client` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chub_log]"
  ]
}
```

You will also need to set a few attributes to define what logs you want to ship to logstash

```
"chub_log" => {
    "logfiles" => {
      "app123_log" => {
        "path" => '/var/log/app123/app123.log',
        "type" => "app123_log"
      },
     "app1234_service_log" => {
        "path" => '/var/log/app123/app123_service.log',
        "type" => "app123_service_log"
      },
```

#### Vagrantfile

The vagrantfile included in this cookbook should be used when testing logstash parsing rules.  Incorrect parsing rules can take down a logstash node.  We should be using this vagrantfile when testing new rules before pushing to the production logstash cluster.

Set your chub_log `chub_log.endpoint` to your vagrant instance to direct logs through your local logstash for parsing. After that configure your parsing rules in the vagrant file and watch the parsing magic start, or your CPU hit 100 as you have a bad rule.

```
"chub_log" => {
  "types" => {
    "app123_log" => {
        "name" => "app123_log",
        "body" => " grok {\n    match => [ \"message\", \"(?m)%{DATE:date} %{TIME:time} %{GREEDYDATA:thread} %{LOGLEVEL:level}  %{JAVACLASS:class} - %{GREEDYDATA:content}\" ]\n  }\n"
      },
  }
}
```

License and Authors
-------------------
Authors: 
* Larry Zarou
* David Cross

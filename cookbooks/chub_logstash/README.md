chub_logstash Cookbook
======================
Do Logstash stuff.


Requirements
------------
chub_logstash::default will run on Unix or Windows

chub_logstash::server requires a Unix, and depends on Elasticsearch


Attributes
----------
TODO: List you cookbook attributes here.

e.g.
#### chub_logstash::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chub_logstash']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>


Usage
-----
#### chub_logstash::default
Installs the Logstash Shipper

Include `chub_logstash` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chub_logstash]"
  ]
}
```

#### chub_logstash::server
Installs the Logstash Server


License and Authors
-------------------
Authors: 

* David Cross
* H. "Waldo" Grunenwald

chub_elasticsearch Cookbook
===========================
Handles some specific setup for CHUB elasticsearch nodes

Requirements
------------
Elasticsearch

Attributes
----------
None yet

Usage
-----
Just include `chub_elasticsearch` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chub_elasticsearch]"
  ]
}
```

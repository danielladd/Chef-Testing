base Cookbook
=============
Basic standard configs common to all systems.



Requirements
------------
Network access

Attributes
----------
None

Usage
-----
#### base::default

Just include `base` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[base]"
  ]
}
```

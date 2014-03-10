chub-batchagent Cookbook
========================
This cookbook deploys and configures the batchagent

Requirements
------------
TODO:  
* Cleanup the TODO currently in the app. 
* Finalize cookbook by adding a default recipe, uncomment the include of batchagent recipe. 
* Upload to chef server.
* Still some user stuff to play around with, making a user account for system.

Attributes
----------
TODO: List cookbook attributes here.


Usage
-----
#### chub-batchagent::default

Just include `chub-batchagent` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chub-batchagent]"
  ]
}
```

License and Authors
-------------------
Authors: lzarou@commercehub.com

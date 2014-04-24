chub_onboarding_webservice Cookbook
========================
This cookbook deploys and configures the onboarding_webservice

Requirements
------------
TODO:  
* Cleanup the TODO currently in the app. 
* Finalize cookbook by adding a default recipe, uncomment the include of onboarding_webservice recipe. 
* Upload to chef server.
* Still some user stuff to play around with, making a user account for system.

Attributes
----------
TODO: List cookbook attributes here.


Usage
-----
#### chub_onboarding_webservice::default

Just include `chub_onboarding_webservice` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chub_onboarding_webservice]"
  ]
}
```

License and Authors
-------------------
Authors: estegmann@commercehub.com

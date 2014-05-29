name "buyspace_api"
description "role defining buyspace api"
default_attributes "chub-buyspace" => {
    "taskScheduler" => {
      "enabled" => false
    }
}
run_list "role[base]", "recipe[chub-buyspace::upgrade_buyspace]"
name "buyspace_api"
description "role defining buyspace api"
default_attributes "chub-buyspace" => {
    "taskScheduler" => {
      "enabled" => false
    },
    "role" => {
      "isApi" => true
    }
}
run_list "role[base]", "recipe[chub-buyspace::upgrade_buyspace]"
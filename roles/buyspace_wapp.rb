name "buyspace_wapp"
description "role defining buyspace web app node"
default_attributes "chub-buyspace" => {
    "taskScheduler" => {
      "enabled" => false
    }
}
run_list "role[base]", "recipe[chub-buyspace::upgrade_buyspace]"

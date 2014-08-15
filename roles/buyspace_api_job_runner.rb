name "buyspace_api_job_runner"
description "role defining buyspace api and runs jobs"
default_attributes "chub-buyspace" => {
    "taskScheduler" => {
      "enabled" => true
    },
    "role" => {
      "isApi" => true
    }
}
run_list "role[base]", "recipe[chub-buyspace::upgrade_buyspace]"
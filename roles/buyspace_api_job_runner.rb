name "buyspace_api_job_runner"
description "role defining buyspace api and runs jobs"
default_attributes "chub-buyspace" => {
    "taskScheduler" => {
      "enabled" => true
    }, 
    "grails" => {
      "serverURL" => "http://mpqa1-api.commercehub.com",
      "apiServerURL" => "http://mpqa1-api.commercehub.com"
    }   
}
run_list "role[base]", "recipe[chub-buyspace::upgrade_buyspace]"
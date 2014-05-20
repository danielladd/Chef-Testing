name "buyspace_api_job_runner"
description "role defining buyspace api and runs jobs"
default_attributes "chub-buyspace" => {
    "api" => "true",
    "jobRunner" => "true"
}
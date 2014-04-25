name "rundeck_client"
description "role for rundeck_client machines"
override_attributes(
  "ssh_keys" => {
    "rundeck-ssh" => "rundeck-ssh",
  }
)
run_list "recipe[base::users]"
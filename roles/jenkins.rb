name "jenkins"
description "Basic Jenkins Server"
default_attributes(
  "chub_log" => {
    "logfiles" => {
      "jenkins_log" => {
        "path" => 'D:/ci/jenkins.err.log',
        "type" => "jenkins_err_log"
      },
      "test.log" => {
        "path" => 'D:/ci/test.log',
        "type" => "jenkins_err_log"
      }
    }
  }
)
override_attributes({
})
run_list "role[windows_base]", "recipe[chub_log::client]" 

name "berkshelf_api"
description "role defining a berkshelf api server."
run_list *%w[
    recipe[chub_berkshelf_api::default]
]
#TODO: Should this live in databag?
default_attributes "berkshelf_api" => {
    "config" => {
      "endpoints" => [
        {
          "type" => "chef_server",
          "options" => {
            "url" => "https://chef.nexus.commercehub.com/",
            "client_key" => "/etc/berkshelf/api-server/client.pem",
            "client_name" => "berkshelf"
          }
        }
      ]
    },
  }

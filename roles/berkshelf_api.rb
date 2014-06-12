name "berkshelf_api"
description "role defining a berkshelf api server."
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
    "host" => node[:fqdn],
    "home_path" => node[:berkshelf_api][:home]
  }
run_list "recipe[chub_berkshelf_api::default]"
name "dev"
description "Development Environment"
default_attributes(
  "elasticsearch" => {
    "version" => "1.1.0",
    "cluster" => {
      "name" => "esdev1"
    }
  }
)


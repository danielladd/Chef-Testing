name "elasticsearch"
description "an elasticsearch cluster node"
run_list "recipe[java]", "recipe[elasticsearch::search_discovery]", "recipe[elasticsearch]"

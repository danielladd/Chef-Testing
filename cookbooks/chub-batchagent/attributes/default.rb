default['java']['install_flavor'] = 'oracle'
default['java']['oracle']['accept_oracle_download_terms'] = true
default['java']['jdk_version'] = 7
default["chub-batchagent"]["deployDir"] = "/opt/batchagent"
default["chub-batchagent"]["stagingDir"] = "/opt/staging"
default["chub-batchagent"]["jarName"] = "batchagent-deploy.jar"
default["chub-batchagent"]["propertyFileName"] = "batchagent-deploy.properties"
default["chub-batchagent"]["instanceName"] = "BatchAgent001"
default["chub-batchagent"]["departmentConfiguration"] = ""
default["chub-batchagent"]["jmxPort"] = 8999
default["chub-batchagent"]["batchAgentImpl"] = "ActorModelBatchManager"
default["chub-batchagent"]["jmxHeapMax"] = 256
default["chub-batchagent"]["permGenMax"] = 96
default["chub-batchagent"]["debugString"] = "" 
default["chub-batchagent"]["hornetqHost"] = "OVERRIDE_ME_PLZ"
default["chub-batchagent"]["deployJarUrl"] = "OVERRIDE_ME_PLZ"

# Database
default["chub-batchagent"]["database"]["default"]["server"] = "OVERRIDE_ME_PLZ"
default["chub-batchagent"]["database"]["default"]["name"] = "OVERRIDE_ME_PLZ"
default["chub-batchagent"]["database"]["default"]["user"] = "OVERRIDE_ME_PLZ"
default["chub-batchagent"]["database"]["default"]["pass"] = "OVERRIDE_ME_PLZ"

default["chub-batchagent"]["database"]["log"]["server"] = "OVERRIDE_ME_PLZ"
default["chub-batchagent"]["database"]["log"]["name"] = "OVERRIDE_ME_PLZ"
default["chub-batchagent"]["database"]["log"]["user"] = "OVERRIDE_ME_PLZ"
default["chub-batchagent"]["database"]["log"]["pass"] = "OVERRIDE_ME_PLZ"


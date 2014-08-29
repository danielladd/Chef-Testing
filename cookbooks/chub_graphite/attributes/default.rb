#default[:chub_graphite][:]
default[:graphite][:web][:ldap][:SERVER] = 'nexus.commercehub.com'
default[:graphite][:web][:ldap][:BASE_USER] = 'CN=service-graphite,OU=graphite,OU=applications,DC=nexus,DC=commercehub,DC=com'
default[:graphite][:web][:ldap][:BASE_PASS] = 'CH$rvGr@p'
default[:graphite][:web][:ldap][:USER_QUERY] = '(sAMAccountName=%s)'
default[:graphite][:web][:ldap][:SEARCH_BASE] = 'OU=staff,DC=nexus,DC=commercehub,DC=com'

#Storage Schemas
default["graphite"]["storage_schemas"] = [
  {
    :catchall => {
      :priority   => "100",
      :pattern    => "^\.*",
      :retentions => "10s:8h,1m:8d,15m:31d,1h:396d"
    }
  }
]

#Storage Aggregation
default["graphite"]["storage_aggregation"] = [
  {
    :min => {
      :pattern            => "\\.min$",
      :xFilesFactor       => "0.1",
      :aggregationMethod  => "min"
    }
  },
  {
    :max => {
      :pattern            => "\\.max$",
      :xFilesFactor       => "0.1",
      :aggregationMethod  => "max"
    }
  },
  {
    :sum => {
      :pattern            => "\\.count$",
      :xFilesFactor       => "0",
      :aggregationMethod  => "sum"
    }
  },
  {
    :default_average => {
      :pattern            => ".*",
      :xFilesFactor       => "0.3",
      :aggregationMethod  => "average"
    }
  }
]
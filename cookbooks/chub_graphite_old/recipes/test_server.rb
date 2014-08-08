node.set["graphite"]["storage_schemas"] = [
	{
		:catchall => {
			:priority   => "100",
			:pattern    => "^\.*",
			:retentions => "1m:31d"
		}
	}
]

include_recipe "python"
include_recipe "logrotate"

include_recipe "graphite::whisper"
include_recipe "graphite::dashboard"
include_recipe "graphite::carbon"
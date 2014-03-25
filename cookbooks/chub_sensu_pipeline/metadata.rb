name             'chub_sensu_pipeline'
maintainer       'Larry Zarou'
maintainer_email 'lzarou@commercehub.com'
license          'All rights reserved'
description      'Installs/Configures Sensu in the CommerceHub way for Pipeline'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "sensu"
depends "base"
depends "partial_search"

attribute "chub_sensu_pipeline/email/recipient",
    :display_name => "Email notification recipient",
    :description => "The email address which will receive email notifications",
    :type => "string"

attribute "chub_sensu_pipeline/pagerduty/api_key",
    :display_name => "Pager Duty Service API Key",
    :description => "If planning to integrate with Pager Duty the API key to be used",
    :type => "string",
    :required => "optional"

attribute "graphite/host",
    :display_name => "Graphite Server Host",
    :description => "If planning to integrate with Graphite the hostname for the server to be used",
    :type => "string",
    :required => "optional"

attribute "graphite/port",
    :display_name => "Graphite Server Port",
    :description => "If planning to integrate with Graphite the port for the server to be used",
    :type => "string",
    :required => "optional"

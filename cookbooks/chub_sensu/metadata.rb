name             'chub_sensu'
maintainer       'Larry Zarou'
maintainer_email 'lzarou@commercehub.com'
license          'All rights reserved'
description      'Installs/Configures Sensu in the CommerceHub way'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.23'

depends "sensu"
depends "rabbitmq"
depends "redisio"
depends "base"
depends "partial_search"
depends "xinetd"
depends "uchiwa"
depends "sensu-admin"

attribute "chub_sensu/email/recipient",
    :display_name => "Email notification recipient",
    :description => "The email address which will receive email notifications",
    :type => "string"

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

attribute "chub_sensu/email/subscriptions_mail_to",
    :display_name => "Subscriptions Mail To",
    :description => "A hash of mail_to addresses for a given subscription",
    :type => "hash",
    :required => "optional"

attribute "chub_sensu/email/subscriptions_mail_to/<subscription_name>",
    :display_name => "A subscription name and mail_to value",
    :description => "A subscription name and corresponding mail_to address as the value",
    :type => "string",
    :required => "optional"

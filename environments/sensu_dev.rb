name 'sensu_dev'
description 'Sensu Development Env'
default_attributes(
  sensu: {
    init_stye: 'runit',
    rabbitmq: {
      host: 'monmq.nexus.commercehub.com'
    },
    redis: {
      host: 'monredis.nexus.commercehub.com',
      port: '6379'
    },
    api: {
      host: 'monapp.nexus.commercehub.com'
    }
  },
  redisio: {
    sentinel: {
      mange_config: false
    }
  },
  rabbitmq: {
    cluster: true,
    erlang_cookie: 'c00k1e'
  },
  chub_log: {
    endpoint: 'lsdev.nexus.commercehub.com',
    endpoint_port: '2352'
  },
  graphite: {
    host: "stats02.nexus.commercehub.com",
    port: "2003"
  },
  chub_sensu: {
    email: {
        recipient: "noreply@commercehub.com",
        subscriptions_mail_to: {
            pipeline_team: "pipeline@commercehub.com",
            rhodecode: "mercurial-admin@commercehub.com",
            platform_team: "jlazzara@commercehub.com,mmiller@commercehub.com",
            missioncontrol_team: "CCucinella@commercehub.com,LKulzer@commercehub.com",
            artifactory_prod: "artifactory_admins@commercehub.com",
            artifactory_alerts: "bcarr@commercehub.com",
            rundeck_mysql_master: "pipeline@commercehub.com",
            rundeck_mysql_slave: "pipeline@commercehub.com",
            apartment: "rolodex@commercehub.com",
            oddrest: "rolodex@commercehub.com",
            rolodex: "rolodex@commercehub.com"
        }
    },
    pagerduty: {
      api_key: "",
      keys: {
        apartment: {
          api_key: "726a0e6e51c045faaf74c5ab8b3e2628"
        },
        oddrest: {
          api_key: "726a0e6e51c045faaf74c5ab8b3e2628"
        },
        rolodex: {
          api_key: "726a0e6e51c045faaf74c5ab8b3e2628"
        },
        pipeline_team: {
          api_key: "0e7c4f5662144f9991def44c23b41146"
        },
      }
    }
  }
)
override_attributes(
  uchiwa: {
    version: '0.2.3-1',
    settings: {
      user: '',
      pass: ''
  },
  api: [
      {
        name: 'Sensu',
        host: 'monapp.nexus.commercehub.com',
        ssl: false,
        port: 4567,
        user: '',
        pass: '',
        path: '',
        timeout: 5000
      }
    ]
  }
)

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
  }
)
override_attributes(
  uchiwa: {
    version: '0.2.1-1',
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

name "rundeck_server"
description "role for rundeck_server machines"
default_attributes "rundeck" => {
  "admin" => {
    "password" => "securepassword1"
  },
  "ssh_keys" => {
    "rundeck-ssh" => "rundeck-ssh",
  },
  "chef" => {
    "client_name" => "rundeck",
    "client_key" => "-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAtPfnWCD9tlQf0BjN+HQDifBY8HE/IXD2zIPdtKAJakaX09az
UaiCv6kY8uOKsJWsweEHOEMYHRIEnQ7EP4z01VR5wt2I32Qys4QRDyXojKGfuIJz
Agkzuw6UFugx2LMB05ognklqZVxccAu/XMtqBzjk4UwjbvzaLrCW7jmWzS6PkjkA
6WbEUld7cUv9NbCoSWY9KeP6B4hMJR/h2I6chT5QezvT6BJCL8lui4bh0DXr2rXc
fwAUAFvI0IrhDFWGdefcEJ/GdTXWs/D8T2G0UYWsjdKTH/KAliPFBC6mrGH0incL
F613amlhHTqt+H3pOT1QS0jAIUePYIWQVlAMxwIDAQABAoIBAFZDdbvEviwTnbaM
nGI6qxUtxLeYxAck2gBTO3PGdbZ7QBRy27epI+pIqOPfI1VZg6hHpDFlijERTbGw
QEwq3Op0Ajapc31JPgHkil02LMwcnw5M4JWv3UDliiIBPQGXEt/TMIlDZbw7crTW
ZLnPHROkQzZCHQHi9f4bn1afjQrwwaHBwtanAgbj0gBkR/+X1PfSzKmPagdHF1VX
hp001hWg68JvtmR7HYWoKghFzM8Wb8x+aO2COrr5tUbZ6limIb6BdHJni0j9yCd1
k0Q5vN332JXqJ33yDWRcHoiLEvXySz6CAFC65U4QVe6MXQMu9QEsD2EP4xdNBoXM
3KrGS4ECgYEA3hkDUqg98Tz7sgxVHUrypgsfq4y48ztTWR/n2CQLY7We7hVZH08n
PUGzX9B+37PyT/1ZJ+rUhsmSD/1HUH2XC2tJ/WCNJ9qR3FJWfKZntd7JCQWXN+AV
KN7+JZ9K8VHXIUe+IVBsFhjmuOSyp7shpVc3VJ2ESYwa3HH16A5bXs8CgYEA0Jeq
dy7rZF/64tyN6i17CaduUzvIVXoOBRPpuv97QzbiC2BZr0C7RwFQNYln8SgacryI
YzDChwJOV3fzHc/WlgNQSrGtz9U9XzsCUY8KX81+oj1HHMXZtavsoUHNpw3MLQBm
tuI9Eco4WSsSx4FgQzntMrRlCzUAZngjNLUEsIkCgYAwbj3mQV+4gjbUfZH14EkH
YjeWvgn6qD4lmiqBXGLLbGhqvGcBx83jsrb9tsZj26aEQNe3N6L+fWgHapCpgal1
SQEKaop9XVEfPSk050iIRTuLZxexjICwt+etpo2+D72cuTtBonrfWrC9Msmuf8T3
fAxJvEuDijS1S3h3EOJlywKBgQCbANkPj7Ij+J66jiJ27i0L03tMJpSL0BMy+sUo
zEiQfewjgAmlDXkdHoC4B89RiPd+Y1MGQmmLYc9NeDkU4ikXeIblunrqgg8FARiL
+rs+zblYXijF3NAXDBbfDcMAbGRY3H93T08KNTcCK9vcnOsniZgVoa+kUFJn0sZ2
mD1P4QKBgGrP6CGFoqSHdvICddWG5ma7dfD1pgdyLxMSXB2r9vsdXBoRh8/8gLNa
eub7aI6YSxFEDwFnLheZpu9vIPB+ghbRLTRM0ADZN6HqWdxwZCS39GDkkn11FMnD
g9GYROLuvP1jps8rDgaikJ0uWWSZbu88VmqN1IOAJ7a2IYv9NOEY
-----END RSA PRIVATE KEY-----
"
   }
}
run_list "recipe[base::users]","recipe[chub_rundeck::server]"
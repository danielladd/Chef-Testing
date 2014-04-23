base Cookbook
=============
Basic standard configs common to all systems.



Requirements
------------
Network access

Attributes
----------
None

Usage
-----
#### base::default

Just include `base` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[base]"
  ]
}
```

#### base::users

The users recipe will add the users from the data_bag `users` to a given node if they appear in that nodes ssh_keys attribute.  The ssh_keys attribute you can set on a node serves two purposes.  It will provide a list of users which shoule be created on the machine.  This is dervived from the keys of the hash.  The values of each key dictate which ssh_keys are added to the authorized users file for the hashes key(user).  

For any key of the hash below, if it has a corresponding json file in the users data_bag that user will be created on the machine.  Expanding on that, in the example below the public key for lzarou will be added to the authorized_keys file for lzarou.  The key with root will not create a root user as a root user is not defined in the data_bag but it will add both the public keys for lzarou and wgrunenwald to the root users authorized_keys file.  

```json
"ssh_keys": {
        "lzarou": "lzarou",
        "wgrunenwald": "wgrunenwald"
        "root": ["lzarou","wgrunenwald"]
        "kstahl": "",
        "bcarr": ""
}
```

##### Sample User File
You will want to add your user file to the users data_bag on the chef server.  There are several fields of interest here.  The password field is discussed below.  The ssh_keys field should be populated with the public key that you would like added to the authorized_keys file for a given user. 

```json
{
  "id": "lzarou",
  "user": "lzarou",
  "password": "$1$83ZCpCC1$RqDOLK374Bvf4EVphVCfT/",
  "group":["adm","sudo","sambashare"],
  "system":false,
  "shell": "/bin/bash",
  "ssh_keys": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDnSkReDWZAfM6oDRkr3EE9hStjrO+d//mcwQfHQz2h2sJGDVjSU3pzua1eNVNMueLSoxOfD3nx1PVuc4SIECHbwj9RcKQgAmR+MP4ElZDhRsByviiwuGGsGOULLOnSzeWNFO8UxHkcQ/Z6rnpn0+n8WabswZlE4341NtD2dmlIX0RMagZewcvRwWxwR2V9NFj+nx1evG3NFErJ4clqKB7217yb20vch6Di/04vvjRIab1DOHC+d/kubSc9e2uc82h1azxdeizPW0v/M3/5wgx8zU9k183sCS8tXIRk4iS2xdUJJvvWqBxxzhw1DD63eG1jun1I7NJxoecWDFaDwhWH lzarou"
}
```


The password is a password shadow hash and can be created by following the instructions on the [user resource](http://docs.opscode.com/resource_user.html) page for chef.  With OpenSSL installed the command is 
as follows

```
openssl passwd -1 "theplaintextpassword"
```

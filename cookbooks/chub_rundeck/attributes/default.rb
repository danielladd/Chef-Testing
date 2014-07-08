# Database Stuffs

default[:chub_rundeck][:dbmaster] = "orchdb01"
default[:chub_rundeck][:dbslave] = "orchdb02"


# WinRMPlugin
default[:chub_rundeck][:winrm_plugin_url] = "http://artifactory01/artifactory/ThirdPartyProd/org/rundeck-plugins/rundeck-winrm-plugin/1.1/rundeck-winrm-plugin-1.1.jar"


# Rundeck Properties SSH
default[:rundeck][:ssh][:private_key] = "
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAu8tn02Hw6UBXkGhEiGC8//esPen0VQkdQWJkJ128Kc3J4GdD
j/QIpIAM/nC3TA15Qc4AC5w1bVP1NRiIQ+ribHsf7skrT8FSGoElgcNbrT1Pggd5
QR+UaSw5xmA6bTmlODDYR/8KXNe1ROHlQ749ukGbDtxPMD+WMSTrw3jaJoNxRy85
vYwv4TCYlDU6uT4isC5ewTVtbYlFMFJS8EzsmvWHteziVZ6IAZp6CHeCSrXehaI9
R/7LZGO++CX75j4DgmP6ysdDrtEznjkmpEzFK3zIool1dt2fzZAJ/7uSHx4kcsZy
JC0EvGGAAMASTptdmHXV5uQC5st7+XxFSuN9uQIDAQABAoIBACF67hO9jlnHYtUY
Ab/en1NzMH4JS8otSc3yYLC0AWviiG89ecocU74gJjDmn4crj8avl0p6mvvW0Ayb
Rw/0vFFi0hqcOuCJMr4O8ETmM137ZEVmV7PIkYj+nX5EgaYfdNlDvAt56LsMqgCR
1XHyZMbkE2Te2i9b5sb0MiQzU5Ex56w3+E9TbUXKMATvCSlf5eYSKXqUBN1CGIgt
N1iefzJf4Xppglgpi5Vd3bRX3IZw5c/rRkW2jsY4lpZGo6c+ykvipg39yNp7nuzh
zEGTK4DRfuR8p6GRqPTjSHROGRmvf38PDHkkRaB2E8qE8xVanN/kGttA1Smk9m+T
5TGmahECgYEA5KIzAj7LPhmo3vUyhoP+BMpKmuJwfYj7+jpSSDyS3C40w/4Wwo6U
08i0NeaJurQm5sj0dAmeMNCNCV/1lyb+kB6pxCrya501OHCNXQZlU0cUFm5mEyAE
PqJLsikSL/Jinp+3K05gq+ZlcTWnv9zpouxBa54nApo5iU7cqNZ/cusCgYEA0kXQ
j1O6RUZb3WXjog6qRCdxqoaRxE6e3pYrhbXKMbWaYYJ8MArJd/LuFij+UyZvJf5i
zgrTfaOKWyxzfASxnQxUEaAvfYeQYbUmBaovuauu5y7jwQfbKimCRqt8evtgnOfc
zjyVxgVRPVFYWkgHCvwcsRy/y+xLIc4+DLBvAOsCgYEAq0fcIN18E2zTtxxIGr/9
aAdIdtoW3eTmqKJSjC1c9DhlbUMIN/7q/fIJF6w7GDToQ9LeV6Pw7679Sb2q1e7v
nHZsRjrKW9ZtTXf8X2lwNUA1i0xvifpdU7LwNGtSZbsXKLCMX5QbFgzHiFVi83iD
S3vk0sOrg+aYHgaHhrESz7sCgYAWXBgudY/UOAQiyefn3rlaX/tlT8QGZPnd34gn
QsqKeK4++josfako2StaLefFfcvJ9YAaOup8bLyUr2hkYrdkZOA3s5n5NkYzLakq
ZwuGKeyCZukPKL+0fw98ZlXpWfvPE5TWVXjzwrL92z2S9B/TmjWO2+jFTY47vQu6
G7TiGwKBgQDXlyWPcecJ9XtlfPG+VFvSGV45mjcSw/ePUZvW2q6G17A7gLsJo45x
arvJwEkijZIjDJBnhjfO8aCj5BcetSkNeRvTAqZwRCIgNErdx0N2hdWO9nWqEq8h
7WI6y+O1aXP8EXmk5ONI4AgK0Uu4ALFOPmoF0VDtZH66Pq6YeaI+RA==
-----END RSA PRIVATE KEY-----"


default[:chub_rundeck][:resources]

# Override default prop from rundeck to remove the admin.aclpolicy file
override[:rundeck][:stub_config_files] = %w{ log4j.properties jaas-loginmodule.conf apitoken.aclpolicy }
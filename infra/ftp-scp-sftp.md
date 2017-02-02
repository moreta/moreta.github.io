scp & sftp
==============

## 共通

+ SSH protocolを使う

# scp

## upload

local -> remoteへ

```sh
scp -i /your/.ssh/key.pem  file.txt server_user@host:/upload/directory
scp file.txt server_user@host:/upload/directory
```

## download

remote -> localへ

```sh
scp -i /your/.ssh/key.pem server_user@host:/upload/directory/file.txt ./
scp server_user@host:/upload/directory/file.txt ./
```


# References

+ [SCPとSFTPの違い](https://www.skyarch.net/blog/?p=379)

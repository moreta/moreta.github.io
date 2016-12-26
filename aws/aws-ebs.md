


# AMIから新規で立ち上げる際にEBSのsizeを変更したが反映されていないとき

<http://blog.serverworks.co.jp/tech/2013/10/29/how-to-change-root-volume-size/>


```sh
sudo resize2fs /dev/xvxx

df -h

ファイルシス   サイズ  使用  残り 使用% マウント位置
/dev/xvda1       7.8G  1.3G  6.4G   17% /
devtmpfs          15G   64K   15G    1% /dev
tmpfs             15G     0   15G    0% /dev/shm
/dev/xvxx         99G   60M   94G    1% /your_mount
```

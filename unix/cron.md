# list

```sh
crontab -l
```

# 編集

```sh
crontab -e
```


# 全ユーザーのcronジョブ一覧を表示する

```sh
for user in $(cut -f1 -d: /etc/passwd); do echo $user; crontab -u $user -l; done
```

# References

+ [全ユーザーのcronジョブ一覧を表示する](http://qiita.com/ironsand/items/fb05869080f6ed724816)

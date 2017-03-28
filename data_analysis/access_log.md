

# ipアドレス事のカウント

```
cat /path/to/access.log | grep 'GET / HTTP/1.1' | cut -d ' ' -f 1 | sort | uniq -c
```

# リクエスト数

## 分別リクエスト数

```
grep 27/Mar/2017:05 access_log | awk '{print $4}' | cut -b 2-18 | sort | uniq -c
```

## 秒別リクエスト数

```
grep 27/Mar/2017:05:18 access_log | awk '{print $4}' | cut -b 2-21 | sort | uniq -c
```

# Referecnes

+ [Apache ログを awk と uniq だけで集計する](http://qiita.com/bezeklik/items/f5c292c4360cde140bef)
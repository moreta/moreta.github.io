
# directory size

```sh
du -s directory_name
```
Or to get human readable output:

```sh
du -sh directory_name
```

## 特定size以上のdirectoryを探す


```sh
du -s *|awk '{ if ($1 > 3000) print }'
```
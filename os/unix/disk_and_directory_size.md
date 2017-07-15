Unix disk関連
===============

# disk, driveの使用量を表示する

```sh
df -h # -h, --human-readable | print sizes in human readable format (e.g., 1K 234M 2G)
df -Th # -T, --print-type | print file system type
```


# directory size

```sh
du -s directory_name
```
Or to get human readable output:

```sh
du -sh directory_name
```

# 複数 directory size

```
cd /    
sudo du -sh ./*
```

## 特定size以上のdirectoryを探す

```sh
du -s *|awk '{ if ($1 > 3000) print }'
```
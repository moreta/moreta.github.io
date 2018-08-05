
```sh
git config --global user.useConfigOnly true
git config --global --unset user.name
git config --global --unset user.email

cd /path/to/my_repo

// not this
git config --global user.name "My Name"
git config --global user.email "me@example.com"

// ok this
git config user.name "My Name"
git config user.email "me@example.com"

```


# References

+ [リポジトリごとに user.name や user.email の設定を強制する](https://qiita.com/uasi/items/a340bb487ec07caac799)
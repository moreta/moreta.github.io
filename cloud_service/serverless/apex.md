
# 基本的な設定とcliは official siteにわかりやすくなっている

ちょうどいい、覚えやすい分量なので、official siteを確認しよう。

# sample code

githubの `_examples`を参考に

# profileの固定

```js
{
  ...
  "profile": "your-aws-profile",
  ...
}
```

# Deploy all functions which name starts with “auth”:

```
apex deploy auth*
```

# 中身を見てみる

実際にどんなファイルがアップロードされているのかapex buildでzipを取得して確認

```
$ apex build timeline > /tmp/out.zip
$ cd ../
$ unzip /tmp/out.zip
$ ls
README.md _apex_index.js config/  node_modules/  package.json  sample.js
```

# References

+ [apex - serverless architecture](http://apex.run/)
+ [apexを使ってlambda functionの管理](http://swfz.hatenablog.com/entry/2016/06/16/024853)
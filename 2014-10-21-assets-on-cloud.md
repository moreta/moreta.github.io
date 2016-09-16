---
title: Asset on cloud & asset_sync gem
date: 2014-10-21
tags: rails, gem, asset, cloud
---

# Asset on cloud pattern

<http://d.hatena.ne.jp/lettas0726/20130320/1363773153>


## asset_sync rails gem

<https://github.com/rumblelabs/asset_sync>

capistranoでdeployするタイミングでassetをs3などにアップしてくれる。




```
#config/environments/production.rb
config.action_controller.asset_host = "//#{ENV['FOG_DIRECTORY']}.s3.amazonaws.com"
```


```
> rails g asset_sync:install --provider=AWS
create  config/initializers/asset_sync.rb
```

## assets:precompileされたらdefaultでS3へアップロードされる

If AssetSync.config.run_on_precompile is true (default), 
then assets will be uploaded to S3 automatically after the assets:precompile rake task is invoked:


```
rake assets:precompile
rake assets:precompile RAILS_ENV=production
bundle exec rake assets:precompile RAILS_ENV=production
```

## 参考

* <http://qiita.com/katryo/items/6a615869452fbad92821>
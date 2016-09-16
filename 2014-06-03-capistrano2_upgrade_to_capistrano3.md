---
title: capistrano2 upgrade to capistrano3
date: 2014-06-03
tags: rails, deploy, capistrano, passenger, nginx, rvm
---


## upgrede from 2.x.x

### 違い

* Capistrano 3.x is multistage by default
* Capifyファイルは新しくしたほうがいい

### Gemfile

Capistrano2

```
group :development do
  gem "capistrano"
  gem "capistrano-ext"
  gem "capistrano_colors" # capistrano3に入っている
end
```

Capistrano3

```
group :development do
  gem "capistrano-rails"
end
```

ほか

```
gem "railsless-deploy" # rails以外に使うときに便利
```

### Capify project with Capistrano 3

capistrano3がでたからもう一度整理

```
cd my-project
mkdir old_cap
mv Capfile old_cap
mv config/deploy.rb old_cap
mv config/deploy/ old_cap
cap install
```

cap installで以下のように構造が生成される
```
├── Capfile
  ├── config
  │   ├── deploy
  │   │   ├── production.rb
  │   │   └── staging.rb
  │   └── deploy.rb
  └── lib
      └── capistrano
              └── tasks
```

### Capfile

Capistrano2

```
load "deploy"
load "deploy/assets"
Dir["vendor/gems/*/recipes/*.rb","vendor/plugins/*/recipes/*.rb"].each { |plugin| load(plugin) }
load "config/deploy"
```

Capistrano3

```
require "capistrano/setup"
require "capistrano/deploy"

require 'capistrano/rvm' # 必要によって
require "capistrano/bundler"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"
require "whenever/capistrano"

Dir.glob("lib/capistrano/tasks/*.cap").each { |r| import r }
```

### Multistage configuration


## passenger restart setting

```
namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :mkdir, '-p', release_path.join('tmp') # <= これを追加する
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  # ...
end
```


## with Gemfile in rails


以前このようにしたが、   xxxxxxxxxx

``` ruby
group :deploy do
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'rvm-capistrano'
end
```

`rvm-capistrano`は古く、まだ、capistrano2.xに固定されているので、capistrano経由でrvmをinstallする必要がなければ`rvm-capistrano`はいらない

まだ、capistrano_colorsはcapistranoにmergeされている。なのでこれでよし、

``` ruby
group :deploy do
  gem 'capistrano', '~> 3.2.0'
  gem 'capistrano-rvm'
end
```

## formatting log(capistrano_colors)

<https://github.com/capistrano/capistrano/wiki/Formatting-Logs>




# EC2 のauto scalingと組み合わせる場合

<http://qiita.com/mychaelstyle/items/a550d4a0658c87c1ff30>

auto scalingにより起動するインスタンス側にもcapistranoを仕込んで
起動時にソースコードをリリース用のブランチから自動で取得するように設定。



# rvm with capistarno

<http://rvm.io/integration/capistrano>
<https://github.com/capistrano/rvm>

`capfile`
```
# Capfile
require 'capistrano/rvm'
```

```
# deploy.rb or stage file (staging.rb, production.rb or else)
set :rvm_type, :user                     # Defaults to: :auto
set :rvm_ruby_version, '2.0.0-p247'      # Defaults to: 'default'
set :rvm_ruby_version, '2.0.0-p247@mygemset' # or
set :rvm_ruby_version, '2.0.0@mygemset' # or
set :rvm_custom_path, '~/.myveryownrvm'  # only needed if not detected(省略してもいい)
```

* `:auto` (default): just tries to find the correct path. ~/.rvm wins over /usr/local/rvm
* `:system:` defines the RVM path to /usr/local/rvm
* `:user:` defines the RVM path to ~/.rvm

## check configuration

`cap production rvm:check`

# agent forwarding

* <http://blog.blenderbox.com/2013/02/20/ssh-agent-forwarding-with-github/>
* <https://help.github.com/articles/using-ssh-agent-forwarding>
* <http://www.unixwiz.net/techtips/ssh-agent-forwarding.html>

## agent forwarding setting

`~/.ssh/config`に

```
Host *example.com
  ForwardAgent yes
```

remoteサーバの `/etc/ssh/sshd_config`に

```
# /etc/ssh/sshd_config
AllowAgentForwarding yes
```
または `AllowAgentForwarding no`をコメントする


`deploy.rb`

```
set :ssh_options, {
   keys: %w(/home/user_name/.ssh/id_rsa),
   forward_agent: true, # ここを true
   auth_methods: %w(publickey password)
}
```

この設定したあと、テスト

`cap production deploy:check`

### もし出来ない場合

#### 1. ローカルmachineのssh-agentが稼動中なのか確認 (Your local ssh-agent must be running)

```
$ echo "$SSH_AUTH_SOCK"
# Print out the SSH_AUTH_SOCK variable
/tmp/launch-kNSlgU/Listeners
```

#### 2.キーがssh-agentで利用可能なのか確認  (Your key must be available to ssh-agent)

* <https://developer.github.com/guides/using-ssh-agent-forwarding/>
* Update: even after adding ForwardAgent yes in my ~/.ssh/config, this wasn’t working on my laptop (running OSX Lion).*

もし、上記の設定だけでだめなら以下の設定すること

`ssh-add -L` がなにも登録されてないなら
`ssh-add ~/.ssh/id_rsa -K`

`-K`はキーチェーンに保存しろってこと
これをしないと毎回`ssh-add`しないとだめ

これで ssh keyを authentication agentに追加すること。
ここで追加するid_rsaはgit repositoryに登録しているものとする。



## 流れ

```
deploy
  deploy:starting
    [before]
      deploy:ensure_stage
      deploy:set_shared_assets
    deploy:check
  deploy:started
  deploy:updating
    git:create_release
    deploy:symlink:shared
  deploy:updated
    [before]
      deploy:bundle
    [after]
      deploy:migrate
      deploy:compile_assets
      deploy:cleanup_assets
      deploy:normalise_assets
  deploy:publishing
    deploy:symlink:release
    deploy:restart
  deploy:published
  deploy:finishing
    deploy:cleanup
  deploy:finished
    deploy:log_revision
```

## task

sample

`lib/capistrano/task/setup.cap`に置く

```
namespace :setup do

  desc "Upload database.yml file."
  task :upload_yml do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config"
      upload! StringIO.new(File.read("config/database.yml")), "#{shared_path}/config/database.yml"
    end
  end

  desc "Seed the database."
  task :seed_db do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: :production do
          execute :rake, "db:seed"
        end
      end
    end
  end

  desc "Symlinks config files for Nginx and Unicorn."
  task :symlink_config do
    on roles(:app) do
      execute "rm -f /etc/nginx/sites-enabled/default"

      execute "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
      execute "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{fetch(:application)}"
   end
  end

end
```

## SSHKit

capistrano3からはSSHKitを利用するようになっているので
これは理解しておいで。

* on(): specifies the server to run on
* within(): specifies the directory path to run in
* as(): specifies the user to run as
* with(): specifies the environment variables to run with

## 参考

* <https://developer.github.com/guides/using-ssh-agent-forwarding/>
* <http://labs.gree.jp/blog/2013/12/10084/>
* <http://capistranorb.com/documentation/upgrading/>
* [Capistrano 3 Upgrade Guide : 2と3の違いがちゃんと整理されている](https://semaphoreapp.com/blog/2013/11/26/capistrano-3-upgrade-guide.html)
* [Capistrano をバージョン 3 にアップデートして時代の流れに乗る](http://tkengo.github.io/blog/2013/12/12/version-up-capistrano-v3/)
* [Deploying Rails Apps, Part 6: Writing Capistrano Tasks](http://vladigleba.com/blog/2014/04/10/deploying-rails-apps-part-6-writing-capistrano-tasks/)


## capistranoを利用してrake db:seed

<http://easyramble.com/capistrano3-rake-db-seed.html>

SSHKitの利用が必要

## sample config

* <https://gist.github.com/stevenyap/9130882>

## rvm install by user

rvm を rootでインストールせずに user単位でインストールすると
以下のようなコードがはいる。

capistranoでdeployするときにはそのユーザが使っているrvmがないのか確認しておいたほうがいい。

.bash_profile

```
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

```

.bashrc

```
```

* rootのrvmを使うなら`/home/user/.rvm`を削除するか、設定をコメントアウトするか、
* ユーザことに使うのが望ましいけど。

## sqlite3を使うときに注意(db fileのパス)

database.ymlにdefaultで書いているように `db/environment.sqlite3`にすると
capistranoでdeployするたびにdbfailが削除される。

なので他の場所を指定するのがいい。

例えば sharedとか。


# 基本的なコマンド


```
cap deploy:check
cap deploy
```
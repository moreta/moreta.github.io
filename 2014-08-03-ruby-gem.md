---
title: ruby gems
date: 2014-08-03
tags: ruby, gems
---

## basic

gemの基本的な利用方法

<http://guides.rubygems.org/rubygems-basics/>

```
gem install rails -v 5.0.0.rc1
```

## Make your own gem(私のgemを作って見よう)

<http://guides.rubygems.org/make-your-own-gem/>


gemをscrachから作るにはbundlerで作ったほうがいい

<http://bundler.io/v1.6/rubygems.html>

`bundle gem my_gem`

```
      create  my_gem/Gemfile
      create  my_gem/Rakefile
      create  my_gem/LICENSE.txt
      create  my_gem/README.md
      create  my_gem/.gitignore
      create  my_gem/my_gem.gemspec
      create  my_gem/lib/my_gem.rb
      create  my_gem/lib/my_gem/version.rb
Initializing git repo in /Users/path-to-gem/my_gem
```

### lib folder files

lib以下にgemと同じ名前のrubyファイルがある

```
% cat lib/hola.rb
class Hola
  def self.hi
    puts "Hello world!"
  end
end
```

### spec

Specification class contains the information for a Gem

specの詳細についてはここから

<http://guides.rubygems.org/specification-reference/>


```
% cat hola.gemspec
Gem::Specification.new do |s|
  s.name        = 'hola'
  s.version     = '0.0.0'
  s.date        = '2010-04-28'
  s.summary     = "Hola!"
  s.description = "A simple hello world gem"
  s.authors     = ["Nick Quaranto"]
  s.email       = 'nick@quaran.to'
  s.files       = ["lib/hola.rb"]
  s.homepage    =
    'http://rubygems.org/gems/hola'
  s.license       = 'MIT'
end
```

### build gem

上記の２つが設定されてば、buildできる

ビルドしてみよう。

`gem build my_gem.gemspec`

これをすると `my_gem.0.0.0.gem`というファイルが生成される。
これをインストールする

`gem install ./hola-0.0.0.gem`

#### 確認

```
% irb or pry
>> require 'hola'
=> true
>> Hola.hi
Hello world!
```

## publising to RubyGems.org

### apiキー生成

```
curl -u your_rubygems_org_user_name https://rubygems.org/api/v1/api_key.yaml > ~/.gem/credentials; chmod 0600 ~/.gem/credentials
> your_rubygems_org_passwordを入力
```
これでapiキーが`~/.gem/credentials`へ600権限で保存される

### publising

`gem push hola-0.0.0.gem`

これで終わり

## Adding an executable(実行可能にする)

1. 実行可能にするためには`bin` directoryが必要

```
% mkdir bin
% touch bin/hola
% chmod a+x bin/hola
```

2. これで生成した`bin/hola`ファイルは実行するために

sheban(시방 | #! | sharp ban)の指定が必要

```
% cat bin/hola
#!/usr/bin/env ruby

require 'hola'
puts Hola.hi(ARGV[0])
```

3. このように実行する

`ruby -Ilib ./bin/hola spanish`

ここで `-Ilib`は lib directoryを`$LOAD_PATH`に読み込みことを意味する

4. specに指定

`spec.executables`に実行ファイルを指定する必要がある

`spec.executables << 'hola'`


でも、だいたいこのような形でいい

`spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }`


## Writing tests(テスト作成)

## development環境での開発

gemを利用すると
以下の手順でlocalにgemをインストールできるが
```
gem build my_gem.gemspec
gem install ./hola-0.0.0.gem
```

### rakeを利用すると簡単にできる

`rake install`

gemをbuildするのも!!!

`rake build`でできる。

releseもできる!!!!!

`rake release`

### Rakefileを修正し、rspecをincludeしtaskを追加(default, test)

```
require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new

task :default => :spec
task :test => :spec
```

これをして、

1. specディレクトリを作る。
2. lib/のディレクトリと同じくspec以下に作る
3. yourtest_spec.rbの命名ルールでテストケースを作成する

```
rake
rake spec
```
でテスト

#### installせずにconsoleで確認

```
bundle console [env_group]
```

pryを使いたいなら

`bundle exec pry`

または

```
$ bundle config console pry
$ bundle console
[1] pry(main)>
```

## path関連

<http://stackoverflow.com/questions/10132949/finding-the-gem-root>

gemながでのpath

```
# your_gem.rb

module YourGem
  def self.root
    File.dirname __dir__
  end
end
```

他のdirectoryにアクセスするときには以下のようなmethodをよいすればいい
```
module YourGem
  def self.bin
    File.join root, 'bin'
  end

  def self.lib
    File.join root, 'lib'
  end
end
```

または

```
spec = Gem::Specification.find_by_name("your_gem_name")
gem_root = spec.gem_dir
yaml_obj = YAML.load(gem_root + "/file_name.yaml")
```

## version 指定

```
# バージョン指定で導入
$ gem install <gem名> -v <バージョン>
```

### version  option

| Operator |                 Meaning+                 |
|----------|------------------------------------------|
| =        | Equal to (default)                       |
| !=       | Not equal to                             |
| >        | Greater than                             |
| <        | Less than                                |
| >=       | Greater than or equal to                 |
| <=       | Less than or equal to                    |
| ~>       | Pessimistically greater than or equal to |

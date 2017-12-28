Rails Command Line
===================

# rails commands list

+ `rails console`
+ `rails server`
+ `bin/rails`
+ `rails generate`
+ `rails dbconsole`
+ `rails new app_name`

# generate

generator list

+ scaffold
+ scaffold_controller
+ controller
+ resource
+ model
+ migration
+ assets
+ helper
+ generator
+ integration_test
+ jbuilder
+ mailer
+ task

## `rails generate integration_test`

+ インテグレーションテスト（総合テスト）のファイルを生成します。このファイルは他のgenerate コマンドでは作られません。

```
$ rails g integration_test [target_name]
$ rails g integration_test article
      invoke  test_unit
      create    test/integration/article_test.rb
```

## `rails g migration ClassName`

```sh
rails g migration ChangeColumnToUser
```

# rails console

```
rails c
# environment指定
RAILS_ENV=production rails c
# fish shell
env RAILS_ENV=production rails c
```


# References

+ [The Rails Command Line](http://guides.rubyonrails.org/command_line.html)
+ [実はこんなにある rails generate](https://techracho.bpsinc.jp/shibuya/2014_07_24/18388)

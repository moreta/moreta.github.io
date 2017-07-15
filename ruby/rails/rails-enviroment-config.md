
rails config ymlを読み込み
==========================

<https://swaac.tamouse.org/swaac/2015/01/20/rails-4-dot-2-config-for/>

## rails 3

```rb
APP_CONFIG = YAML.load_file("#{::Rails.root}/config/app_config.yml")[::Rails.env]
```

## after rails 4.2

`Rails.application.config_for`を利用

```rb
APP_CONFIG = Rails.application.config_for(:app_config)
```


# １つのymlでなく環境ことに分けたいときに

でも、まあ使わないかな

```rb
# Gemfile
gem 'config'
```

```sh
# initial
rails g config:install

Running via Spring preloader in process 26132
      create  config/initializers/config.rb
      create  config/settings.yml
      create  config/settings.local.yml
      create  config/settings
      create  config/settings/development.yml
      create  config/settings/production.yml
      create  config/settings/test.yml
      append  .gitignore
```

RailsでUnitテストするために準備


```sh
bundle exec rake db:test:prepare
bundle exec rake db:setup RAILS_ENV=test
bundle exec rake db:migrate RAILS_ENV=test # rails4からはこれも
```

workflow(または state machine)の実装について
=====================



# References

+ [Rails で使える StateMachine Gem 3 つをしらべてみた](http://qiita.com/takkanm/items/8a368a56dcb3c0e6aa20)
+ [#392 A Tour of State Machines - Railscast](http://railscasts.com/episodes/392-a-tour-of-state-machines?autoplay=true)
+ [Finite-state machine on Wikipedia](https://en.wikipedia.org/wiki/Finite-state_machine)

## gems

+ [workflow - Like acts as state machine (aasm), but _way_ better (it's in Ruby too!)](https://github.com/geekq/workflow)
+ [AASM - State machines for Ruby classes (plain Ruby, ActiveRecord, Mongoid)](https://github.com/aasm/aasm)
  + + ActiveRecord の enum を利用したいなら
+ [transitions - State machine extracted from ActiveModel](https://github.com/troessner/transitions)
  + 状態が遷移した時間が必要になりそうなら
+ [stateman - A statesmanlike state machine library](https://github.com/gocardless/statesman)
  + 状態の遷移をトラッキングしたい履歴が重要になるなら
+ [state_machine - Adds support for creating state machines for attributes on any Ruby class](https://github.com/pluginaweek/state_machine)
  + 2013が最後のcommit
+ [state_machines - Adds support for creating state machines for attributes on any Ruby class](https://github.com/state-machines/state_machines)
  + [Log transitions on a state_machines gem to support auditing and business process analytics.](https://github.com/state-machines/state_machines-audit_trail)
  + <https://engineering.shopify.com/17488160-why-developers-should-be-force-fed-state-machines>
  + [StateMachines Active Record Integration](https://github.com/state-machines/state_machines-activerecord)

## java

+ [spring statemachine](http://projects.spring.io/spring-statemachine/)
  + [Persisting State Machine](https://docs.spring.io/spring-statemachine/docs/current/reference/html/sm-persist.html)
---
title: Ruby rake
date: 2016-06-28
tags: ruby, rake
---

+ Rakeはmakeと同じようなもの


# Tasks

+ Rakefile(makefileのrake version)

## rule

+ <http://madewithenvy.com/ecosystem/articles/2014/rake-rule-tasks/>
+ rule can have prerequisites


### dependency


```ruby
rule '.dependency' do |task|
  puts 'called task: %s' % task.name
end

rule '.task' => '.dependency' do |task|
  puts 'called task: %s' % task.name
end

# $ rake rule.task
# called task: rule.dependency
# called task: rule.task
```

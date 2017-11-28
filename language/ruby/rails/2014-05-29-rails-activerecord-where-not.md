---
title: rails4 where not
date: 2014-05-29
tags: aws, activerecord
---



# rails 4から導入された `where.not`

<http://robots.thoughtbot.com/activerecords-wherenot>


### not equal系

```
# old
User.where.not(name: 'Gabe')`
User.where('name != ?', 'Gabe')
```

### not null系
```
# Old and busted
# User.where('name IS NOT NULL')
# New hotness
User.where.not(name: nil)
```

### not in系

```
# Without `where.not`
# Something.where("name NOT IN ?", User.unverified.pluck(:name))
# With `where.not`
Something.where.not(name: User.unverified.pluck(:name))
```
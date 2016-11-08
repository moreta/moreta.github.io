---
title: Draper  - Decorators/View-Models for Rails Applications
date: 2015-01-25
tags: rails, gem, decorator
---


# Usage

```
# app/decorators/article_decorator.rb
class ArticleDecorator < Draper::Decorator
# ...
end
```

## Generators

```
# generate controller
rails generate resource Article

# if model already exist
rails generate decorator Article
```

## Decorating

```
@article = Article.first.decorate

# or initialize directly

@widget = ProductDecorator.new(Widget.first)
# or, equivalently
@widget = ProductDecorator.decorate(Widget.first)
```

## Decoration Collection

```
@articles = ArticleDecorator.decorate_collection(Article.all)
# If your collection is an ActiveRecord query, you can use this:

@articles = Article.popular.decorate
```


## Using pagination



# with Kaminari

```
class PaginatingDecorator < Draper::CollectionDecorator
  delegate :current_page, :total_pages, :limit_value
end
```

## 参考

* <https://github.com/drapergem/draper>
* <https://github.com/drapergem/draper/issues/401>
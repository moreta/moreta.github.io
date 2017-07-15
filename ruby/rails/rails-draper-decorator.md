
Draper  - Decorators/View-Models for Rails Applications
========================================================


# Usage

```rb
# app/decorators/article_decorator.rb
class ArticleDecorator < Draper::Decorator
# ...
end
```

## Generators

```rb
# generate controller
rails generate resource Article

# if model already exist
rails generate decorator Article
```

## Decorating

```rb
@article = Article.first.decorate

# or initialize directly

@widget = ProductDecorator.new(Widget.first)
# or, equivalently
@widget = ProductDecorator.decorate(Widget.first)
```

## Decoration Collection

```rb
@articles = ArticleDecorator.decorate_collection(Article.all)
# If your collection is an ActiveRecord query, you can use this:

@articles = Article.popular.decorate
```


## Using pagination



# with Kaminari

```rb
class PaginatingDecorator < Draper::CollectionDecorator
  delegate :current_page, :total_pages, :limit_value
end
```

# References

* <https://github.com/drapergem/draper>
* <https://github.com/drapergem/draper/issues/401>
+ [rails 3で使える最後のversion 1.4.0](https://github.com/drapergem/draper/tree/v1.4.0)
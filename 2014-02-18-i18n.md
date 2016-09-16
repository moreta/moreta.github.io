---
title: i18n
date: 2014-02-18
tags: rails, i18n, browser
---




# client localeを取得

<http://guides.rubyonrails.org/i18n.html#setting-the-locale-from-the-client-supplied-information>


# rails Globalization Gem





1. クラスに`translates`定義後
```
class Post < ActiveRecord::Base
  translates :title, :text
end
```

2. migrationする

migration方法などはgithubを参照

<https://github.com/globalize/globalize>

3. テーブルの以下のように sなしの `_translations`テーブルが追加される
```
\d posts
                                      Table "public.posts"
   Column    |            Type             |                          Modifiers
-------------+-----------------------------+-------------------------------------------------------------
 id          | integer                     | not null default nextval('posts_id_seq'::regclass)
 title       | character varying(255)      | not null
 description | character varying(255)      | not null
 text        | text                        | not null
 created_at  | timestamp without time zone | not null
 updated_at  | timestamp without time zone | not null
Indexes:
    "posts_pkey" PRIMARY KEY, btree (id)
```

```
\d post_translations
                                        Table "public.post_translations"
      Column      |            Type             |                                Modifiers
------------------+-----------------------------+-------------------------------------------------------------------------
 id               | integer                     | not null default nextval('post_translations_id_seq'::regclass)
 post_id          | integer                     |
 locale           | character varying(255)      | not null
 created_at       | timestamp without time zone | not null
 updated_at       | timestamp without time zone | not null
 title            | character varying(255)      |
 text             | text                        |
Indexes:
    "post_translations_pkey" PRIMARY KEY, btree (id)
    "index_post_translations_on_locale" btree (locale)
    "index_post_translations_on_mail_template_id" btree (post_id)
```

4. IMPORTANT : migrationが成功したら既存のテーブル残っているカラムを削除すること!!!

## usage

### fallback
```
class Post < ActiveRecord::Base
  translates :title, :name
end

Globalize.fallbacks = {:en => [:en, :pl], :pl => [:pl, :en]}

I18n.locale = :en
en_post = Post.create(:title => 'en_title')

I18n.locale = :pl
pl_post = Post.create(:title => 'pl_title')
en_post.title # => 'en_title'

I18n.locale = :en
en_post.title # => 'en_title'
pl_post.title # => 'pl_title'
```

### Scoping
```
Post.with_translations('en')
# => [
  #<Post::Translation id: 1, post_id: 1, locale: "en", title: "Globalize rocks!", name: "Globalize">,
  #<Post::Translation id: 2, post_id: 1, locale: "nl", title: '', name: nil>
]

Post.with_translations(I18n.locale)
# => [
  #<Post::Translation id: 1, post_id: 1, locale: "en", title: "Globalize rocks!", name: "Globalize">,
  #<Post::Translation id: 2, post_id: 1, locale: "nl", title: '', name: nil>
]

Post.with_translations('de')
# => []
```

### show different language

```
<% Globalize.with_locale(:en) do %>
  <%= render "my_translated_partial" %>
<% end %>
```

### Interpolation
```
class Post < ActiveRecord::Base
  translates :title
end

I18n.locale = :en
post.title = "Globalize %{superlative}!"

post.title
# #=> "Globalize %{superlative}!"

post.title(:foo => "bar")
# SomeError: missing interpolation argument :superlative

post.title(:superlative => "rocks")
# #=> "Globalize rocks!"
```
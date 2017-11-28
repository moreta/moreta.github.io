---
title: "Rails Form"
date: 2013-12-16
tags: rails, form
---


## カスタムform
<http://guides.rubyonrails.org/form_helpers.html#customizing-form-builders>
<http://qiita.com/uzuki05/items/f9990500a1e9d5731c04>

`app/helpers/my_form_builder.rb`

``` ruby
class ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(attribute, options={})
    label(attribute) + super
  end

  # or

  def my_field(method, options={})
    # ここでなにかする
    @template.my_field(@object_name, method, objectify_options(options))
  end
end
```

``` ruby
<%= form_for @article, builder: MyFormBuilder do |f| %>
  <%= f.my_field :title %>
  <%= f.submit %>
<% end %>
```

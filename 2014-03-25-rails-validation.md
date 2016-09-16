---
title : Rails Validate
date : 2014-03-25
tags : rails, validate
---



### conditional validate

<http://stackoverflow.com/questions/11882497/rails-validation-on-custom-action>

```
validates :cat_no, :presence => true, :on => :update, :if => :just_approved?

def just_approved?
  changed.include?("approved") && approved?
end
```


# js validation

<http://railsadventures.wordpress.com/2012/10/21/using-rails-remote-forms-with-jquery-validations/>


以下も参考して

* 2014-02-14-jquery-validate
* 2014-02-24-promise-deferred
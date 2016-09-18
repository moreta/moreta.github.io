---
title : Rails constant
date : 2014-03-27
tags : rails, constant
---




<http://stackoverflow.com/questions/20872501/rails-4-best-way-to-reference-table-constants>

```
# app/models/post_type.rb

class PostType < ActiveRecord::Base
  QUESTION = find_by(code: "question")
  ANSWER   = find_by(code: "answer")
  NOTE     = find_by(code: "note")
end
```
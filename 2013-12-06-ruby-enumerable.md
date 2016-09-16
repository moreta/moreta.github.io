---
title: "Ruby Enumerable"
date: 2013-12-06
tags: ruby, enumerable, array
---


``` ruby
def count_of_words(str)
  str.split(' ').inject(Hash.new(0)) do |count_hash, word|
    count_hash[word] += 1
    count_hash
  end
end

count_of_words('ruby is awesome and ruby is great')
# => {"ruby"=>2, "is"=>2, "awesome"=>1, "and"=>1, "great"=>1}
```
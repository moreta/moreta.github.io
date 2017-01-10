
Module Test
===========

テスト対象のコード

```rb
app/controllers/hoge.rb
module Hoge
  def add(a, b)
    a + b
  end
end
```

テスト
```rb
spec/concerns/hoge_spec.rb
require 'spec_helper'

describe Hoge do

  let(:test_class) { Struct.new(:hoge) { include Hoge } }
  let(:hoge) { test_class.new }

  describe ".add" do
    it "1, 2を渡すと3を返す" do
      expect(hoge.add(1, 2)).to eql 3
    end
  end
end
```

run test

```sh
bundle exec rspec spec/concerns/hoge_spec.rb # 当該specだけテスト
```


# References

+ [Rails4のconcernsなmoduleのテストをrspecで書く方法](http://qiita.com/tq_jappy/items/ed56b0f4a20500252461)

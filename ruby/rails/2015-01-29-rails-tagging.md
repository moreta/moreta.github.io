---
title: rails tagging
date: 2015-01-29
tags: rails, tagging
---




<https://github.com/mbleigh/acts-as-taggable-on>



```
class User < ActiveRecord::Base
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :skills, :interests
end

class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:name, :tag_list) ## Rails 4 strong params usage
  end
end

@user = User.new(:name => "Bobby")

@user.tag_list.add("awesome")   # add a single tag. alias for <<
@user.tag_list.remove("awesome") # remove a single tag


@user.tag_list.add("awesome", "slick") # add multiple tags
@user.tag_list.remove("awesome", "slick")

# auto parse(default ,)
user.tag_list.add("awesome, slick", parse: true)
@user.tag_list.remove("awesome, slick", parse: true)

@user.tag_list = "awesome, slick, hefty"
@user.save
@user.reload
@user.tags
```

# ownership tagは少しややこしい

documentがしょぼい。。

# References

+ [acts-as-taggable-onでオーナーを設定してタグを登録する](https://qiita.com/higan/items/04f8797213ffb50effec)
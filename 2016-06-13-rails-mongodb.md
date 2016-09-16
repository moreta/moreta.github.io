---
title: Rails mongoid(mongodb)
date: 2016-06-13
tags: rails, mongodb, mongoid
---

# Official document

<https://docs.mongodb.com/ecosystem/tutorial/mongoid-installation/>



# Install & Setting Summary

```
gem 'mongoid'
gem 'mongoid', github: 'mongodb/mongoid' # rails5の場合まだreleaseされてないから
```

```
rails g mongoid:config
Running via Spring preloader in process 30471
      create  config/mongoid.yml
```

# Field

+ schemaless databaseだけど大半は定義して使ってるでしょう
+ またfiledを指定するとideやfieldへのaccessがいい

```
class Person
  include Mongoid::Document
  field :first_name, type: String
  field :middle_name, type: String
  field :last_name, type: String
end
```

+ Array
+ BigDecimal
+ Boolean
+ Date
+ DateTime
+ Float
+ Hash
    + field type Hashを使う場合には [legal key names for mongoDB](https://docs.mongodb.com/manual/reference/limits/#naming-restrictions)に違反してないように注意
+ Integer
+ BSON::ObjectId
+ BSON::Binary
+ Range
+ Regexp
+ String
+ Symbol
+ Time
+ TimeWithZone

## Accessing Field Values

```
# Get the value of the first_name field
person.first_name
person[:first_name]
person.read_attribute(:first_name)


# Set the value for the first_name field
person.first_name = "Jean"
person[:first_name] = "Jean"
person.write_attribute(:first_name, "Jean")
```


getter, setterを適用すると `.`を使う表現の値は`tter`に影響される
```
class Person
  include Mongoid::Document

  field :first_name

  # custom getter
  def first_name
    "My name is Johnny"
  end

  # custom setter
  def first_name=(value)
    p 'Setting.. '
    self.first_name = value
    p '.. done!'
  end
end

# Like this:
person.first_name = 'John'
# Setting..
# .. done!

person.first_name                  # My name is Johnny
person[:first_name]                # John
person.read_attribute(:first_name) # John
```

### Hash field

```
# all data will fail to save due to the illegal hashkey
def set_vals_fail
  self.first_name = 'Daniel'
  self.url = {'home.page' => 'http://www.homepage.com'}
  save
end
```

# Logging

```
Mongoid.logger.level = Logger::DEBUG
Mongo::Logger.logger.level = Logger::DEBUG
```

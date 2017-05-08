---
title: AWS DynamoDB
date: 2014-05-21
tags: aws, DynamoDB
---




# Document

intro

* <https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Introduction.html>

getting started dynamodb

<https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GettingStartedDynamoDB.html>


# ruby SDK

## document

<http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/DynamoDB.html>

## 導入

### Gemfile

`gem 'aws-sdk'`

### app/config/aws.yml



## sample

`AWS::Record::HashModel`

```
lass Task < AWS::Record::HashModel
  string_attr :name
end
 
task = Task.new(:name => "My Sample Task")
task.name #=> 'My Sample Task'
```

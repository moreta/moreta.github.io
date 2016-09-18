---
title: Email validation
date: 2013-12-19
tags: email, validation, regexp
---


これ、ようは簡単にしてもいいよって話

<http://davidcel.is/blog/2012/09/06/stop-validating-email-addresses-with-regex/>


結局railsではこれを使うようにする。

<https://github.com/plataformatec/devise/wiki/How-to:-Use-a-custom-email-validator-with-Devise>


`validates :email, :presence => true, :email => true`

``` ruby
# app/validators/email_validator.rb
require 'mail'
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    begin
      m = Mail::Address.new(value)
      # We must check that value contains a domain and that value is an email address
      r = m.domain && m.address == value
      t = m.__send__(:tree)
      # We need to dig into treetop
      # A valid domain must have dot_atom_text elements size > 1
      # user@localhost is excluded
      # treetop must respond to domain
      # We exclude valid email values like <user@localhost.com>
      # Hence we use m.__send__(tree).domain
      r &&= (t.domain.dot_atom_text.elements.size > 1)
    rescue Exception => e
      r = false
    end
    record.errors[attribute] << (options[:message] || "is invalid") unless r
  end
end
```
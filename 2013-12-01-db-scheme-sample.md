---
title: "table scheme"
date: 2013-12-01
tags: db, scheme
---



## User

*devise gem用の user table *

<http://www.ajostrow.me/thoughts/registering-users-with-email-confirmation>

<http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Trackable>

* sign_in_count - Increased every time a sign in is made (by form, openid, oauth)
* current_sign_in_at - A timestamp updated when the user signs in
* last_sign_in_at - Holds the timestamp of the previous sign in
* current_sign_in_ip - The remote ip updated when the user sign in
* last_sign_in_ip - Holds the remote ip of the previous sign in


``` ruby
class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email

      ## Lockable
      t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      ## Token authenticatable
      t.string :authentication_token

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token, unique: true
    add_index :users, :unlock_token, unique: true
    add_index :users, :authentication_token, unique: true
  end
end
```

# railsでIP取得

<http://stackoverflow.com/questions/1226959/how-to-get-client-ip-and-server-ip-using-rails>
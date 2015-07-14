---
layout: page
title: Multi-tenancy
categories: General
resource: true
description: Multi-tenancy application
index_order: 1
order: 1
---

#Multi-tenancy

A multi-tenancy application is one that can be used by multiple entities at the same time, typically with the data for those entities kept separate from the other entities. When a user signs in, they should only be able to see one set of data, and not the data from other places. 

Cenit use a shared approach, Shared Database and Shared Schema. 

All tenants share the same database and schema. There is a main tenant-table, where all other tables have a foreign key pointing to.

For review others approach visit [[Multi-Tenant Data Architecture | http://msdn.microsoft.com/en-us/library/aa479086.aspx]]

```ruby
class AddAccountReferencesToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :account, index: true
  end
end
```

```ruby
class Account < ActiveRecord::Base
   has_many :users
   def self.current
     Thread.current[:current_account]
   end
   def self.current=(account)
     Thread.current[:current_account] = account
   end
end
```

```ruby
module AccountScoped
 extend ActiveSupport::Concern

 included do
  belongs_to :account
  before_validation { self.account = Account.current }
  default_scope { where(account: Account.current) }
 end
end
```

```ruby
class User < ActiveRecord::Base
  include AccountScoped
end

class Products < ActiveRecord::Base
  include AccountScoped
end
```

```ruby
class ApplicationController < ActionController::Base
  around_filter :scope_current_account
  def scope_current_account
    if signed_in?
      Account.current = current_user.account
    end

    yield
    ensure
      Account.current = nil
    end
end	
```
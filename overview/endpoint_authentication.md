---
layout: page
title: Endpoint authentication
categories: General
resource: true
description: Endpoint authentication
index_order: 1
order: 1
---

#Endpoint authentication

The endpoint authentication use a pair (key, authentication_token).

For generate 'key' value is used NumberGenerator module.

```ruby
module NumberGenerator
  extend ActiveSupport::Concern

  NUMBER_LENGTH  = 9
  NUMBER_LETTERS = false
  NUMBER_PREFIX  = 'N'

  included do
    field :number, type: String
    validates :number, uniqueness: true
    before_validation :generate_number, on: :create
  end
  
  def self.by_number(number)
    where(number: number)
  end
  
  def generate_number(options = {})
    options[:length]  ||= NUMBER_LENGTH
    options[:letters] ||= NUMBER_LETTERS
    options[:prefix]  ||= NUMBER_PREFIX

    possible = (0..9).to_a
    possible += ('A'..'Z').to_a if options[:letters]

    self.number ||= loop do
      # Make a random number.
      random = "#{options[:prefix]}#{(0...options[:length]).map { possible.shuffle.first }.join}"
      # Use the random  number if no other order exists with it.
      if self.number.present? && self.number == random
        # If over half of all possible options are taken add another digit.
        options[:length] += 1 if self.class.count > (10 ** options[:length] / 2)
      else
        break random
      end
    end
  end
 
end
```

The module decorate Connection class. 

```ruby
module Setup
  class Connection < Base
    include NumberGenerator
    ...
  end
end
```

Mongoid provide alias functionality, it is uses alias 'key' for 'number' field.

```ruby
  field :number, as: :key, type: String
```
In the above example you can reference the field by `Connection#key`, but the field in the database is stored as `number`.

the method 'generate_number' is override for change prefix to 'C'.

```ruby

def generate_number(options = {})
  options[:prefix] ||= 'C'
  super(options) 
end
```

Now we will see how to add devise auth token to connections and how to use it in Push API authentication.

```ruby
module Setup
  class Connection < Base
    ...
    devise :database_authenticatable

    field :authentication_token, type: String
    validates_uniqueness_of :authentication_token
    ...
  end
end
```

Generate Authentication token
```ruby
module Setup
  class Connection < Base
    ...
    before_save :ensure_authentication_token

    def ensure_authentication_token
      self.authentication_token ||= generate_authentication_token
    end
    ...
    private

      def generate_authentication_token
        loop do
          token = Devise.friendly_token
          break token unless User.where(authentication_token: token).first
        end
      end
    ...
  end
end
```

ApiController has the responsibility to handler the push data request from endpoints.

Now we can review the authorization method in ApiController.


```ruby
module Cenit
  class ApiController < ActionController::Base
  before_filter :save_request_data, :authorize
  ...
  end
end
```

Authorize method

```ruby
protected
def authorize
  key = request.headers['X-Hub-Store']
  token = request.headers['X-Hub-Access-Token']

  connection = Setup::Connection.unscoped.find_by(key: key)

  if connection && Devise.secure_compare(connection.authentication_token, token)
    return true
  else
    Account.current = connection.account
    response_handler = Handler.new(@message)
    responder = response_handler.response('Unauthorized!', 401)
    render json: responder, root: false, status: responder.code
    return false
  end
end
```

Notice that we are using token authentication via header.

The named param 'X-Hub-Store' for maintained consistence with Wombat integration, but you need are cleat about that not all endpoints are store.

the param 'key' is used for find a connection.

```ruby
connection = Setup::Connection.unscoped.find_by(key: key)
```

Finally we used devise for compare the param 'token' with 'authentication_token' in DB.

```ruby
Devise.secure_compare(connection.authentication_token, token)
```

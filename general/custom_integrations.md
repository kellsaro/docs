---
layout: page
title: Overview
categories: General
resource: true
description: Custom Integration
index_order: 1
order: 1
---


#Custom Integration Tutorial

We'll use Sinatra, which is perfect for lightweight Ruby web applications.

While this tutorial uses Ruby, you are not limited to using Ruby to build your custom Integrations.
`Hello World`

```bash
$ mkdir custom_tutorial
```

Let's start off by creating a basic Gemfile and doing a `bundle install` from the command line. We include both the `active_support gem` to help with some of the JSON parsing aspects.

—Gemfile—

```ruby
source 'https://rubygems.org'

gem 'sinatra'
gem 'active_support'
```

Now we need to create an application file where the logic for this Integration will reside. We'll start by adding a simple, `"Hello World"` functionality so we can test our server.

—twilio_app.rb—

```ruby
require 'sinatra'
require 'json'
require 'active_support/core_ext/hash/indifferent_access'

class TwilioApp < Sinatra::Base
  get '/' do
    'Hello World'
  end
end
```

Now add a config.ru file so that Rack can start Sinatra

—config.ru—

```ruby
require './twilio_app'

run TwilioApp
```

From the command type the following to start your Sinatra server:

```bash
$ bundle exec rackup
```

Use `Ctrl+C` to stop your local server when you're done testing.

Now test your server by going to the browser and navigating to http://localhost:9292. You should see a single line response of `"Hello World"`

##Send SMS with Twilio

Next we'll build one more Integration that implements a standard Webhook. This Integration will use Twilio to send SMS messages. We'll start off as usual by creating the Gemfile and doing a `bundle install`. Notice that we include the `twilio-ruby gem`, which simplifies things by wrapping the Twilio API.

—Gemfile—

```ruby
source 'https://rubygems.org'

gem 'sinatra'
gem 'active_support'
gem 'twilio-ruby'
```

Now we create the standard `config.ru` file.

—config.ru—

```ruby
require 'rubygems'
require 'bundler'

Bundler.require(:default)
require './twilio_app'
run TwilioApp
```

Now that we have the basic Sinatra stuff taken care of, it's time to create `twilio_app.rb` and start coding up a standard Webhook. Let's start with a simple version that acknowledges a POST to `send_sms` but doesn't actually talk with Twilio.

The source code for all of the examples in this tutorial is available on Github.

##Basic Version

Twilio is all about sending SMS messages and, fortunately, CenitHub already has a convenient Webhook to describe such a request. The `send_sms` Webhook is defined as responding to a HTTP POST to `/send_sms` and expects to receive an sms object.

—twilio_app.rb—

```ruby
require 'json' 
require 'active_support/core_ext/hash/indifferent_access'

class TwilioApp < Sinatra::Base 
  post '/send_sms' do 
  content_type :json 
  payload = JSON.parse(request.body.read).with_indifferent_access 
  request_id = payload[:request_id] 

  # acknowledge the successful delivery of the message 

  { request_id: request_id, summary: "SMS message sent" }.to_json + "\n" 
  end 
end
````

Let's take a look at a couple of things we're doing in the above code example. The first thing to note is that the application will respond to an HTTP POST to /send_sms - just like the standard Webhook definition for send_sms requires. The second thing to note is that we're reading the request_id from the post and returning it in our response.

You must always return the exact request_id that CenitHub provides you so CenitHub knows that you handled the specific request correctly.
Finally, you'll note that the response contains a ‘summary'. This summary information will be used by CenitHub to generate Notifications that can be viewed in CenitHub's interface.

To keep things simple we'll skip the part where we hook up this Integration to CenitHub. Instead we'll start the Sinatra server with rackup and use the command line to simulate a POST that CenitHub will be sending.

```bash
$ curl -i -X POST -d '
  {
    "request_id": "52f367367575e449c3000001",
    "sms": {
      "from:" "555-555-1212"
      "phone": "(123)-456-7890",
      "message": "Order R12345 was shipped!"
    }
}' localhost:9292/send_sms
```

If you've done everything right, you'll get back the following response:

```
HTTP/1.1 200 OK
{"request_id":"52f367367575e449c3000001","summary":"SMS message sent"}
```

##Handler Failures

So far our Integration isn't doing anything difficult, but once we start talking to a third party service like Twilio, things could start to fail unexpectedly. Let's implement some error handling so CenitHub knows when we've run into a problem. Since we're not actually talking to Twilio yet, we'll simulate a problem with their service by raising an exception.

—twilio_app.rb—

```ruby
require 'sinatra' 
require 'json' 
require 'active_support/core_ext/hash/indifferent_access'

class TwilioApp < Sinatra::Base 
  post '/send_sms' do 
  content_type :json 
  payload = JSON.parse(request.body.read).with_indifferent_access 
  request_id = payload[:request_id] 
  begin
  
    # Add real Twilio calls here later 
    raise "Simulated problem" 

    # HACK - for testing error handling 

  rescue 
    status 500 
    return { request_id: request_id, summary: "Unable to send SMS message" }.to_json + "\n" 
  end 

  # acknowledge the successful delivery of the message 
  { request_id: request_id, summary: "SMS message sent" }.to_json + "\n" 

end
````

Now we'll restart the server again (remember, Sinatra needs to be restarted with each code change) and try the same HTTP POST we did in the previous step.

```bash
$curl -i -X POST -d '
{
  "request_id": "52f367367575e449c3000001",
  "sms": {
    "from:" "555-555-1212"
    "phone": "(123)-456-7890",
    "message": "Order R12345 was shipped!"
  }
}' localhost:9292/send_sms
```

This time we get the expected failure which looks like the following:

```
HTTP/1.1 500 Internal Server Error
{"request_id":"52f367367575e449c3000001","summary":"Unable to send SMS message"}
```

Now when CenitHub calls our Integration's Webhook it will respond correctly to either a successful or unsuccessful attempt to send a Twilio message.

##Add Twilio Calls

—twilio_app.rb—

```ruby
require 'sinatra' 
require 'json' 
require 'active_support/core_ext/hash/indifferent_access'

class TwilioApp < Sinatra::Base 
  post '/send_sms' do 
    content_type :json 
    payload = JSON.parse(request.body.read).with_indifferent_access 
    request_id = payload[:request_id] 
    sms = payload[:sms] 
    params = payload[:parameters]
    
    begin 
      client = Twilio::REST::Client.new(params[:account_sid], params[:auth_token]) 
      client.account.messages.create( :from => sms[:from], :to => sms[:phone], :body => sms[:message]) 
    rescue => e
      # tell CenitHub about the unsuccessful delivery attempt 
      status 500 
      return { request_id: request_id, summary: "Unable to send SMS message. Error: #{e.message}" }.to_json + "\n" 
    end 
    # acknowledge the successful delivery of the message 
    { request_id: request_id, summary: "SMS message sent" }.to_json + "\n" 
  end
end
```

You'll notice that we do not hard-code any of the Twilio security credentials into the source code. Later on, we'll show you how CenitHub is configured to pass this information each time the Webhook is called. This is not only a good security practice but it also allows the same Integration to be shared by more than one storefront.

For security reasons, you should never add your security credentials to the source code, especially when sharing your Integration code with others! This type of information should be configured in CenitHub and passed to your Integration as Parameters.

```bash
$ curl -i -X POST -d '
{
  "request_id": "52f367367575e449c3000001",
  "sms": {
    "from" : "444-444-4444",
    "phone": "555-555-5555",
    "message": "Your order from the Foo Store has shipped!"
  },
  "parameters": {
    "auth_token": "YOUR-AUTH-TOKEN",
    "account_sid": "YOUR-SID"
  }
}' localhost:9292/send_sms
```

You should see the following response after you successfully post to your locally running server:

```
HTTP/1.1 200 OK

{"request_id":"52f367367575e449c3000001","summary":"SMS message sent"}
```

And of course the message will show up as a text on your phone as well.

##Deploying to Heroku

Now that we have our Integration server up and running let's deploy it to Heroku. Heroku is ideal for deploying lightweight utility applications, such as this one, and you can often get by on their free hosting option.

Make sure you have the Heroku Toolbet installed before proceeding.

###Create a New Heroku Project

Assuming your project is under Git source control you're now ready to set up your Heroku project and do a git push.

```bash
$ heroku create
```

This will create a Heroku project for you and give it a randomized name such as ‘fast-shelf–6572'. Let's rename the project to something better.

```bash
$ heroku rename twilio-tutorial --app fast-shelf-6572
```

Heroku requires a unique name for each application so you'll have to pick something other than "twilio_tutorial" for your Integration name.
Now let's push to Heroku, which will also automatically deploy the application.

```bash
$ git push heroku master
```

##Test your Deployment

Once your application is deployed we can test once again on our live server to make sure everything is working properly.

```ruby
$ curl -i -X POST -d '
{
  "request_id": "52f367367575e449c3000001",
  "sms": {
    "from" : "444-444-4444",
    "phone": "555-555-5555",
    "message": "Your order from the Foo Store has shipped!"
  },
  "parameters": {
    "auth_token": "YOUR-AUTH-TOKEN",
    "account_sid": "YOUR-SID"
  }
}' twilio-tutorial.herokuapp.com/send_sms
```

Replace ‘twilio-tutorial' in the above URL with the name of your Heroku project.
At this point you've now written and deployed a fully functional CenitHub Integration. The remaining steps of this tutorial will focus on registering your Integration with CenitHub so that others can use it.

##Register your Integration on CenitHub

Detailed instructions can be found in "How to register a custom Integration," and in our screencast, "How to write and register a custom Integration."

###Test your Integration through CenitHub

Now that we've configured CenitHub to send an SMS to the Twilio Integration every time a shipment is processed, let's test it out with some real Data. We'll need some Shipments to work with, so let's use the Push API to send some Data to CenitHub.

```bash
$ curl -i -X POST -H 'X-Hub-Store: YOUR_STORE_ID' \
-H 'X-Hub-Access-Token: YOUR_ACCESS_TOKEN' -d'{
  "shipments":[
  {
    "id": "1111111111",
    "order_id": "R1111111111",
    "email": "spree@example.com",
    "cost": 5.0,
    "status": "ready",
    "stock_location": "default",
    "shipping_method": "UPS Ground (USD)",
    "tracking": "",
    "updated_at": null,
    "shipped_at": "2014-02-03T17:33:55.343Z",
      "shipping_address": {
      "firstname": "Joe",
      "lastname": "Smith",
      "address1": "1234 Awesome Street",
      "address2": "",
      "zipcode": "90210",
      "city": "Hollywood",
      "state": "California",
      "country": "US",
      "phone": "0000000000"
    },
    "items": [
    {
      "name": "Spree T-Shirt",
      "product_id": "SPREE-T-SHIRT",
      "quantity": 1,
      "price": 30.0,
      "options": {
      }
    }]
  }
]
}' https://push.wombat.co
```

```
HTTP/1.1 202 Accepted
{"shipments":1}
```

Now let's update the shipment with our tracking number so that we can trigger the ‘shipment.update' event that will then call our Twilio Integration.

```bash
$ curl -i -X POST -H 'X-Hub-Store: YOUR_STORE_ID' -H 'X-Hub-Access-Token: YOUR_ACCESS_TOKEN' -d'{
"shipments":[
  {
    "id": "1111111111",
    "tracking": "12345678"
  }]
}' https://push.wombat.co
```

If successful you should then see an acknowledgement that it has updated a single shipment.

```
HTTP/1.1 202 Accepted
{"shipments":1}
```

Unfortunately the update has triggered a problem. Let's take a closer a look and see what's going on.

Click the problematic shipment and we'll see the following error notification produced by our Twilio Integration. Notice that send_sms Webhook of our Twilio Integration failed because the shipment contained an invalid phone number.

Fortunately, we have some good news: One of the many useful features of CenitHub is that it can be automatically configured to retry on failure. Since the problem is with our bad Data, however, no amount of retrying will change the situation. More good news for you: There's also a way to change bad Data in CenitHub.

Let's click the resolve button and start the "Resolution Wizard."

Choose the "Edit and Fix Directly in CenitHub" option and then you'll be presented with the following screen which contains an editable version of the object.

Go ahead and edit the phone number and change it to your personal mobile phone number so that Twilio can send the message. Hit "Update" when you're done and wait a few seconds for CenitHub to automatically retry your message.

Within a few seconds your SMS message should arrive on your phone. If you refresh the notifications tab you'll also see that the error was automatically marked as resolved.

For more on Integrations, check out our screencasts.
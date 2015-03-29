---
title: Twilio Integration
layout: page
description:
categories: Integrations
resource: true
order: 17
---

![Data Definitions](/img/integrations/twilio.png)

## Overview

[Twilio](http://www.twilio.com/), the cloud-based communications company that lets app and website developers embed calling and messaging features into their work with a bit of API code. Lets you send customers SMS every time an order is received or a shipment goes out or any other custom flow where you want send messages.

For good examples of Twilio applications you can read more in Twilio case studies at www.twilio.com/customers.

###Prerequisites

You need a Twilio account, you can create a free test account at www.twilio.com/try-twilio.

Then you need your Test Account Sid and Test Auth Token.

***
The source code for the [Twilio Integration](https://github.com/wombat/twilio_integration "Twilio integration") is available on Github.

***

###Configuration

##Schema

CenitHub has a pre-defined SMS Schema:

```json
{ 
  "title": "SMS", 
  "type": "object", 
  "properties": { 
    "from": { 
      "type": "string" 
    }, 
    "message": { 
      "type": "string" 
    }, 
    "phone": { 
      "type": "string" 
    } 
  } 
}
```

Sample Json SMS:

```json
{
  "sms": {
    "from": "444-444-4444",
    "phone": "555-555-5555",
    "message": "Order R12345 was shipped!"
  }
}
```

## Flow samples

### SMS Order

Sends a SMS for every new order that arrive to Cenit.

### SMS Ship

Sends a SMS every time a shipment ships.

#### Parameters

Both services need the same parameters

| Name | Value | Example |
| :----| :-----| :------ |
| twilio.account_sid | The SID value provided by Twilio on your account | regw45432542ragregewrgewrg4r |
| twilio.auth_token | The Auth token provided by Twilio on your account | 234534regegrewgwergergwegeg |
| twilio.phone_from | The phone number provided by Twilio on your account | 315 4566 3455 |
| twilio.address_type | Specify which address should phone number be picked from | billing |

#### Response

```json
{
  "message_id": "518726r84910515003",
  "notifications": [
    "level": "info",
    "subject": "SMS confirmation sent to +55 86 8869 9999",
    "description": "Hey Bob! Your order R4534543535 has been received."
  ]
}
```

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

![Pull Twilio Shared Collection](/img/integrations/twilio/twilio_config.jpg)

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

Request for Twilio Integration:


```json
{
"parameters": {
    "twilio_account_sid": "twqyewe7367wuyeqyu767326",
    "twilio_auth_token": "36473647hsdjdsjahd777828738"
},
"sms":{"from":"+155555555",
        "message":"Welcome Joe!",
        "phone":"+157845847548"
      },
"request_id":"5519811a43454e16463a0100"
}
```
 
## Flow samples

### SMS Order

Sends a SMS for every new order that arrive to Cenit.

#### Translator

![Convert Order to SMS](/img/integrations/twilio/convert_order_sms.jpg)

#### Flow

![Convert Order to SMS for every new order](/img/integrations/twilio/flow_order_sms.jpg)

### SMS Customer

Sends a SMS for every new Customer that create on Cenit.

#### Translator

![Convert Customer to SMS](/img/integrations/twilio/convert_customer_sms.jpg)

#### Flow

![Convert Customer to SMS for every new order](/img/integrations/twilio/flow_customer_sms.jpg)

#### Send SMS with Twilio

All data types, translators and flows required to send sms are available in Shared Collection Twilio Integration

![Send SMS flow](/img/integrations/twilio/flow_send_sms.png)

#### Notification

![Notification](/img/integrations/twilio/twilio_notification.png)
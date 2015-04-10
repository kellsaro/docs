---
title: Tender Endpoint
layout: page
description:
categories: Integrations
resource: true
order: 16
---

![Tender](/img/integrations/tender.png)

## Overview

[Tender](http://www.tenderapp.com/) offers a customer service software platform. Integration with Tender allows you to create and process support discussions in support of your customer base.

```
The source code for the [Tender Endpoint](https://github.com/spree/tender_endpoint/) is available on Github.
```

## Services

### Import

Imports a notification message of type "notification:error" or "notification:warning" and creates a Tender discussion for it.

###Pull Collection

![Pull Tender Shared Collection](/img/integrations/tender/tender_config.jpg)

#### Parameters

| Name | Value | Example |
| :----| :-----| :------ |
| tender.domain | Your Tender Domain | mywidgets |
| tender.api_key | Your Tender API Key | 1234567890 |
| tender.author_name | The name that will be used when creating new discussions  | Joe Jackson |
| tender.author_email | The email that will be used when creating new discussions |  joe_jackson@example.com |
| tender.category_id | The ID of the category the discussion should be created under | 777 |
| tender.public | Should newly created discussions be public? Must be either true or false | true |

###Configuration

##Schema

CenitHub has a pre-defined Ticket Schema:

```json
{
  "title": "Ticket",
  "type": "object",
  "properties": {
    "subject": {
      "type": "string"
    },
    "description": {
      "type": "string"
    }
  }
}
```

Sample Json SMS:

```json
{
  "sms": {
        "subject": "Error sending sms",
         "description": "Twilio integretion not OK"
  }
}
```

Request for Tender Integration:


```json
{ 
   "request_id":  "12e12341523e449c3000001",
   "parameters": {
                "tender_domain": "openjaf",
                "tender_api_key": "api-key",
                "tender_author_name": "CENITHub",
                "tender_author_email": "info@openjaf.com",
                "tender_category_id": "85600",
                "tender_public": "false"
   }, 
    "ticket": {
                "subject": "Test request from Wombat Integration",
                "description": "Test request from Wombat Integration"
    }
}
```
#### Response

```json
    {
    "request_id": "12e12341523e449c3000001",
    "summary": "New TenderApp discussion 'Example Ticket' created at https://openjaf.tenderapp.com/discussions/problems/12."
    }
```

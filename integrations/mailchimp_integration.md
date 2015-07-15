---
title: MailChimp Endpoint
layout: page
description:
categories: Integrations
resource: true
order: 8
---

![MailChimp](/img/integrations/mailchimp.png)

## Overview

[MailChimp](http://www.mailchimp.com/) is an online email marketing solution to manage contacts, send emails and track results. 

```
The source code for the [MailChimp Endpoint](https://github.com/spree/mailchimp_endpoint/) is available on Github.
```
## Services

### Subscribe

Subscribe an e-mail to your MailChimp list

###Pull Collection

![Pull Mailchimp Shared Collection](/img/integrations/mailchimp/mailchimp_config.jpg)

#### Parameters

 * **mailchimp.api_key:** Your MailChimp API key, example dj20492dhjkdj20492dhjk.

###Configuration

##Schema

CenitHub has a pre-defined Mambers Schema:

```json
{
  "title": "Member",
  "type": "object",
  "properties": {
    "email": {
      "type": "string"
    },
    "first_name": {
      "type": "string"
    },
    "last_name": {
      "type": "string"
    }
  }
}
```

Sample JSON Member:

```json
{
  Member {
    "email": "cenithub@example.com",
    "first_name": "CENITHub"
    "last_name": "Admin Group"
  }
}
```

Request for Mailchimp Integration:

Add to list

```json
{
  "request_id":  "12e12341523e449c3000001", 
  "parameters": { "mailchimp_api_key":"api-key" }, 
  "list_id":"b6da59a3ab", 
   "member": { 
           "email": "cenithub@example.com", 
           "first_name": "CENITHub", 
           "last_name": "Admin" 
   } 
}
```

Add to list

```json
{
   "request_id": "12e12341523e449c3000001", 
   "parameters": { "mailchimp_api_key":"apikey" }, 
   "member": { 
           "email": "cenithub@example.com", 
           "first_name": "CENITHub", 
            "last_name": "Admin",
            "list_id":["a5b08674ef","fa2c2d7aed"]
   } 
 }
```
#### Response

---notificationsinfo---

```json
  {
    "request_id": "12e12341523e449c3000001",
    "summary": "Successfully subscribed cenithub@example.com to the MailChimp list(s)"
  }
```

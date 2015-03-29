---
title: Endpoint Specific Messages
layout: page
description:
categories: Help & Support
resource: true
order: 1
---

## Overview

## Amazon

### Message Types

#### Poll Orders

This message is used for you to poll the Amazon API, retrieve any new orders you have for your seller account, and import them into your Spree store.

```json
{
  "message": "amazon:order:poll",
  "message_id": "1234567"
}
```
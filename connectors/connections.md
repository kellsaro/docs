---
layout: page
title: Connections
categories: Connectors
resource: true
description: Description Connections
index_order: 1
order: 1
---

# Connections

Connection are the representation of endpoint.

A connection consist in an URL and a set of parameters, headers and template parameters.

The connection URL, parameters and headers can be described by using Liquid Templates.

The template parameters and its values are available in the Liquid Templates as local variables so URL and its components can be computed dynamically.

### Connection example: Twilio API

The URL to connect with the Twilio API have the following form:

https://api.twilio.com/2010-04-01/Accounts/{account_sid}

and the following headers should be provided:

 * Accept-Charset: utf-8
 * Accept: application/json
 * Authorization: Basic {basic auth string}

where **{basic auth string}** is the base 64 format of the user Account SID and the Account token

A better approach is to use template parameters and Liquid Templates:

https://api.twilio.com/2010-04-01/Accounts/{account_sid}

 * Accept-Charset: utf-8
 * Accept: application/json
 * Authorization: Basic base64 ({account_sid}:{auth_token})

Defining the template parameters account_sid and auth_token Cenit computes dynamically the connection URL and its headers.

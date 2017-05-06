---
layout: page
title: Connection Role
categories: Connectors
resource: true
description: Description Connection Role
index_order: 1
order: 1
---

#Connection Role

A connection role is a relation between a set of connections and a set of webhooks indicating that every webhook in the set can be applied to every connection also in the set:

Define a group of [Webhooks]({{site.baseurl}}/connectors/webhooks) that can apply to several connections.

![Connection Roles]({{site.baseurl}}/img/flow/conn_rol.png)

If the connection role is not defined then Cenit look for any connection from which it is possible to reach the webhook through a connection role.

If the connection role is supplied the Cenit only look for the associated connections to the connection role.

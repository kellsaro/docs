---
layout: page
title: Introduction
categories: eCommerce
resource: true
description: Persistent objects and files
icon: fa-shopping-cart
type: parent
index_order: 4
index_title: eCommerce
order: 1
---

Cenit processes Data as a JSON representation.

All communication within Cenit involves sending and/or requesting data objects.

In Cenit you are free to create any Object Type. But in particular, for eCommerce, we encourage the use of a set of Object types that are predefined and installed by default in the eCommerce tab.

![Marketplace  <=> 3PL Integrations]({{site.baseurl}}/img/ecommerce/ecommerce_tab.png)

These Object types cover most of the uses that commonly appear in e-commerce.

Then we are trying to map each storefront or marketplace with eCommerce models. Each time that we added a new third party service for Fulfillment,  Accounting or Communication, its ready to create flow with any storefront or marketplace without any extra work.

![Marketplace  <=> 3PL Integrations]({{site.baseurl}}/img/ecommerce/marketplace_third_party_logistic.png)

All eCommerce Data has a well-defined JSON Schema.

* Customer

* Inventory

* Order

* Product

* Shipment

In order to check the JSON Schema, go to the action Data Type.

![Marketplace  <=> 3PL Integrations]({{site.baseurl}}/img/ecommerce/action_datatype.png)

That redirect to the corresponding Object Type:

![Marketplace  <=> 3PL Integrations]({{site.baseurl}}/img/ecommerce/product_datatype.png)

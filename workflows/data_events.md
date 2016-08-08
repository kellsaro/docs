---
layout: page
title: Data Events
categories: Workflows
resource: true
description: Description of Data Events
index_order: 1
order: 1
---

# Events

Allow that objects flow through the hub.

The creation of new objects and/or changes in existing objects will result in events. These events ultimately result in calls being made to various Flows in your integrations as well as your endpoint.

Events are invisible to your integrations. Your integrations only deal with receiving and returning objects. They are, however, impacted by events since the events are responsible for determining when your integration’s webhooks are called.


* Events trigger flow
* Default event 'created' and 'updated'
* Custom Event
* Connect objects to flows

## Custom Event

Using the approach of RailsAdmin for filter 

### Number [Decimal, Float, Integer]
* number: especific_number
* Between: start: [- infinite] end: [+infinite]
* is_present? (insure that is present)
* is_blanck? (nil or zero)

### Date
* Between … and …
* Today
* Yesterday
* This [Week, Month, Trimestral, Semestre, Year] 
* Last [Week, Month, Trimestral, Semestre, Year]
* is_present? (insure that is present)
* is_black? (nil or zero)

###String 
* Is exactly
* contain
* Start with: (prefix)
* End with: (suffix)
* is_present? (insure that is present)
* is_black? (nil or zero)

### Boolean
* select [true, false]

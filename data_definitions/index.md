---
layout: page
title: Introduction
categories: Data Definitions
resource: true
description: Libraries, Schemas & Data Types.
image: /img/data-definitions.png
type: parent
index_order: 2
index_title: Data Definitions
order: 1
---

# Libraries, Schemas & Data Types

Libraries are collections of schemas.

Schemas define data types.

Most of actions in Cenit involves a data type.

![Data Definitions](/img/data_definitions/types.png)

## Schemas

Define a data type is as simple as a JSON Schema.

```json
{
  "title": "Customer",

  "type": "object",

  "properties": {
    "firstname": {
      "type": "string"
    },
    "lastname": {
      "type": "string"
    },
    "email": {
      "type": "string"
    },
    "shipping_address": {
      "$ref": "Address"
    },
    "billing_address": {
      "$ref": "Address"
    }
  },
  "required": ["firstname", "lastname"]
}
```

## Basic Json Schema
Title defines a title for the data type, use is optional.

```json
"title": "Customer"
```

Type object is mandatory for enhanced data types interaction.

```json
"type": "object"
```

Properties is mandatory for enhanced data types interaction.

```json
"properties": {
  "firstname": {
      "type": "string"
  },
  "lastname": {
      "type": "string"
  },
  "email": {
      "type": "string"
  },
  "shipping_address": {
      "$ref": "Address"
  },
  "billing_address": {
      "$ref": "Address"
  }
}
```

Required properties definition is optional.

```json
"required": ["firstname", "lastname"]
```

##The new schema action

Every schema have an URI and must be included in a library.

![The new schema action](/img/data_definitions/screen_1.png)

##Loading Data types

When loading a data type Cenit creates a class model on the fly that can be used as any other model in the administration view.

![Loading Data types](/img/data_definitions/screen_2.png)

![Loading Data types](/img/data_definitions/loading_data_types.png)

##Enhancing Schemas

![Enhancing Schemas](/img/data_definitions/enhacing_2.png)

![Enhancing Schemas](/img/data_definitions/enhacing_3.png)

##Reusing Schemas

![Reusing Schemas](/img/data_definitions/reusing.png)


##XML Schemas

Defining data types from XML Schemas is supported.

This example defines a data type element:Costumer with an embedded definition of Address.

```xml
<?xml version="1.0" encoding='UTF-8'?>
<xs:schema xmlns:xs="http://wwww.w3.org/2001/XMLSchema">
  <xs:element name="Customer">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="Address">
          <xs:complexType>
            <xs:attribute name="number" type="xs:integer"/>
            <xs:attribute name="street" type="xs:string"/>
            <xs:attribute name="city" type="xs:string"/>
          </xs:complexType>
        </xs:element>
      </xs:sequence>
      <xs:attribute name="first_name" type="xs:string" use="required"/>
      <xs:attribute name="last_name" type="xs:string"/>
      <xs:attribute name="email" type="xs:string" use="required"/>
    </xs:complexType>
  </xs:element>
</xs:schema>
```

Cenit defines a data type for every top level type or element, so a single XML Schema may define multiple data types.

This example defines two data types, **type:Address** and **element:Costumer**

##Reusing XML Schemas

Cenit automatically links data types when referencing XML Schemas.

![Reusing Schemas](/img/data_definitions/xml_reusing.png)

##Versioning Schemas

URIs and data type names must be unique in the same library but data types versions with the same URI or name can be defined in different libraries.

![Reusing Schemas](/img/data_definitions/versioning_schema.png)


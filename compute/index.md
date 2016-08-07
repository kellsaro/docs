---
layout: page
title: Introduction
categories: Compute
resource: true
description: Define a logic for data manipulation.
image: /img/translator.png
icon: fa-cog
type: parent
index_order: 3
index_title: Compute
order: 1
---

# Translator

A translator defines a logic for data manipulation.

Data manipulation can occurs in the following scenarios:

 * Importing outside data into Cenit

 * Updating data already stored in Cenit

 * Converting data already stored in Cenit

 * Exporting data outside Cenit

![Data Definitions]({{site.baseurl}}/img/translator/flow.png)

## Import Translators

Import translators create data type records from outside data.

![Type Import]({{site.baseurl}}/img/translator/screen_1.png)

### Target data type

The target data type defines the type of the records to be created.

If no target data type is defined then the translator is supposed to be able to import data into any data type.

![Type Import]({{site.baseurl}}/img/translator/screen_3.png)

### Ruby style

The logic of an import translator is described in ruby style

The translator transformation is written in a DSL based on the Ruby Programming Language.

The variables data and target_data_type are available and represent the outside data and the target data type respectively.

A simple JSON importer can be defined by the following transformation:

```ruby
target_data_type.create_from_json!(data)
```

A little more of transformation code allows to parse the outside data and to create multiple records:
 
```ruby
if (parsed_data = JSON.parse(data)).is_a?(Array) 
  parsed_data.each { |item|  target_data_type.create_from_json!(item) }
else   
  target_data_type.create_from_json!(parsed_data)
end
```

There are several methods available on the target data type object that can be invoked to create records. They all have the following pattern:

```
(create|new)_from_(json|xml|edi)[!]

Example: create_from_xml, new_from_edi
```

The new methods does not persist the created record an a further invocation of a save method is needed.

The create methods attempt to persist the records, halting on error only if the method name ends with the exclamation symbol.

The following transformation parse a data using Nokogiri and creates one or multiple records from XML document elements:

```ruby
xml_doc = Nokogiri::XML(data)
elements = 
  if xml_doc.root['type'] == 'array'
     xml_doc.root.element_children
  else   
     [xml_doc.root]
  end
elements.each { |e|  target_data_type.create_from_xml!(e) }
```

## Export Translators

Export translators format data type records into data going outside Cenit.

The source data type defines the type of the records to be formatted.

If no source data type is defined then the translator is supposed to be able to format records of any data type.

A MIME type can be optionally defined.

![Type Export]({{site.baseurl}}/img/translator/screen_5.png)

### Ruby style

The translator transformation can be written in ruby style.

Depending on the translator having the option bulk source, the variable source or  sources is available representing a single record or an enumeration of records to be formatted.

A simple non bulkable JSON exporter can be defined by the following transformation:

```ruby
source.to_json
```
If the translator is bulkable a little more of transformation code is needed to format all the source records into a single JSON data: 

```ruby
if (jsons = sources.collect { |source| source.to_json(pretty: true) } ).length == 1
  jsons[0]
else
  "[#{jsons.join(',')}]"
end
```

Note: the result of the translation execution is the value of the latest evaluated expression.

There are a set of predefined methods available on record objects that can be used for basic formats:

```
to_(json|xml|edi)
```

Every formatter method can receive options, for example:

```ruby
source.to_json(pretty: true)
source.to_xml(with_blanks: true)
source.to_edi(field_separator: ‘+’)
```

The variable source_data_type is a reference to the translator source data type and for facility a method to_xml_array have been added to records enumeration, so a transformation for bulkable XML exporter  can be written as following:

```ruby
if sources.count == 1
  sources.first.to_xml
else
  sources.to_xml_array(root: source_data_type.slug)
end
```

### XSLT style

The logic of an export translator can be described as an XML Stylesheet transformation.

XSLT style translators are no bulkable.

Cenit convert the source record to XML format if necessary and the applies the XSLT transformation.

The following XSLT transformation changes the value of every attribute with name email by sample@mail.com:

![XSLT style]({{site.baseurl}}/img/translator/screen_4.png)

## Update Translators

Update translators update data type records.

The target data type defines the type of the records to be updated.

If no target data type is defined then the translator is supposed to be able to update records of any data type.

The logic of an import translator is described in ruby style.

![Update Translators]({{site.baseurl}}/img/translator/screen_6.png)

### Ruby style
Update translators are non bulkable so they are applied to a single target record which is available through the variable target:

```ruby
target.email = "sample@mail.com"
```

## Conversion Translators

Conversion translators transform records into others.

The source and target data types defines the records conversion types.

The logic of an import translator can be described in several format: ruby, XSLT and chain.

![Conversion Translators]({{site.baseurl}}/img/translator/screen_7.png)

### Ruby style

Conversion translators are non bulkable so they convert a record at the time. The source and target records are available through the variables target and source. Converting a costumer from a message would be as simple as:

```ruby
target.email = source.email
target.subject = "Hello #{source.first_name}"
target.boby = "Just to say hello!"
```

### XSLT style
Even if records are not stored in XML format an XSLT transformation is possible for Cenit by the following steps:

Format the source record into XML if necessary.

Applies the XSLT transformation to the XML formatted record.

Create a target data from the transformed XML document.

### Chain style

Chain style convert records by concatenating two conversion translator:

The source exporter: convert the source record to an intermediate data type.

The target importer: convert the intermediate record to the target data type.

![Chain Translators]({{site.baseurl}}/img/translator/screen_8.png)













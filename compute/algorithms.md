---
layout: page
title: Algorithms
categories: Compute
resource: true
description: Algorithms description.
index_order: 3
order: 1
---

# Algorithms

Algorithms are pieces of logic that you can choose to execute and chain in order to process data.

## Name

Algorithm names must be valid method names and thus must start with a letter and not contain white spaces or any
special characters.

## Parameters

Algorithms can have many parameters, each with their own individual fields.

### Name

The name of a parameter, besides the logical function of allowing you to recognize it on the administration 
interface, is also used as the name of the variable holding its value in the Algorithm's code, so it must be a
valid variable name.

### Type

You can leave a parameter untyped, which means it will accept any value passed on to it, or you can set a type 
for it in order to easily validate that the code receives what it expects.

Currently available types include:

 * `integer` for integer numbers.
 * `number` for floating point precision numbers.
 * `boolean` for boolean `true` or `false` values.
 * `string` for strings of characters.
 * `hash` for dictionary-like objects holding a set of `key: value` pairs. Best to represent complex objects. 

### Many

If checked the parameter will be treated as an array rather than a singular object.

### Required

If unchecked a default value must be provided.

### Default

Only available if the parameter is not required, this value will be used when no value is specified on execution.

It is important to note that all required parameters must be declared before the optional ones.

## Code

The actual code of the algorithm, must be written in Ruby, parameters can be accessed by their names.

## Store Output

If checked Cenit will attempt to store the output of the algorithm on a DataType record (or records if the output 
is an array).

## Output DataType

Only available if `Store Output` is checked. If left blank a new FileDataType will be created. When storing 
output on file data type records, the mime type of the file will be guessed from the output.

## Validate Output

Only available if an `Output DataType` is selected for the output storage. This will prevent chaining further 
algorithm executions in the output cannot be validated against the chosen data type, otherwise it will fail 
silently and allow any chaining to carry on.

# Algorithm Execution

When executing an algorithm you must specify all required parameters values. 

When an Algorithm is executed, be it manually from the administration site or through the API or automatically
triggered by an event, a record of the execution is created to which any resulting data types created are 
associated.
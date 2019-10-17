## Trigger Evaluators

When creating DataEvents sometimes you will need to create a more personalized triggers. Suppose you have the following datatype:

``
{
  "type": "object",
  "properties": {
    "package_id": {
      "type": "integer",
      "unique": true
    },
    "kind": {
      "type": "integer"
    }, 
    "name" : {
      "type": "string"
    }
}
``

Then, you are needing the flow to be triggered when `kind` is equals to `0` or to `1` or maybe `2`. You have the possibility to enter several triggers, which are going to be checking if all of them are true in order to launch the flow. That won't work in the given scenario, due to `kind` is not able to be `0`, `1` or `2` at the same time. Taht is to say Cenit will translate all those triggers with AND instead of OR. Luckily, you can define **trigger evaluators**.

Trigger evaluators are algorithms written in Ruby code. They will receive two parameters that you have to enter manually as the algorithm parameters: **current** and **previous**, mind this order. 
- current: represents the current record
- previous: represents the previous record
Also, this algorithms are going to return `true` if and only if the data event will be triggered, and `false` if otherwise.

Note that if `current` and `previous` are not `nil` the record is being updated, and if `current` is not `nil` but `previous` is `nil` then the record is being created. You can see this in a more clear way with the following code snippet:

``
if !current.nil? and !previous.nil?
   puts `a record is being updated`
end
if !current.nil? and previous.nil?
   puts `a record is being created`
end
`` 

This example is very raw, but the next example will be considering our scenario:

``
if !current.nil? and [0, 1, 2].include?(current['kind'])
  return true
end

return false
``

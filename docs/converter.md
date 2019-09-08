# Converter

Converter transformations helps to convert one record into another, usually from different data types but it can be from the same type. There are some options to configure a conversion, using templates like Liquid or Handlebars, by typing Ruby code or by configuring a Mapping Converter which is the most recent transformation feature.

![converter_create](https://user-images.githubusercontent.com/30662690/63619940-0df30800-c5be-11e9-80f4-8edcfe491de3.png)

> The source and target data types (target_data_type) defines the records conversion types.

If Source handler is true the object "sources" will be handler in the code. 

Code example:

```ruby
sources.each do |source|
    
  target = {
      'ecommerce_id' => source['product_id'],
      'title' => source['name'],
      'body_html' => source['description'],
      'short_description' => '',
      'variants' => [],
      'images' => []
  }

  target_data_type.create_from_json!(target, primary_field: 'ecommerce_id')
end
```

> target_data_type instruction is equal to said for example: Cenit.namespace('Lazada').data_type('Product'). But how it is defined in the structure of the converter UI, Cenit facilities the access to data_type.

> The code of a Converter is located into snippets. See more of this on: [Snippet section](snippets.md)

Template and Ruby converter transformations both have in common a local variable named `source`, which allows to access the source record, for the Ruby template there’s also available a local variable `target`, which allows to configure the target record. The transformation code is responsable to configure the target record, for the examples described at [[ Transformations ]]

Liquid:

```javascript
{
  "name": "{{source.name}} (converted)",
  "count": "{{source.items.count}}",
  "price": "{% eval source.items.inject(0) { |s, item| s + item.price } %}"
}
```

Ruby:

```ruby
target.name = "#{source.name} (converted)"
target.count = source.items.count
target.total_price = source.items.inject(0) { |s, item| s + item.price }
```

they both configure the name of the target as the source record name followed by `(converted)`, the target property `count` is the size of the association `items` in the source, and the `total_price` of the target is the sum of all the associated items prices.

A converter transformation can be coupled to an event via flow configuration. To execute the transformation every time a record is created just configure a flow choosing the transformation and a data event with a trigger for the `created_at` property when it is present. The present trigger for the property `created_at` only occurs when the record is created so the flow is executed just one time per source record. If it is desired the flow to be executed every time a record is updated it can be configured the data event with a trigger for the `updated_at` property when it changes. Now, the above conversion configurations codes will create a new record every time the flow is executed. To ensure the same target record is updated an `id` property value should be provided, for instance the same source id should works:

Liquid:

```javascript
{
  "id": "{{source.id}}",
  "name": "{{source.name}} (converted)",
  "count": "{{source.items.count}}",
  "price": "{% eval source.items.inject(0) { |s, item| s + item.price } %}"
}
```

Ruby:

```ruby
target.id = source.id
target.name = "#{source.name} (converted)"
target.count = source.items.count
target.total_price = source.items.inject(0) { |s, item| s + item.price }
```

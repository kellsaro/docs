# Converter

Conversion Transformations transform records into others inside Cenit.

![converter_create](https://user-images.githubusercontent.com/30662690/63619940-0df30800-c5be-11e9-80f4-8edcfe491de3.png)

> The source and target data types (target_data_type) defines the records conversion types.

If Source handler is true the object "sources" will be handler in the code. 

Code example:

```
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
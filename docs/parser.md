# Parser

Importing outside data into Cenit.

![parser_create](https://user-images.githubusercontent.com/30662690/63621014-ea7d8c80-c5c0-11e9-8583-62e1cad0c721.png)

In it definition, the Target data type, defines the structure where the data will be saved in Cenit.

> The data obtained from a request is stored in the variable: "data", and it should be transform to Json.

```
 data = JSON.parse(data)
 target_data_type.create_from_json!(data.to_json, primary_field: 'category_id')

```

> target_data_type instruction is equal to said for example: Cenit.namespace('Lazada').data_type('Product'). But how it is defined in the structure of the converter UI, Cenit facilities the access to data_type.

> The code of a Parser is located into snippets. See more of this on: [Snippet section](snippets.md)
# Webhooks

The webhook are the final step in a flow, implemented like a request HTTP to an endpoint, for sent or receive data.

Define an HTTP Method and params.

Webhooks are simple HTTP requests that contain JSON or XML formatted data relating to an event on Cenit.

![webhook_list](https://user-images.githubusercontent.com/30662690/64207265-48845c80-ce6a-11e9-9247-72b541e0bcc6.png)

## New Webhook

![new_wehbook_1](https://user-images.githubusercontent.com/30662690/64207874-82099780-ce6b-11e9-832d-18848cc1eb92.png)
![new_webhook_two](https://user-images.githubusercontent.com/30662690/64207988-d3b22200-ce6b-11e9-840b-b4fdfe8487cd.png)

Every Webhook include some common fields along with the specific object data for the event, these fields are:

- path: 

    It defines URL after the connection URL to do the request. Connection URL + Webhook URL, define the entire URL petition.

- Parameters:

	An array of Parameters needed to the petition. They will be part of the URL petition, ussually they will be sent after: "?" character in the URL direction.

- Headers:

    An array of Headers needed to the petition.

- Template parameters:

    Values of variables to fill in the webhook path, parameters or headers defined in `{{variable}}` way.
    This value ussually is fill via code.

### Example of paramenters, headers and template parameters definition

This is a wehbook where there is defined a "order_id" parameter, and it will be filled by a template_parameter in some place of the integration.


![webhook_show_one](https://user-images.githubusercontent.com/30662690/64209746-5688ac00-ce6f-11e9-96a5-a5a49cfb316e.png)
![show_wehbook_two](https://user-images.githubusercontent.com/30662690/64209765-6607f500-ce6f-11e9-8c70-a6f925606edf.png)

## How submit a webhook

1. Via code:

    ```
    request = Cenit.namespace('Shopify').webhook('Get order').submit(template_parameters: { 'order_id' => order_id })

    object = JSON.parse(request) # object has the result of the request.
    
    ```

    where: 
    - template_parameters: hash of template parameters defined in the webhook.
    
2. Submit action of webhooks:

    ![submit_webhook](https://user-images.githubusercontent.com/30662690/64210638-ce57d600-ce71-11e9-9909-130c94b62907.png)

    After that, Cenit will ask you about the connection, parameters, headers or template parameters that this request need.

    ![submit_webhook_one](https://user-images.githubusercontent.com/30662690/64211374-fa745680-ce73-11e9-9fc3-2ed3d659dcc6.png)


    And you can see the result of the request in notification list.

    ![submit_webhook_five](https://user-images.githubusercontent.com/30662690/64211523-7b335280-ce74-11e9-833b-dae50eda31b1.png)




---
title: Shipstation Endpoint
layout: page
description:
categories: Integrations
resource: true
order: 22
---

![Data Definitions](/docs/img/integrations/shipstation.png)

## Overview

[ShipStation](http://www.shipstation.com/), is a web-based software designed to help eCommerce retailers process, fulfill, and ship their orders from all the most popular marketplaces and shopping carts using all the top carriers.

For more information about the feature of ShipStation you can read more in www.shipstation.com/features/.

### ShipStation API

 The ShipStation API allows developers to build applications which interface with the ShipStation platform. The API can be used to automate many tasks including:

  * Managing Orders
  * Managing Shipments
  * Managing Warehouse
  * and more!

### API Documentation

 The API Documentation can be found here: **http://www.shipstation.com/developer-api/**


### Prerequisites

First, you will need an active Shipstation account. If you don’t have one, you can get started with a free 30-day trial at shipstation.com.

For generate the keys is necesary to enter in *API Setting -> Regenerate API Keys*.

![Regenerate API Keys](/docs/img/integrations/shipstation/api_keys.png)


###Pull Collection

![Pull Shiptstation Shared Collection](/docs/img/integrations/shipstation/shipstation_config.png)

#### Parameters

 * **API Key:** Key, example 72628b53a70d4cd4b589f5wicnwyfonciwci9

 * **API Secret:** Secret, example 296c217452064f51d69ndo2dpncowmc


### List of features that offers CenitHub with Shipstation.

-------------------------------------
 Carriers

 * Get by Code
 * List
 * List related Tags
 * List related Services
 * List related Packages

-------------------------------------
Customers

 * Get by Id
 * List

-------------------------------------
Orders

 * Create
 * Get by Id
 * List
 * Assign User
 * Hold Until
 * Mark As Shipped
 * Add Tag

-------------------------------------
Product

 * Get by Id
 * List

---------------------------------------------
Shipment

 * List

------------------------------------
Warehouse

 * Create
 * Get by Id
 * List
 * Update

##Configuration

###Schema for Order

CenitHub has a pre-defined Order Schema:

```json
{
  "title": "Order",
  "type": "object",
  "properties": {
    "orderId": {
      "type": "integer"
    },
    "orderNumber": {
      "type": "string"
    },
    "orderKey": {
      "type": "string"
    },
    "orderDate": {
      "type": "string"
    },
    "modifyDate": {
      "type": "string"
    },
    "paymentDate": {
      "type": "string"
    },
    "orderStatus": {
      "type": "string"
    },
    "customerUsername": {
      "type": "string"
    },
    "customerEmail": {
      "type": "string"
    },
    "items": {
      "type": "array",
      "items": {
        "title": "Order Item",
        "type": "object",
        "properties": {
          "orderItemId": {
            "type": "integer"
          },
          "lineItemKey": {
            "type": "string"
          },
          "sku": {
            "type": "string"
          },
          "name": {
            "type": "string"
          },
          "imageUrl": {
            "type": "string"
          },
          "weight": {
            "title": "Weight",
              "type": "object",
              "properties": {
                "value": {
                  "type": "number",
                  "description": "ID"
                },
                "units": {
                  "type": "string"
                }
              },
              "required": [
                "value",
                "units"
              ]
          },
          "quantity": {
            "type": "integer"
          },
          "unitPrice": {
            "type": "number"
          },
          "warehouseLocation": {
            "type": "string"
          },
          "options": {
            "type": "array",
            "items": {
              "title": "Item Option",
                "type": "object",
                "properties": {
                  "name": {
                    "type": "string"
                  },
                  "value": {
                    "type": "string"
                  }
                }
            }
          },
          "productId": {
            "type": "integer"
          },
          "adjustment": {
            "type": "boolean"
          }
        },
        "required": [
          "name",
          "quantity",
          "unitPrice"
        ]
      }
    },
    "orderTotal": {
      "type": "number"
    },
    "amountPaid": {
      "type": "number"
    },
    "taxAmount": {
      "type": "number"
    },
    "shippingAmount": {
      "type": "number"
    },
    "customerNotes": {
      "type": "string"
    },
    "internalNotes": {
      "type": "string"
    },
    "gift": {
      "type": "boolean"
    },
    "giftMessage": {
      "type": "string"
    },
    "requestedShippingService": {
      "type": "string"
    },
    "paymentMethod": {
      "type": "string"
    },
    "carrierCode": {
      "type": "string"
    },
    "serviceCode": {
      "type": "string"
    },
    "packageCode": {
      "type": "string"
    },
    "confirmation": {
      "type": "string"
    },
    "shipDate": {
      "type": "string"
    },
    "holdUntilDate": {
      "type": "string"
    },
    "weight": {
      "title": "Weight",
      "type": "object",
      "properties": {
        "value": {
          "type": "number",
          "description": "ID"
        },
        "units": {
          "type": "string"
        }
      },
      "required": [
        "value",
        "units"
      ]
    },
    "dimensions": {
      "title": "Dimension",
      "type": "object",
      "properties": {
        "units": {
          "type": "string"
        },
        "length": {
          "type": "integer"
        },
        "width": {
          "type": "integer"
        },
        "height": {
          "type": "integer"
        }
      }
    },
    "internationalOptions": {
      "title": "International Option",
      "type": "object",
      "properties": {
        "contents": {
          "type": "string"
        },
        "customsItems": {
          "type": "array",
          "items": {
              "title": "Custom Item",
              "type": "object",
              "properties": {
                "customsItemId": {
                  "type": "string"
                },
                "description": {
                  "type": "string"
                },
                "quantity": {
                  "type": "integer"
                },
                "value": {
                  "type": "number"
                },
                "harmonizedTariffCode": {
                  "type": "string"
                },
                "countryOfOrigin": {
                  "type": "string"
                }
              }
          }
        },
        "nonDelivery": {
          "type": "string"
        }
      }
    },
    "insuranceOptions": {
      "title": "Insurance Option",
      "type": "object",
      "properties": {
        "provider": {
          "type": "string"
        },
        "insureShipment": {
          "type": "boolean"
        },
        "insuredValue": {
          "type": "number"
        }
      }
    },
    "advancedOptions": {
      "title": "Advanced Option",
      "type": "object",
      "properties": {
        "warehouseId": {
          "type": "integer"
        },
        "nonMachinable": {
          "type": "boolean"
        },
        "saturdayDelivery": {
          "type": "boolean"
        },
        "containsAlcohol": {
          "type": "boolean"
        },
        "mergedOrSplit": {
          "type": "boolean"
        },
        "parentId": {
          "type": "integer"
        },
        "storeId": {
          "type": "integer"
        },
        "customField1": {
          "type": "string"
        },
        "customField2": {
          "type": "string"
        },
        "customField3": {
          "type": "string"
        },
        "source": {
          "type": "string"
        },
        "billToParty": {
          "type": "string"
        },
        "billToAccount": {
          "type": "string"
        },
        "billToPostalCode": {
          "type": "string"
        },
        "billToCountryCode": {
          "type": "string"
        }
      }
    },
    "shipTo": {
      "title": "Ship To",
      "type": "object",
      "properties": {
        "name": {
          "type": "string",
          "description": "Name of person"
        },
        "company": {
          "type": "string",
          "description": "Name of company"
        },
        "street1": {
          "type": "string",
          "description": "First line of address"
        },
        "street2": {
          "type": "string",
          "description": "Second line of address"
        },
        "street3": {
          "type": "string",
          "description": "Third line of address"
        },
        "city": {
          "type": "string"
        },
        "state": {
          "type": "string"
        },
        "country": {
          "type": "string",
          "description": "Country Code. The two-character ISO country code is required."
        },
        "phone": {
          "type": "string"
        },
        "postalCode": {
          "type": "string"
        },
        "residential": {
          "type": "boolean",
          "description": "Specifies whether the given address is residential"
        },
        "addressVerified": {
          "type": "string",
          "description": "Identifies whether the address has been verified by ShipStation (read only). Possible values: Address not yet validated, Address validated successfully, Address validation warning, Address validation failed."
        }
      },
      "required": [
        "name"
      ]
    },
    "billTo": {
      "title": "Bill To",
      "type": "object",
      "properties": {
        "name": {
          "type": "string",
          "description": "Name of person"
        },
        "company": {
          "type": "string",
          "description": "Name of company"
        },
        "street1": {
          "type": "string",
          "description": "First line of address"
        },
        "street2": {
          "type": "string",
          "description": "Second line of address"
        },
        "street3": {
          "type": "string",
          "description": "Third line of address"
        },
        "city": {
          "type": "string"
        },
        "state": {
          "type": "string"
        },
        "country": {
          "type": "string",
          "description": "Country Code. The two-character ISO country code is required."
        },
        "phone": {
          "type": "string"
        },
        "postalCode": {
          "type": "string"
        },
        "residential": {
          "type": "boolean",
          "description": "Specifies whether the given address is residential"
        },
        "addressVerified": {
          "type": "string",
          "description": "Identifies whether the address has been verified by ShipStation (read only). Possible values: Address not yet validated, Address validated successfully, Address validation warning, Address validation failed."
        }
      },
      "required": [
        "name"
      ]
    },
    "tagIds": {
      "type": "array",
      "items": {
        "type": "integer"
      }
    },
    "userId": {
      "type": "string"
    }
  }
}
```

Sample Json Order:

```json
{
  "orderNumber": "TEST-ORDER-API-DOCS",
  "orderKey": "0f6bec18-3e89-4771-83aa-f392d84f4c74",
  "orderDate": "2015-06-29T08:46:27.0000000",
  "paymentDate": "2015-06-29T08:46:27.0000000",
  "orderStatus": "awaiting_shipment",
  "customerUsername": "cenithub@cenitsaas.com",
  "customerEmail": "cenithub@cenitsaas.gov",
  "billTo": {
    "name": "The President",
    "company": null,
    "street1": null,
    "street2": null,
    "street3": null,
    "city": null,
    "state": null,
    "postalCode": null,
    "country": null,
    "phone": null,
    "residential": null
  },
  "shipTo": {
    "name": "The President",
    "company": "US Govt",
    "street1": "1600 Pennsylvania Ave",
    "street2": "Oval Office",
    "street3": null,
    "city": "Washington",
    "state": "DC",
    "postalCode": "20500",
    "country": "US",
    "phone": "555-555-5555",
    "residential": true
  },
  "items": [
    {
      "lineItemKey": "vd08-MSLbtx",
      "sku": "ABC123",
      "name": "Test item #1",
      "imageUrl": null,
      "weight": {
        "value": 24,
        "units": "ounces"
      },
      "quantity": 2,
      "unitPrice": 99.99,
      "warehouseLocation": "Aisle 1, Bin 7",
      "options": [
        {
          "name": "Size",
          "value": "Large"
        }
      ],
      "adjustment": false
    },
    {
      "lineItemKey": null,
      "sku": "DISCOUNT CODE",
      "name": "10% OFF",
      "imageUrl": null,
      "weight": {
        "value": 0,
        "units": "ounces"
      },
      "quantity": 1,
      "unitPrice": -20.55,
      "warehouseLocation": null,
      "options": [],
      "adjustment": true
    }
  ],
  "amountPaid": 218.73,
  "taxAmount": 5,
  "shippingAmount": 10,
  "customerNotes": "Thanks for ordering!",
  "internalNotes": "Customer called and would like to upgrade shipping",
  "gift": true,
  "giftMessage": "Thank you!",
  "paymentMethod": "Credit Card",
  "requestedShippingService": "Priority Mail",
  "carrierCode": "fedex",
  "serviceCode": "fedex_2day",
  "packageCode": "package",
  "confirmation": "delivery",
  "shipDate": "2015-07-02",
  "weight": {
    "value": 25,
    "units": "ounces"
  },
  "dimensions": {
    "units": "inches",
    "length": 7,
    "width": 5,
    "height": 6
  },
  "insuranceOptions": {
    "provider": "carrier",
    "insureShipment": true,
    "insuredValue": 200
  },
  "internationalOptions": {
    "contents": null,
    "customsItems": null
  },
  "advancedOptions": {
    "warehouseId": 31654,
    "nonMachinable": false,
    "saturdayDelivery": false,
    "containsAlcohol": false,
    "storeId": 12345,
    "customField1": "Custom data",
    "customField2": "Per UI settings, this information",
    "customField3": "can appear on some carrier's shipping labels",
    "source": "Webstore"
  }
}
```

## Flows

### 1. Create Order

 Create Order in Shipstation from Cenit.

#### Translator

![Export model of Order to Shipstation ](/docs/img/integrations/shipstation/export_model.png)

#### Flow

Create Order with Shipstation API Webhook

![Create Order for Shipstation](/docs/img/integrations/shipstation/create_order.png)


### 2. Get Order

  Get Order by Id

####   Webhook

![Webhook for Get Order by ID](/docs/img/integrations/shipstation/get_order.png)


####   Translator

![Import model for Shipstation](/docs/img/integrations/shipstation/import_model.png)

####   Flow

![Get Order](/docs/img/integrations/shipstation/flow_getorder.png)


### 3. List Product

 Obtains a list of products.

####  Webhook

![List All Products](/docs/img/integrations/shipstation/list_products.png)


#### Translator

![Import Model List](/docs/img/integrations/shipstation/import_model_list_root.png)


#### Flow

![List Product Model List](/docs/img/integrations/shipstation/flow_listproduct.png)


### 4. Get Carrier

Retrieves the shipping carrier account details for the specified carrierCode. Use this method to determine a carrier's account balance.

####  Webhook

![Get Carrier](/docs/img/integrations/shipstation/get_carrier.png)


#### Translator

![Export Carrier](/docs/img/integrations/shipstation/export_carrier_code.png)


#### Flow

![Flow Get Carrier](/docs/img/integrations/shipstation/flow_getcarrier.png)

## Shipstation Reference Integration with Odoo

Example of integration with the platform [Odoo](https://www.odoo.com/apps/modules/8.0/cenit_shipstation)
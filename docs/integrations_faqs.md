# Integrations FAQ

## Error linking "element/variable"

Sometimes in the algorithms and translators executions, Cenit can detect variables or algorithms names that don't exist in Cenit or into the code that is running.

`
Error source handling translation of records of type 'Integrator | Order' with 'Integrator | Int Order to Siigo Invoice': Error bundling algorithm alg97517080: error linking t
`

In this error example, the variable "t" doesn't exist in the translator code.

## Undefined method x

In some cases, you could have in your executions error messages where they indicate you `undefined method`. In those cases, you must study the error, and find in your code wich object is calling the method undefined. 

So, in those cases the solution could be:

1. the object referred is nil.
2. the object isn't nil, but, the method doesn't exist for it.

These are some examples where this kind of message is shown.

`
Error source handling translation of records of type 'Shopify | Product [My Tenants]' with 'ShopifyEcommerce | Shopify to Ecommerce Product [My Tenants]': undefined method gsub' for nil:NilClass
`

- The problem here was that the object wasn't nil, but the content of the object yes. So, isn't valid execute gsub method there.

`
No Method Error: undefined method join_process for nil:NilClass: undefined method join_process' for nil:NilClass
`
- In this case, the user was trying to execute a flow, that doesn't exist. So, the method join_process isn't valid.


## E
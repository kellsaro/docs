# Application

An application in Cenit is defined as an actions group where the user could access them through the application outside Cenit usually by the url: https://cenit.io/app/{app_id_or_slug}

It is helpful for creating your own application with its own interface and using Cenit as background. Also helpful to interact with a third party application.

## New Application

Go to Compute Menu/Application, and there you must view the application's list.

![application](https://user-images.githubusercontent.com/30662690/63795201-6fbeb500-c8d1-11e9-992d-734d7c550f13.png)

> In a same tenant you could have many applications but with differents id and slugs.

![application_new](https://user-images.githubusercontent.com/30662690/63795788-b1039480-c8d2-11e9-9170-ebd01563c8c0.png)

- Slug: it will be the slug that the application will be in the url path.

- Registered: if the application is registered, the application will be available outside Cenit.

- Actions: these are the algorithms or actions the application will have. They must be acceded by the way: https://cenit.io/app/{app_id_or_slug}/{action_path}

    -  Method: It defines the request method how is access the action of the application outside Cenit. For example: GET/POST/UPDATE etc.

    - Path: the URL path after the App URL base, wich the action will be accessible outside Cenit.

    - Action: This is the algorithm that the application will execute when the path is consulted. What this algorithm returned will be rendered to the application URL path. 

    If you have in doubt how create an algorithm, follow this link: [Algorithm section](algorithms.md)

    This algorithm must have as parameters: "control" and "params".

    Params parameter:

    "params" variable is an hash object in which you could have the URL parameters obtained from the application outside Cenit.

    Control parameter: 

    "control" is an object that is passed as parameter in the actions algorithms. This object allows you access to differents methods to reduce the Cenit elements calls.

    - control.algorithm: Method to access to an algorithm passed as a parameter.
        `control.algorithm(:get_products).run([parameters])`

    - control.data_type: Method to access to a datatype passed as parameter.

        `product = control.data_type('Shopify::Product').where('product_sku' => '123').first`

    - control.notify: Methos to create notifications.

        `control.notify("Something")`

    - control.fail: this calls to Cenit fail function.

        `control.fail('Access deny') `

    - control.render json: this is what the algorithm will render to the application in json format.

        `control.render json: { notice: obj.message }, status: 200`

## Application Actions

![actions_app](https://user-images.githubusercontent.com/30662690/63799447-22931100-c8da-11e9-9162-7901135d9c91.png)


### Configure

![configure_app](https://user-images.githubusercontent.com/30662690/63802759-4d349800-c8e1-11e9-98c3-8ae847c16297.png)

- Authentication method: Is how the app will be acceded.

    - Application ID

    If the app is configured as "Application ID" it means the user can access to it by https://cenit.io/app/{app_id}/{action_path}. Cenit does not request authentication to your app if is configured of that way.

    - User credentials

    If the app is configured as "User credentials" it means the user can access to it by https://cenit.io/app/{app_slug}/{action_path}. In this case, when you can access the app, Cenit will request authentication. If the access to the app is via API, you must provide the: X-Tenant-Access-Key and X-Tenant-Access-Token. If the app has acceded UI, Cenit will request the user and password to enter to your account.

- Redirect uris
    - In Cenit the redirect URI is by default: "https://cenit.io/oauth/callback"

### Regist

![application_regist](https://user-images.githubusercontent.com/30662690/63804600-8c64e800-c8e5-11e9-8f59-4e97fd2e989d.png)

There is where you should provide the slug for to access to the app: https://cenit.io/app/{app_slug}




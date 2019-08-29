# Collections

A collection is a way to organize a group of elements of an integration that you want save in your tenant, and later, export, import or share it to another account or tenant.

Also, is a way to gorup elements to share them in a same operation.

To go the Collection Section, go to Integration Menu/ Collections.

![collection_list](https://user-images.githubusercontent.com/30662690/63867468-e23b9d80-c982-11e9-825b-2a2f6756d339.png)

## Add New

![collection_new](https://user-images.githubusercontent.com/30662690/63866986-1c586f80-c982-11e9-86b2-6d912fb5cc1c.png)


> The collection name must start with a letter and not contain white spaces or any special characters.

In each section you should add the elements that you need your collection has.

## Create a Shared a collection

To share a collection go to, Actions Menu of the collection you want to share, and go to Share option.

![collection_share](https://user-images.githubusercontent.com/30662690/63867645-3ba3cc80-c983-11e9-8e39-a819e52675e0.png)

![shared_collection_one](https://user-images.githubusercontent.com/30662690/63869531-490e8600-c986-11e9-9a8f-fa6a73b4bfe1.png)
![share_collection_two](https://user-images.githubusercontent.com/30662690/63869576-5af02900-c986-11e9-8634-ce1829a59d32.png)

- Name:

    it must start with a letter and not contain white spaces or any special characters. Also, it only allows for minuscules.

- Summary:

    Collection description.

- Categories:

    This define the category where the collection will be as shared collection.

- Pull Parameters:

    These are defined as generic parameters necessary to establish in a collection when it will be incorporated into another tenant while Pull action. 
    These parameters could be set into:
    - template_parameters of connections or webhooks into the collection.
    - any object reference of elements in a collection.

    The pull parameters are optional, and its values aren't shared in a collection, so, when the user does pull to a collection, the pull parameters values will be requested.

- Run asynchronous:

    If it is enabled, means that the Pull action of the Shared collection will be done without asking you if the action could update or overwrite the possible existed elements into your tenant where you want to pull the collection.

When you shared the collection you can see it in the [Shared Collection](shared_collection.md) page.

## Export a collection

Sometimes you could have the needed to export your collection without shared to another account or tenant.

For that needed, in Cenit exists the "Export" action.

![export_collection](https://user-images.githubusercontent.com/30662690/63887953-e29c5e80-c9ab-11e9-8973-7b08c3ecb28f.png)

### Export collection to JSON format

After select the Expor option, select in the next form the translator: `Basic | Share JSON [Shared]`

![export_collection_one](https://user-images.githubusercontent.com/30662690/63888245-85ed7380-c9ac-11e9-8593-839cfdbfec28.png)

This action will generate a task that you need follow.

![export_collection_two](https://user-images.githubusercontent.com/30662690/63888813-b1bd2900-c9ad-11e9-8506-8c832e3558cd.png)

And there you will see the content of the collection in a .json file that you can save where you want, and later to import it where you need.

![export_collection_three](https://user-images.githubusercontent.com/30662690/63889122-60fa0000-c9ae-11e9-965c-5e841ab739c3.png)

## Import a collection

After having a collection file exported previously, you have the possibility to Import it. It could be by "Import" or "Pull Import" actions.

![import_collection](https://user-images.githubusercontent.com/30662690/63890250-8daf1700-c9b0-11e9-8867-f487a531a245.png)

### Import a .json collection file.

An Import action will import a new collection and the content of this into your tenant. If an element of the collection that you want to import already exists in the tenant, this action will overwrite it.

After clicked Import Action, you will see this form:

![import_collection_one](https://user-images.githubusercontent.com/30662690/63890875-d87d5e80-c9b1-11e9-9eef-02f665893777.png)

There you must select the translator: `Basic | JSON Importer [Shared]`

There are two options to import:
- File:  Select the .json file to import.

- Data:  Copy the json content in the Data box.

After choose one of two options, click "Import" button and the Import task will be executed. When the task finished, you will see the collection imported in your tenant.

### Pull Import

A pull import action will import the content of the specified file, but it will have you the possibility to evaluate the changes that it would cause in your tenant. It means that the action will show you what elements will be created or updated in your tenant, and if you have in doubt about these actions, you can cancel the operation.

![pull_import](https://user-images.githubusercontent.com/30662690/63892052-a8838a80-c9b4-11e9-84ab-92a559ed60b9.png)

You can select a file or copy the data with the content you want import.

After clicking the Pull Import button, you can follow the task associated to it and check the status.

![pull_import_one](https://user-images.githubusercontent.com/30662690/63892318-5a22bb80-c9b5-11e9-89fd-7f7bca4e3af8.png)

There you must view the task with status: Paused. It means you must accept if the changes will be applied. For do that, go to State option.

![pull_import_two](https://user-images.githubusercontent.com/30662690/63892700-3dd34e80-c9b6-11e9-849c-c085a569bd0f.png)

After that, you can confirm the operation and see the elements to create or update.

![pull_option_four](https://user-images.githubusercontent.com/30662690/63892885-c05c0e00-c9b6-11e9-8e31-fa45dae0a009.png)

If you are agree click the Pull button, if not, cancel the task and the collection won't be pulled.




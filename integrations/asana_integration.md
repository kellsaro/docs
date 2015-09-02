---
title: Asana Endpoint
layout: page
description:
categories: Integrations
resource: true
order: 27
---

![Data Definitions](/img/integrations/asana.png)

## Overview

[Asana](http://www.asana.com/), is a web and mobile application designed to enable teamwork without email.

For more information about the feature of Asana you can read more in www.asana.com.

###Asana API

The API is available for free to everyone with an Asana account and can be accessed through their developer site. Asana is integrated with several popular productivity tools including Dropbox, Evernote, Google Drive, Harvest, Instagantt, Jira, Zendesk, and DigiSpoke, among others.


###-API Documentation

 The API Documentation can be found here: **https://asana.com/developers/api-reference**


###Register

You must first register your application with Asana to receive a client ID and client secret. Fortunately, this process is fast and easy: visit your Account Settings dialog, click the Apps tab, and “Add New Application”.
The applications can be created from the “Apps” tab of your account settings, where you will find your Client ID and Client Secret.

![Regenerate API Keys](/img/integrations/asana/token.png)


###Pull Collection

![Pull Asana Shared Collection](/img/integrations/asana/pull_collection.png)

#### Parameters

 * **Personal Token:** Token, example 72628b53a70d4cd4b589f5wicnwyfonciwci9


### List of features that offers CenitHub with Asana.

-------------------------------------
 User

 * List users
 * List users in workspace
 * Get user

-------------------------------------
 Project

 * Create Project
 * Update Project
 * Get Project
 * List Project
 * List Sections on Project

-------------------------------------
 Task

 * Create task
 * Get Task
 * Update Task
 * List Task
 * List of Tag on Task
 * Create subtask
 * List all of a task's subtasks
 * List Story on Task

-------------------------------------
 Tag

 * Create tag
 * List tags
 * Get tag
 * Update tag
 * Get all tasks with a tag

---------------------------------------------
 Story

 * Get story
 * List of Story


##Configuration

###Schema for Project

CenitHub has a pre-defined Project Schema:

 ```json
  {
    "title": "Project",
    "type": "object",
    "properties": {
      "projectId": {
        "type": "integer"
      },
      "created_date": {
        "type": "string",
        "edi": { "segment": "created_at"}
      },
      "modified_date": {
        "type": "string",
        "edi": { "segment": "modified_at"}
      },
      "owner": {
        "$ref": "user.json",
        "properties": {"userId":{"edi": {"segment": "id"}}}
      },
      "due_date": {
        "type": "string"
      },
      "public" :{
        "type": "boolean"
      },
      "name": {
        "type": "string"
      },
      "notes": {
        "type": "string"
      },
      "archived": {
        "type": "boolean"
      },
      "workspace": {
        "$ref": "workspace.json" ,
        "properties": {"workspaceId":{"edi": {"segment": "id"}}}
      },
      "members": {
        "type": "array",
        "items": {
          "$ref": "user.json",
        "properties": {"userId":{"edi": {"segment": "id"}}}
         }
      },
      "color": {
        "type": "string",
        "enum": [
          "dark-pink",
          "dark-green",
          "dark-blue",
          "dark-red",
          "dark-teal",
          "dark-brown",
          "dark-orange",
          "dark-purple",
          "dark-warm-gray",
          "light-pink",
          "light-green",
          "light-blue",
          "light-red",
          "light-teal",
          "light-yellow",
          "light-orange",
          "light-purple",
          "light-warm-gray"
        ]
      },
      "followers": {
        "type": "array",
        "items": {
          "$ref": "user.json",
        "properties": {"userId":{"edi": {"segment": "id"}}}
         }
      },
      "team": {
        "$ref": "team.json",
        "properties": {"teamId":{"edi": {"segment": "id"}}}
      }

    }
  }
```

Sample Json Project:

```json
   {
           "id": 47249379009147,
           "created_at": "2015-08-28T16:37:35.491Z",
           "modified_at": "2015-08-28T16:37:35.491Z",
           "owner": null,
           "due_date": null,
           "current_status": null,
           "public": true,
           "name": "Test Integration",
           "notes": "This is an integration with CenitHub",
           "archived": false,
           "workspace": {
               "id": 47249376532165,
               "name": "cenit"
           },
           "members": [
               {
                   "id": 47249376288256,
                   "name": "Octavio Herrera"
               }
           ],
           "color": null,
           "followers": [
               {
                   "id": 47249376288256,
                   "name": "Octavio Herrera"
               }
           ]
       }
```

## Algorithms

### 1.extract_model_ref

Extract Id from Hash.

![Algorithms for  Extract model](/img/integrations/asana/extractmodel.png)

### 2.transform_model

Transform Id with Model and reference model.

![Algorithms for  Transform model](/img/integrations/asana/transformmodel.png)

## Flow samples

### 1.Create Project

This method creates a new project and returns its full record.

### Webhook

![Webhook for Create Project](/img/integrations/asana/createProject.png)


#### Translator

![Export model of Project to Asana ](/img/integrations/asana/export_model.png)

#### Flow

Create Project with Shipstation API Webhook

![Create Project for Asana](/img/integrations/asana/flow_create_project.png)


### 2.Create SubTask

Creating a subtask is the same as a creating an normal task, but instead of specifying a workspace you must specify a parent task.

####   Webhook

![Webhook for Create SubTask](/img/integrations/asana/create_subtask.png)


####   Translator

![Import Model for Asana](/img/integrations/asana/update_model.png)

####   Flow

![Create SubTasks on Project](/img/integrations/asana/flow_create_subtask_project.png)


### 3.List User

This method returns the user records, described above, for all users in all workspaces and organizations.

####  Webhook

![List All Users](/img/integrations/asana/list_users.png)


#### Translator

![Import List](/img/integrations/asana/import_list.png)


#### Flow

![List Users ](/img/integrations/asana/flow_list_users.png)



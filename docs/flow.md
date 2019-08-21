# Flow

Flows define how Data is routed between endpoints and all integrations in order to automate your operations. The relevant Flows will be triggered based on the events that you define for your endpoint.

In a integration generally you must have the need to create three kinds of integration that will depends of the translation kind that you select in the configuration flow. Depending on the translator or the flow kind, Cenit will require you the data to fill in the flow form. The flow types are:
  1. Parser/Import: It refers to Get petitions. The flow will do a Get request and the data will be obtained in the parser translator.
  2. Converter: It refers to a transformation between two data in Cenit. This kind of flow don't do any request outside Cenit.
  3. Export/Translator: It refers to a flow where the data is transform in a translator wich result is export while a POST/UPDATE/DELETE petition to a API.

>> For more detail of how to do a basic integration go to ![Basic Cenit Integrations](See Cenit Basics integrations)



## Add New

For creating a flow you must have in mind what events, translators, algorithms, and data will be related in a petition while a webhook/resource.
Create a translator, involves 3 fundamental steps in the wizard form: “Select the translator”, “Select the webhook” and “Save and done”.

<!-- Image create form 1 -->
In each step you will fill new fields in the creation form and depending on that, existing mandatory fields, which if they are not predefined beforehand, you can have the option to create them in this same view with a pop-up window.


Set `coverpage` to **true**, and create a `_coverpage.md`:

```html
<!-- index.html -->

<script>
  window.$docsify = {
    coverpage: true
  }
</script>
<script src="//unpkg.com/docsify/lib/docsify.min.js"></script>
```

```markdown
<!-- _coverpage.md -->

![logo](_media/icon.svg)

# docsify <small>3.5</small>

> A magical documentation site generator.

- Simple and lightweight (~21kB gzipped)
- No statically built html files
- Multiple themes

[GitHub](https://github.com/docsifyjs/docsify/)
[Get Started](#docsify)
```

!> A document site can have only one coverpage!

## Custom background

The background color is generated randomly by default. You can customize the background color or a background image:

```markdown
<!-- _coverpage.md -->

# docsify <small>3.5</small>

[GitHub](https://github.com/docsifyjs/docsify/)
[Get Started](#quick-start)

<!-- background image -->

![](_media/bg.png)

<!-- background color -->

![color](#f0f0f0)
```

## Coverpage as homepage

Normally, the coverpage and the homepage appear at the same time. Of course, you can also separate the coverpage by [onlyCover option](configuration.md#onlycover).

## Multiple covers

If your docs site is in more than one language, it may be useful to set multiple covers.

For example, your docs structure is like this

```text
.
└── docs
    ├── README.md
    ├── guide.md
    ├── _coverpage.md
    └── zh-cn
        ├── README.md
        └── guide.md
        └── _coverpage.md
```

Now, you can set

```js
window.$docsify = {
  coverpage: ['/', '/zh-cn/']
};
```

Or a special file name

```js
window.$docsify = {
  coverpage: {
    '/': 'cover.md',
    '/zh-cn/': 'cover.md'
  }
};
```

# [fit] Middleman

## [fit] Ruby + HTML/CSS/JS

---

# Static sites

A "static site" refers to a web site that has no dynamic processing on the back-end.

All assets are HTML, CSS, JS, or image files.

---

# Middleman

* a static site generator
* can combine data and templates to make HTML
* can insert Ruby methods into HTML
* can process other file types to create assets

---

# Installing

```sh
$ gem install middleman
```

---

# What is this gem thing, anyway?

---

# Creating a new site

```sh
$ middleman init NAME
```

---

```
├── Gemfile
├── config.rb
└── source
    ├── images
    │   ├── background.png
    │   └── middleman.png
    ├── index.html.erb
    ├── javascripts
    │   └── all.js
    ├── layouts
    │   └── layout.erb
    └── stylesheets
        ├── all.css
        └── normalize.css
```

---

# Gemfile

```
# If you have OpenSSL installed, we recommend updating
# the following line to use "https"
source "http://rubygems.org"

gem "middleman", "~> 3.3.6"

# Live-reloading plugin
gem "middleman-livereload", "~> 3.1.0"

# For faster file watcher updates on Windows:
gem "wdm", "~> 0.1.0", :platforms => [:mswin, :mingw]

# Windows does not come with time zone data
gem "tzinfo-data", platforms: [:mswin, :mingw]
```

---

# config.rb

## Set up Middleman for building your application.

---

# .erb

* __E__mbedded __R__u**b**y
* Just like HTML, but
* Adds `<% %>` and `<%= %>` tags
* Which aren't really tags
* But execute Ruby code inside them

---

# ERb example

```html
<ul>
  <% people.each do |person| %>
    <li class="name"><%= person.name %></li>
  <% end %>
</ul>
```

---

# source/index.html.erb

```html
---
title: Welcome to Middleman
---

<div class="welcome">
  <h1>Middleman is Watching</h1>
  <p class="doc">
    <%= link_to "Read Online Documentation", "http://middlemanapp.com/" %>
  </p><!-- .doc -->
</div><!-- .welcome -->
```

What is even happening here?

---

# layouts/layout.erb

```html
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">

    <!-- Always force latest IE rendering engine or request Chrome Frame -->
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">

    <!-- Use title if it's in the page YAML frontmatter -->
    <title><%= current_page.data.title || "The Middleman" %></title>

    <%= stylesheet_link_tag "normalize", "all" %>
    <%= javascript_include_tag  "all" %>
  </head>

  <body class="<%= page_classes %>">
    <%= yield %>
  </body>
</html>
```

---

# Helpers

## Helpers are methods that either come with Middleman or that you write that assist you in producing the output you want.

---

# Common helpers

* `link_to`
* `tag` and `content_tag`
* `stylesheet_link_tag`
* `javascript_include_tag`
* `truncate` and `truncate_words`
* `content_for` and `yield_content`

---

# Make your own helpers

```ruby
# in config.rb
require 'nokogiri'

helpers do
  def summarize(article)
    document = Nokogiri::HTML.parse(article.body)
    document.css('p:first').text
  end
end
```

---

# Helper modules

```ruby
# in helpers/article_helpers.rb
module ArticleHelpers
  def summarize(article)
    # ...
  end

  def article_image(article)
    # ...
  end
end
```

---

# Middleman data

Middleman makes any data at the top of a rendered page available to it. The data is in [YAML](https://en.wikipedia.org/wiki/YAML).

---

# Frontmatter

```
---
template: post
title: Quines!
tags: quines, javascript, lua
image: stairs.jpg
---

# rest of file below
```

---

# Local data

Middleman also makes data files stored under the `data` directory available to you.

---

# data/menu.yml

```
Syllabus: /syllabus.html
Prework: /prework.html
Setup:
  Overview: /setup/index.html
  Atom: /setup/atom.html
  Homebrew: /setup/homebrew.html
Resources: /resources.html
Notes: /notes/
```

---

# layouts/layout.erb

```html
<% data.menu.each do |title, link_or_dropdown| %>
  <% if link_or_dropdown.respond_to?(:each) %>
  <li class="has-dropdown">
    <a href="#"><%= title %></a>
    <ul class="dropdown">
      <% link_or_dropdown.each do |title, link| %>
        <%= menu_item(title, link) %>
      <% end %>
    </ul>
  </li>
  <% else %>
    <%= menu_item(title, link_or_dropdown) %>
  <% end %>
<% end %>
```

---

# layouts/layout.erb

```html
<% data.menu.each do |title, link_or_dropdown| %>
  ...
<% end %>
```

---

# What can you put in data/?

* Users
* Projects
* Anything!

---

# Middleman plugins

* middleman-deploy
* middleman-blog

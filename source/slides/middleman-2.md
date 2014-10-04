# [fit] Advanced Middleman

---

# Page collections

Use `sitemap` in your templates.

```ruby
sitemap.where(:category => "article").order_by(:date).limit(10)
```

---

# Sass: CSS +

* variables
* nesting
* partials
* better @import
* mixins
* @extend

---

# [fit] Bourbon

Gives us Sass mixins, methods, and variables to eliminate vendor prefixes and make writing CSS faster.

---

## Adding Bourbon gems

```ruby
# Gemfile

gem 'bourbon', require: false
gem 'neat', require: false
```

---

## Using Bourbon

Rename `all.css` to `all.css.scss`, if you haven't already.

```css
/* all.css.scss */
@import "bourbon";
@import "neat";
```

---

# Adding other gems

* font-awesome
* foundation-rails

---

# Deploying to GitHub Pages

* middleman-deploy

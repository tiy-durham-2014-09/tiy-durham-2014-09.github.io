# Tools of the Trade

---

## Atom key commands

* ⌘-⬆︎-p - Opens command palette
* ⌘-p - Opens file finder
* ⌘-r - Go to symbol
* ⌘-/ - Toggle commenting
* ^-Space - Autocomplete

---

## Atom

### Command palette

* Editor: Auto Indent

### Packages

* Linter
* Linter Ruby
* Linter Rubocop

---

## Setting Atom as your EDITOR

Add to your `~/.profile`:

`export EDITOR="atom -w"`

---

## Pry

* `gem install pry pry-byebug pry-doc`
* From now on, run `pry` instead of `irb`

---

## Using pry in your code

```ruby
# TOP OF FILE
require 'pry'

# LATER
name = gets.chomp
binding.pry # Here is the important line
puts "Hi, #{name}"
```

---

## Wren

* `gem install wren`
* `wren new <project>`

---

## Git and GitHub

* Creating a new git repository
* Adding files
* Committing files
* Creating a repository on GitHub
* Pushing to GitHub

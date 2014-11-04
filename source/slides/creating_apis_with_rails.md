# Creating APIs with Rails

---

## The "Easy" Way

* Add `respond_to` blocks in your controllers
* Provide views for your JSON, XML, or other outputs

---

## respond_to

```ruby
# people_controller.rb
def index
  @people = Person.all

  respond_to do |format|
    format.html
    format.json { render json: @people }
    format.xml { render xml: @people }
  end
end
```

[Documentation](https://www.omniref.com/ruby/gems/actionpack/4.1.6/symbols/ActionController::MimeResponds/respond_to?d=137350000&n=1#)


---

## Alternative way to use respond_to

```ruby
respond_to :html, :xml, :json

def index
  @people = Person.all
  respond_with(@people)
end
```

---

## What's the downside to this method?

* It ties your web interface to your API interface.
* Results in complex controllers.

---

## Another way

Build your API separate from your web interface

```ruby
module API
  module V1
    class PeopleController < ApplicationController
      @people = Person.all
      render json: @people
    end
  end
end
```

---

## Upsides of this way

* Allows divergent behavior between web and API.
* Allows for versioning.

---

## Issue: API vs Api

```ruby
# config/initializers/inflector.rb
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'API'
end
```
---

# Rails API gem

### "a subset of a normal Rails application, created for applications that don't require all functionality that a complete Rails application provides"

### also provides code we can use in a standard Rails application

---

## rails-api

```ruby
# Gemfile
gem 'rails-api'
```

---

## Making a new base controller

```ruby
# provided by rails-api
class API::V1::BaseController < ActionController::API 
  # doesn't use
  # Rack::MethodOverride
  # ActionDispatch::Cookies
  # ActionDispatch::Session::CookieStore
  # ActionDispatch::Flash
  # ActionDispatch::BestStandardsSupport
end
```

---

## Using our new base controller

```ruby
module API
  module V1
    class PeopleController < BaseController
      @people = Person.all
      render json: @people
    end
  end
end
```

---

# Active Model Serializers

### Lets us customize JSON and XML output for our models.

---

## Creating a new serializer

```bash
rails g serializer person
```

---

## PersonSerializer

```ruby
class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :url

  def url
    person_url(object)
  end
end
```
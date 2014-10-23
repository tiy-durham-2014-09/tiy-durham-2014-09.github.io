# Rails Resources

---

## The concept of a resource

* A resource is a thing exposed to the outside world from your application
* Examples
  * http://example.org/questions
  * http://example.org/questions/1
  * http://example.org/questions/1/vote

---

## HTTP verbs and resources

* `GET` - safe, gets information
* `POST` - unsafe, creates information
* `PUT` or `PATCH` - idempotent, updates information
* `DELETE` - idempotent, deletes information

---

## Rails resources

* Usually contain the plural and singular resource in one controller.

```ruby
class QuestionsController < ApplicationController
  def index; end     # GET    /questions
  def show; end      # GET    /questions/1
  def new; end       # GET    /questions/new
  def create; end    # POST   /questions
  def edit; end      # GET    /questions/1/edit
  def update; end    # PATCH  /questions/1
  def destroy; end   # DELETE /questions/1
end
```

---

## Nested resources

```ruby
resources :questions do
  resources :answers, only: [:create]
end
```

---

## Nested resources

Resources should never be nested more than 1 deep!

```ruby
## NOPE
resources :questions do
  resources :answers do
    resources :votes
  end
end
```

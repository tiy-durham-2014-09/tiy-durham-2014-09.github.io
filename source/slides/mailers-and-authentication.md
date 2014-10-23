# Authentication and Mailers

---

## Goal: recover password

The user should be able to recover their password via email. We should
_never_ send passwords in plain text in email.

---

## Design

* How do we authorize a user without a password?
* How do we prevent leaking information?

---

## Mailers

```ruby
# Inherits from ActionMailer::Base
# create with generator
class UserMailer < ActionMailer::Base
  # Can give default a Hash. Only from really makes sense.
  default from: 'notifications@example.com'

  # Works like a controller action, but can take arguments.
  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
```

---

## Mailer Views

If you make a `.html.erb` and `.text.erb`, both will be delivered.

---

## URLs in emails

* Have no context about requests
* Must provide hostname yourself
* in `config/environments/development.rb`:
  `config.action_mailer.default_url_options = { host: 'localhost:3000' }`

---

## SecureRandom

Need to create a secure key for password resets.

```ruby
require 'securerandom'
SecureRandom.urlsafe_base64
```

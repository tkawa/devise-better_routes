# Devise::BetterRoutes

Better routes patch for Devise

## One of the issues of Devise

    # config/routes.rb
    devise_for :users

Devise makes the following registration routes:

           user_registration POST   /users(.:format)         devise/registrations#create
       new_user_registration GET    /users/sign_up(.:format) devise/registrations#new
    cancel_user_registration GET    /users/cancel(.:format)  devise/registrations#cancel
      edit_user_registration GET    /users/edit(.:format)    devise/registrations#edit
                             PATCH  /users(.:format)         devise/registrations#update
                             PUT    /users(.:format)         devise/registrations#update
                             DELETE /users(.:format)         devise/registrations#destroy

These routes have a few problems.

* These confuse the resource which represents "all users" and the resource which represents "myself"
* What is the "registrations" which does not correspond to URL?

## Solution

`#create` and `#new` are the actions for all users.
The rest are the actions for myself.

Therefore, it should make two distinct resources.


Using this gem makes the following routes:

                  users POST   /users(.:format)               users#create
               new_user GET    /users/new(.:format)           users#new
    cancel_current_user GET    /current_user/cancel(.:format) current_users#cancel
      edit_current_user GET    /current_user/edit(.:format)   current_users#edit
           current_user PATCH  /current_user(.:format)        current_users#update
                        PUT    /current_user(.:format)        current_users#update
                        DELETE /current_user(.:format)        current_users#destroy

And also makes delegating URL helpers, such as `new_registration_path` -> `new_user_path`.

Then you can create two controllers as follows:

    # app/controllers/users_controller.rb
    class UsersController < Devise::RegistrationsController
    end

    # app/controllers/current_users_controller.rb
    class CurrentUsersController < Devise::RegistrationsController
    end


## Installation

Add this line to your application's Gemfile:

    gem 'devise-better_routes'

And then execute:

    $ bundle


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

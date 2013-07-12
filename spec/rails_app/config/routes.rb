RailsApp::Application.routes.draw do
  devise_for :users
  devise_for :rails_programmers, path_names: {current_rails_programmer: 'me'}
  devise_for :programmers, controllers: {programmers: 'rails_programmers', current_programmer: 'me'}
  devise_for :engineers, controllers: {registrations: 'rails_programmers'}
end

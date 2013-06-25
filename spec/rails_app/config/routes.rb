RailsApp::Application.routes.draw do
  devise_for :users
  devise_for :rails_programmers, path_names: {current_rails_programmer: 'me'}
end

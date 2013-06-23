require 'spec_helper'

describe Devise::BetterRoutes do
  it 'should have a version number' do
    Devise::BetterRoutes::VERSION.should_not be_nil
  end

  describe 'routing users' do
    include RSpec::Rails::RoutingExampleGroup
    it 'routes to users#create' do
      post('/users').should route_to('users#create')
    end
    it 'routes to users#new' do
      get('/users/new').should route_to('users#new')
    end
    it 'routes to current_users#cancel' do
      get('/current_user/cancel').should route_to('current_users#cancel')
    end
    it 'routes to current_users#edit' do
      get('/current_user/edit').should route_to('current_users#edit')
    end
    it 'routes to current_users#update' do
      put('/current_user').should route_to('current_users#update')
      #patch('/current_user').should route_to('current_users#update')
    end
    it 'routes to current_users#destroy' do
      delete('/current_user').should route_to('current_users#destroy')
    end
  end

  describe 'routing rails_programmers' do
    include RSpec::Rails::RoutingExampleGroup
    it 'routes to rails_programmers#create' do
      post('/rails_programmers').should route_to('rails_programmers#create')
    end
    it 'routes to rails_programmers#new' do
      get('/rails_programmers/new').should route_to('rails_programmers#new')
    end
    it 'routes to current_rails_programmers#cancel' do
      get('/current_rails_programmer/cancel').should route_to('current_rails_programmers#cancel')
    end
    it 'routes to current_rails_programmers#edit' do
      get('/current_rails_programmer/edit').should route_to('current_rails_programmers#edit')
    end
    it 'routes to current_rails_programmers#update' do
      put('/current_rails_programmer').should route_to('current_rails_programmers#update')
      #patch('/current_rails_programmer').should route_to('current_rails_programmers#update')
    end
    it 'routes to current_rails_programmers#destroy' do
      delete('/current_rails_programmer').should route_to('current_rails_programmers#destroy')
    end
  end

  describe 'URL helpers for users' do
    include Rails.application.routes.url_helpers
    include Devise::Controllers::UrlHelpers
    it { users_path.should eq '/users' }
    it { new_user_path.should eq '/users/new' }
    it { cancel_current_user_path.should eq '/current_user/cancel' }
    it { edit_current_user_path.should eq '/current_user/edit' }
    it { current_user_path.should eq '/current_user' }
    it 'registration_path is delegated to users_path' do
      registration_path(:user).should eq users_path
    end
    it 'new_registration_path is delegated to new_user_path' do
      new_registration_path(:user).should eq new_user_path
    end
    it 'cancel_registration_path is delegated to cancel_current_user_path' do
      cancel_registration_path(:user).should eq cancel_current_user_path
    end
    it 'edit_registration_path is delegated to edit_current_user_path' do
      edit_registration_path(:user).should eq edit_current_user_path
    end
  end

  describe 'URL helpers for rails_programmers' do
    include Rails.application.routes.url_helpers
    include Devise::Controllers::UrlHelpers
    it { rails_programmers_path.should eq '/rails_programmers' }
    it { new_rails_programmer_path.should eq '/rails_programmers/new' }
    it { cancel_current_rails_programmer_path.should eq '/current_rails_programmer/cancel' }
    it { edit_current_rails_programmer_path.should eq '/current_rails_programmer/edit' }
    it { current_rails_programmer_path.should eq '/current_rails_programmer' }
    it 'registration_path is delegated to rails_programmers_path' do
      registration_path(:rails_programmer).should eq rails_programmers_path
    end
    it 'new_registration_path is delegated to new_rails_programmer_path' do
      new_registration_path(:rails_programmer).should eq new_rails_programmer_path
    end
    it 'cancel_registration_path is delegated to cancel_current_rails_programmer_path' do
      cancel_registration_path(:rails_programmer).should eq cancel_current_rails_programmer_path
    end
    it 'edit_registration_path is delegated to edit_current_rails_programmer_path' do
      edit_registration_path(:rails_programmer).should eq edit_current_rails_programmer_path
    end
  end
end

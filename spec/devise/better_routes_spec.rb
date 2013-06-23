require 'spec_helper'

describe Devise::BetterRoutes do
  it 'expect to have a version number' do
    expect(Devise::BetterRoutes::VERSION).not_to be_nil
  end

  context 'routing' do
    include RSpec::Rails::RoutingExampleGroup
    describe 'users' do
      it 'routes to users#create' do
        expect(post('/users')).to route_to('users#create')
      end
      it 'routes to users#new' do
        expect(get('/users/new')).to route_to('users#new')
      end
      it 'routes to current_users#cancel' do
        expect(get('/current_user/cancel')).to route_to('current_users#cancel')
      end
      it 'routes to current_users#edit' do
        expect(get('/current_user/edit')).to route_to('current_users#edit')
      end
      it 'routes to current_users#update' do
        expect(put('/current_user')).to route_to('current_users#update')
        #expect(patch('/current_user')).to route_to('current_users#update')
      end
      it 'routes to current_users#destroy' do
        expect(delete('/current_user')).to route_to('current_users#destroy')
      end
    end

    describe 'rails_programmers' do
      it 'routes to rails_programmers#create' do
        expect(post('/rails_programmers')).to route_to('rails_programmers#create')
      end
      it 'routes to rails_programmers#new' do
        expect(get('/rails_programmers/new')).to route_to('rails_programmers#new')
      end
      it 'routes to current_rails_programmers#cancel' do
        expect(get('/current_rails_programmer/cancel')).to route_to('current_rails_programmers#cancel')
      end
      it 'routes to current_rails_programmers#edit' do
        expect(get('/current_rails_programmer/edit')).to route_to('current_rails_programmers#edit')
      end
      it 'routes to current_rails_programmers#update' do
        expect(put('/current_rails_programmer')).to route_to('current_rails_programmers#update')
        #expect(patch('/current_rails_programmer')).to route_to('current_rails_programmers#update')
      end
      it 'routes to current_rails_programmers#destroy' do
        expect(delete('/current_rails_programmer')).to route_to('current_rails_programmers#destroy')
      end
    end
  end

  context 'URL helpers' do
    include Rails.application.routes.url_helpers
    include Devise::Controllers::UrlHelpers
    describe 'users' do
      specify { expect(users_path).to eq '/users' }
      specify { expect(new_user_path).to eq '/users/new' }
      specify { expect(cancel_current_user_path).to eq '/current_user/cancel' }
      specify { expect(edit_current_user_path).to eq '/current_user/edit' }
      specify { expect(current_user_path).to eq '/current_user' }
      it 'registration_path is delegated to users_path' do
        expect(registration_path(:user)).to eq users_path
      end
      it 'registration_path is delegated to current_user_path on current_users' do
        instance_eval { def controller_name; 'current_users' end }
        expect(registration_path(:user)).to eq current_user_path
        instance_eval { undef controller_name }
      end
      it 'new_registration_path is delegated to new_user_path' do
        expect(new_registration_path(:user)).to eq new_user_path
      end
      it 'cancel_registration_path is delegated to cancel_current_user_path' do
        expect(cancel_registration_path(:user)).to eq cancel_current_user_path
      end
      it 'edit_registration_path is delegated to edit_current_user_path' do
        expect(edit_registration_path(:user)).to eq edit_current_user_path
      end
    end

    describe 'rails_programmers' do
      specify { expect(rails_programmers_path).to eq '/rails_programmers' }
      specify { expect(new_rails_programmer_path).to eq '/rails_programmers/new' }
      specify { expect(cancel_current_rails_programmer_path).to eq '/current_rails_programmer/cancel' }
      specify { expect(edit_current_rails_programmer_path).to eq '/current_rails_programmer/edit' }
      specify { expect(current_rails_programmer_path).to eq '/current_rails_programmer' }
      it 'registration_path is delegated to rails_programmers_path' do
        expect(registration_path(:rails_programmer)).to eq rails_programmers_path
      end
      it 'registration_path is delegated to current_rails_programmer_path on current_rails_programmers' do
        instance_eval { def controller_name; 'current_rails_programmers' end }
        expect(registration_path(:rails_programmer)).to eq current_rails_programmer_path
        instance_eval { undef controller_name }
      end
      it 'new_registration_path is delegated to new_rails_programmer_path' do
        expect(new_registration_path(:rails_programmer)).to eq new_rails_programmer_path
      end
      it 'cancel_registration_path is delegated to cancel_current_rails_programmer_path' do
        expect(cancel_registration_path(:rails_programmer)).to eq cancel_current_rails_programmer_path
      end
      it 'edit_registration_path is delegated to edit_current_rails_programmer_path' do
        expect(edit_registration_path(:rails_programmer)).to eq edit_current_rails_programmer_path
      end
    end
  end
end

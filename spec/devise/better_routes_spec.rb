require 'spec_helper'

describe Devise::BetterRoutes do
  it 'expect to have a version number' do
    expect(Devise::BetterRoutes::VERSION).not_to be_nil
  end

  context 'routing' do
    include RSpec::Rails::RoutingExampleGroup
    describe 'users' do
      context 'registration' do
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

      context 'session' do
        it 'routes to devise/sessions#create' do
          expect(post('/current_user/session')).to route_to('devise/sessions#create')
        end
        it 'routes to devise/sessions#destroy' do
          expect(delete('/current_user/session')).to route_to('devise/sessions#destroy')
        end
        it 'routes to devise/sessions#new' do
          expect(get('/current_user/session/new')).to route_to('devise/sessions#new')
        end
      end
    end

    describe 'rails_programmers' do
      context 'registration' do
        it 'routes to rails_programmers#create' do
          expect(post('/rails_programmers')).to route_to('rails_programmers#create')
        end
        it 'routes to rails_programmers#new' do
          expect(get('/rails_programmers/new')).to route_to('rails_programmers#new')
        end
        it 'routes to me#cancel' do
          expect(get('/me/cancel')).to route_to('me#cancel')
        end
        it 'routes to me#edit' do
          expect(get('/me/edit')).to route_to('me#edit')
        end
        it 'routes to me#update' do
          expect(put('/me')).to route_to('me#update')
          #expect(patch('/me')).to route_to('me#update')
        end
        it 'routes to me#destroy' do
          expect(delete('/me')).to route_to('me#destroy')
        end
      end

      context 'session' do
        it 'routes to devise/sessions#create' do
          expect(post('/me/session')).to route_to('devise/sessions#create')
        end
        it 'routes to devise/sessions#destroy' do
          expect(delete('/me/session')).to route_to('devise/sessions#destroy')
        end
        it 'routes to devise/sessions#new' do
          expect(get('/me/session/new')).to route_to('devise/sessions#new')
        end
      end
    end

    describe 'programmers' do
      context 'registration' do
        it 'routes to rails_programmers#create' do
          expect(post('/programmers')).to route_to('rails_programmers#create')
        end
        it 'routes to rails_programmers#new' do
          expect(get('/programmers/new')).to route_to('rails_programmers#new')
        end
        it 'routes to me#cancel' do
          expect(get('/current_programmer/cancel')).to route_to('me#cancel')
        end
        it 'routes to me#edit' do
          expect(get('/current_programmer/edit')).to route_to('me#edit')
        end
        it 'routes to me#update' do
          expect(put('/current_programmer')).to route_to('me#update')
          #expect(patch('/current_programmer')).to route_to('me#update')
        end
        it 'routes to me#destroy' do
          expect(delete('/current_programmer')).to route_to('me#destroy')
        end
      end

      context 'session' do
        it 'routes to devise/sessions#create' do
          expect(post('/current_programmer/session')).to route_to('devise/sessions#create')
        end
        it 'routes to devise/sessions#destroy' do
          expect(delete('/current_programmer/session')).to route_to('devise/sessions#destroy')
        end
        it 'routes to devise/sessions#new' do
          expect(get('/current_programmer/session/new')).to route_to('devise/sessions#new')
        end
      end
    end

    describe 'engineers' do
      context 'registration' do
        it 'routes to rails_programmers#create' do
          expect(post('/engineers')).to route_to('rails_programmers#create')
        end
        it 'routes to rails_programmers#new' do
          expect(get('/engineers/new')).to route_to('rails_programmers#new')
        end
        it 'routes to rails_programmers#cancel' do
          expect(get('/current_engineer/cancel')).to route_to('rails_programmers#cancel')
        end
        it 'routes to rails_programmers#edit' do
          expect(get('/current_engineer/edit')).to route_to('rails_programmers#edit')
        end
        it 'routes to rails_programmers#update' do
          expect(put('/current_engineer')).to route_to('rails_programmers#update')
          #expect(patch('/current_engineer')).to route_to('rails_programmers#update')
        end
        it 'routes to rails_programmers#destroy' do
          expect(delete('/current_engineer')).to route_to('rails_programmers#destroy')
        end
      end

      context 'session' do
        it 'routes to devise/sessions#create' do
          expect(post('/current_engineer/session')).to route_to('devise/sessions#create')
        end
        it 'routes to devise/sessions#destroy' do
          expect(delete('/current_engineer/session')).to route_to('devise/sessions#destroy')
        end
        it 'routes to devise/sessions#new' do
          expect(get('/current_engineer/session/new')).to route_to('devise/sessions#new')
        end
      end
    end
  end

  context 'URL helpers' do
    include Rails.application.routes.url_helpers
    include Devise::Controllers::UrlHelpers
    describe 'users' do
      context 'registration' do
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

      context 'session' do
        specify { expect(current_user_session_path).to eq '/current_user/session' }
        specify { expect(new_current_user_session_path).to eq '/current_user/session/new' }
      end
    end

    describe 'rails_programmers' do
      context 'registration' do
        specify { expect(rails_programmers_path).to eq '/rails_programmers' }
        specify { expect(new_rails_programmer_path).to eq '/rails_programmers/new' }
        specify { expect(cancel_me_path).to eq '/me/cancel' }
        specify { expect(edit_me_path).to eq '/me/edit' }
        specify { expect(me_path).to eq '/me' }
        it 'registration_path is delegated to rails_programmers_path' do
          expect(registration_path(:rails_programmer)).to eq rails_programmers_path
        end
        it 'registration_path is delegated to me_path on me' do
          instance_eval { def controller_name; 'me' end }
          expect(registration_path(:rails_programmer)).to eq me_path
          instance_eval { undef controller_name }
        end
        it 'new_registration_path is delegated to new_rails_programmer_path' do
          expect(new_registration_path(:rails_programmer)).to eq new_rails_programmer_path
        end
        it 'cancel_registration_path is delegated to cancel_me_path' do
          expect(cancel_registration_path(:rails_programmer)).to eq cancel_me_path
        end
        it 'edit_registration_path is delegated to edit_me_path' do
          expect(edit_registration_path(:rails_programmer)).to eq edit_me_path
        end
      end

      context 'session' do
        specify { expect(me_session_path).to eq '/me/session' }
        specify { expect(new_me_session_path).to eq '/me/session/new' }
      end
    end

    describe 'programmers' do
      context 'registration' do
        specify { expect(programmers_path).to eq '/programmers' }
        specify { expect(new_programmer_path).to eq '/programmers/new' }
        specify { expect(cancel_current_programmer_path).to eq '/current_programmer/cancel' }
        specify { expect(edit_current_programmer_path).to eq '/current_programmer/edit' }
        specify { expect(current_programmer_path).to eq '/current_programmer' }
        it 'registration_path is delegated to programmers_path' do
          expect(registration_path(:programmer)).to eq programmers_path
        end
        it 'registration_path is delegated to current_programmer_path on me' do
          instance_eval { def controller_name; 'me' end }
          expect(registration_path(:programmer)).to eq current_programmer_path
          instance_eval { undef controller_name }
        end
        it 'new_registration_path is delegated to new_programmer_path' do
          expect(new_registration_path(:programmer)).to eq new_programmer_path
        end
        it 'cancel_registration_path is delegated to cancel_current_programmer_path' do
          expect(cancel_registration_path(:programmer)).to eq cancel_current_programmer_path
        end
        it 'edit_registration_path is delegated to edit_current_programmer_path' do
          expect(edit_registration_path(:programmer)).to eq edit_current_programmer_path
        end
      end

      context 'session' do
        specify { expect(current_programmer_session_path).to eq '/current_programmer/session' }
        specify { expect(new_current_programmer_session_path).to eq '/current_programmer/session/new' }
      end
    end

    describe 'engineers' do
      context 'registration' do
        specify { expect(engineers_path).to eq '/engineers' }
        specify { expect(new_engineer_path).to eq '/engineers/new' }
        specify { expect(cancel_current_engineer_path).to eq '/current_engineer/cancel' }
        specify { expect(edit_current_engineer_path).to eq '/current_engineer/edit' }
        specify { expect(current_engineer_path).to eq '/current_engineer' }
        it 'registration_path is delegated to engineers_path' do
          expect(registration_path(:engineer)).to eq engineers_path
        end
        it 'registration_path is delegated to current_engineer_path on me' do
          instance_eval { def controller_name; 'rails_programmers' end }
          expect(registration_path(:engineer)).to eq current_engineer_path
          instance_eval { undef controller_name }
        end
        it 'new_registration_path is delegated to new_engineer_path' do
          expect(new_registration_path(:engineer)).to eq new_engineer_path
        end
        it 'cancel_registration_path is delegated to cancel_current_engineer_path' do
          expect(cancel_registration_path(:engineer)).to eq cancel_current_engineer_path
        end
        it 'edit_registration_path is delegated to edit_current_engineer_path' do
          expect(edit_registration_path(:engineer)).to eq edit_current_engineer_path
        end
      end

      context 'session' do
        specify { expect(current_engineer_session_path).to eq '/current_engineer/session' }
        specify { expect(new_current_engineer_session_path).to eq '/current_engineer/session/new' }
      end
    end
  end
end

require 'spec_helper'

describe Devise::BetterRoutes, type: :routing do
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

    context 'password' do
      it 'routes to devise/passwords#create' do
        expect(post('/current_user/password')).to route_to('devise/passwords#create')
      end
      it 'routes to devise/passwords#update' do
        expect(put('/current_user/password')).to route_to('devise/passwords#update')
      end
      it 'routes to devise/passwords#new' do
        expect(get('/current_user/password/new')).to route_to('devise/passwords#new')
      end
      it 'routes to devise/passwords#edit' do
        expect(get('/current_user/password/edit')).to route_to('devise/passwords#edit')
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

    context 'password' do
      it 'routes to devise/passwords#create' do
        expect(post('/me/password')).to route_to('devise/passwords#create')
      end
      it 'routes to devise/passwords#update' do
        expect(put('/me/password')).to route_to('devise/passwords#update')
      end
      it 'routes to devise/passwords#new' do
        expect(get('/me/password/new')).to route_to('devise/passwords#new')
      end
      it 'routes to devise/passwords#edit' do
        expect(get('/me/password/edit')).to route_to('devise/passwords#edit')
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

    context 'password' do
      it 'routes to devise/passwords#create' do
        expect(post('/current_programmer/password')).to route_to('devise/passwords#create')
      end
      it 'routes to devise/passwords#update' do
        expect(put('/current_programmer/password')).to route_to('devise/passwords#update')
      end
      it 'routes to devise/passwords#new' do
        expect(get('/current_programmer/password/new')).to route_to('devise/passwords#new')
      end
      it 'routes to devise/passwords#edit' do
        expect(get('/current_programmer/password/edit')).to route_to('devise/passwords#edit')
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

    context 'password' do
      it 'routes to devise/passwords#create' do
        expect(post('/current_engineer/password')).to route_to('devise/passwords#create')
      end
      it 'routes to devise/passwords#update' do
        expect(put('/current_engineer/password')).to route_to('devise/passwords#update')
      end
      it 'routes to devise/passwords#new' do
        expect(get('/current_engineer/password/new')).to route_to('devise/passwords#new')
      end
      it 'routes to devise/passwords#edit' do
        expect(get('/current_engineer/password/edit')).to route_to('devise/passwords#edit')
      end
    end
  end
end

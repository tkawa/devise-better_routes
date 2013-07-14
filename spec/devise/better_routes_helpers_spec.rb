require 'spec_helper'

describe Devise::BetterRoutes, 'helpers', type: :helper do
  describe %|devise_for :users| do
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
      it 'session_path is delegated to current_user_session_path' do
        expect(session_path(:user)).to eq current_user_session_path
      end
      it 'new_session_path is delegated to new_current_user_session_path' do
        expect(new_session_path(:user)).to eq new_current_user_session_path
      end
    end

    context 'password' do
      specify { expect(current_user_password_path).to eq '/current_user/password' }
      specify { expect(new_current_user_password_path).to eq '/current_user/password/new' }
      specify { expect(edit_current_user_password_path).to eq '/current_user/password/edit' }
      it 'password_path is delegated to current_user_password_path' do
        expect(password_path(:user)).to eq current_user_password_path
      end
      it 'new_password_path is delegated to new_current_user_password_path' do
        expect(new_password_path(:user)).to eq new_current_user_password_path
      end
      it 'edit_password_path is delegated to edit_current_user_password_path' do
        expect(edit_password_path(:user)).to eq edit_current_user_password_path
      end
    end
  end

  describe %|devise_for :rails_programmers, path_names: {current_rails_programmer: 'me'}| do
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
      it 'session_path is delegated to me_session_path' do
        expect(session_path(:rails_programmer)).to eq me_session_path
      end
      it 'new_session_path is delegated to new_me_session_path' do
        expect(new_session_path(:rails_programmer)).to eq new_me_session_path
      end
    end

    context 'password' do
      specify { expect(me_password_path).to eq '/me/password' }
      specify { expect(new_me_password_path).to eq '/me/password/new' }
      specify { expect(edit_me_password_path).to eq '/me/password/edit' }
      it 'password_path is delegated to me_password_path' do
        expect(password_path(:rails_programmer)).to eq me_password_path
      end
      it 'new_password_path is delegated to new_user_password_path' do
        expect(new_password_path(:rails_programmer)).to eq new_me_password_path
      end
      it 'edit_password_path is delegated to edit_me_password_path' do
        expect(edit_password_path(:rails_programmer)).to eq edit_me_password_path
      end
    end
  end

  describe %|devise_for :programmers, controllers: {programmers: 'rails_programmers', current_programmer: 'me'}| do
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
      it 'session_path is delegated to current_programmer_session_path' do
        expect(session_path(:programmer)).to eq current_programmer_session_path
      end
      it 'new_session_path is delegated to new_current_programmer_session_path' do
        expect(new_session_path(:programmer)).to eq new_current_programmer_session_path
      end
    end

    context 'password' do
      specify { expect(current_programmer_password_path).to eq '/current_programmer/password' }
      specify { expect(new_current_programmer_password_path).to eq '/current_programmer/password/new' }
      specify { expect(edit_current_programmer_password_path).to eq '/current_programmer/password/edit' }
      it 'password_path is delegated to current_programmer_password_path' do
        expect(password_path(:programmer)).to eq current_programmer_password_path
      end
      it 'new_password_path is delegated to new_current_programmer_password_path' do
        expect(new_password_path(:programmer)).to eq new_current_programmer_password_path
      end
      it 'edit_password_path is delegated to edit_current_programmer_password_path' do
        expect(edit_password_path(:programmer)).to eq edit_current_programmer_password_path
      end
    end
  end

  describe %|devise_for :engineers, controllers: {registrations: 'rails_programmers'}| do
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
      it 'session_path is delegated to current_engineer_session_path' do
        expect(session_path(:engineer)).to eq current_engineer_session_path
      end
      it 'new_session_path is delegated to new_current_engineer_session_path' do
        expect(new_session_path(:engineer)).to eq new_current_engineer_session_path
      end
    end

    context 'password' do
      specify { expect(current_engineer_password_path).to eq '/current_engineer/password' }
      specify { expect(new_current_engineer_password_path).to eq '/current_engineer/password/new' }
      specify { expect(edit_current_engineer_password_path).to eq '/current_engineer/password/edit' }
      it 'password_path is delegated to current_engineer_password_path' do
        expect(password_path(:engineer)).to eq current_engineer_password_path
      end
      it 'new_password_path is delegated to new_current_engineer_password_path' do
        expect(new_password_path(:engineer)).to eq new_current_engineer_password_path
      end
      it 'edit_password_path is delegated to edit_current_engineer_password_path' do
        expect(edit_password_path(:engineer)).to eq edit_current_engineer_password_path
      end
    end
  end
end

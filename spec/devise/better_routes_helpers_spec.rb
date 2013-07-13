require 'spec_helper'

describe Devise::BetterRoutes, type: :helper do
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

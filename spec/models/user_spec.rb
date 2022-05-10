require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    context 'with all necessary fields' do
      it 'creates a new user' do
        @user = User.create(
          name: 'Test',
          email: 'tester@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(@user.errors.full_messages).to eq([])
      end
    end

    context 'no password field' do
      it 'should error out' do
        @user = User.create(
          name: 'Test',
          email: 'tester@example.com',
          password_confirmation: 'password'
        )
        expect(@user.errors.full_messages).to eql(["Password can't be blank", "Password is too short (minimum is 8 characters)"])
      end
    end
    context 'no password confirmation field' do
      it 'should error out' do
        @user = User.create(
          name: 'Test',
          email: 'tester@example.com',
          password: 'password'
        )
        expect(@user.errors.full_messages).to eql(["Password confirmation can't be blank"])
      end
    end

    context 'non-matching password and confirmation fields' do
      it 'returns an error' do
        @user = User.create(
          name: 'Test',
          email: 'tester@example.com',
          password: 'password',
          password_confirmation: 'incorrect_pass'
        )
        expect(@user.errors.full_messages).to eql(["Password confirmation doesn't match Password"])
      end
    end

    context 'adding user who already exists into database' do
      it 'returns an error for the second user' do
        @user1 = User.create(
          name: 'Test',
          email: 'tester@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        @user2 = User.create(
          name: 'Test',
          email: 'tester@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(@user1.errors.full_messages).to eq([])
        expect(@user2.errors.full_messages).to eq(["Email has already been taken"])
      end
    end

    context 'password must be minimum length' do
      it 'returns an error for a password shorter than 8' do
        @user = User.create(
          name: 'Test',
          email: 'tester@example.com',
          password: 'pass',
          password_confirmation: 'pass'
        )
        expect(@user.errors.full_messages).to eq(["Password is too short (minimum is 8 characters)"])
      end
    end
  end

  describe '.authenticate_with_credentials' do
    context 'with correct credentials' do
      it 'returns a user' do
        @user = User.create(
          name: 'Test',
          email: 'tester@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(User.authenticate_with_credentials('tester@example.com', 'password')).to eq(@user)
      end
    end

    context 'with incorrect password' do
      it 'returns nil' do
        @user = User.create(
          name: 'Test',
          email: 'tester@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(User.authenticate_with_credentials('tester@example.com', 'incorrect_password')).to eq(nil)
      end
    end

    context 'with unregistered email' do
      it 'returns nil' do
        expect(User.authenticate_with_credentials('incorrect_tester@example.com', 'password')).to eq(nil)
      end
    end

    context 'with whitespace around email' do
      it 'returns a user' do
        @user = User.create(
          name: 'Test',
          email: 'tester@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(User.authenticate_with_credentials('  tester@example.com  ', 'password')).to eq(@user)
      end
    end
  end
end

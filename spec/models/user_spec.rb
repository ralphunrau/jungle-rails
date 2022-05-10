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
        puts @user.errors.full_messages
        expect(@user.errors.full_messages).to eq(["Password is too short (minimum is 8 characters)"])
      end
    end
  end
end

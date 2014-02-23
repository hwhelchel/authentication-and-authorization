require 'spec_helper'

describe User do

  before(:all) do
    @user = FactoryGirl.build(:user)
  end

  context "when signing up" do
    it { should validate_presence_of(:email) }
    it { should allow_value('test5@example.com').for(:email) }
    it { should_not allow_value('fdsjla').for(:email) }
    it { should validate_uniqueness_of(:email) }
    # it { should_not allow_value(nil).for(:password) }
    # it { should_not allow_value("").for(:password) }
  end

  context 'when logging in' do

    it 'checks email against stored email' do
      pending 'may get to'
    end

    it 'checks password against hashed password' do
      pending 'may get to'
    end

    it 'sets a session cookie' do
      @user.save
      params = {
        email: @user.email
      }
      session = {
      }

      post '/users/login', params, session
      expect(session[:id]).to equal(@user.id)
    end
  end

  context "when logging out" do
    it 'clears the session' do
      @user.save
      session = {
        id: @user.id
      }
      delete '/users/logout', {}, session

      expect(session[:id]).to be_nil
    end
  end

end
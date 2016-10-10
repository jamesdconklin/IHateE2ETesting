require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    FactoryGirl.create(:user)
  end
  # Validations
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6).on(:create) }
  end
  # Associations
  describe 'associations' do
    it { should have_many(:goals) }
    it { should have_many(:comments) }
    # it { should have_many(:cheers) }
  end


  # Class and Instance Methods

  describe '#reset_session_token!' do
    it "should assign a new session token" do
      session_token = User.last.session_token
      User.last.reset_session_token!
      expect(session_token).not_to eq(User.last.session_token)
    end
  end

  describe '#is_password?(password)' do
    it "should clear correct password" do
      expect(User.last.is_password?("password")).to be_truthy
    end
    it "should reject incorrect password" do
      expect(User.last.is_password?("passowrd")).to be_falsey
    end
  end

  describe ':find_by_credentials(username, password)' do
    let(:username) {User.last.username}
    it "should return record for proper credentials" do
      expect(User.find_by_credentials(username,"password")).to eq(User.last)
    end
    it "should return nothing for improper credentials" do
      expect(User.find_by_credentials(username.reverse,"password")).to be_nil
      expect(User.find_by_credentials(username,"passowrd")).to be_nil
    end

  end
end

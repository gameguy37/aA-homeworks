require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { User.new(email: "gameguy37@gmail.com", password: "longenough")}

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it "generates a password digest" do
    expect(user.password_digest).to_not be_nil
  end

  it "ensures session token before validation" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "#reset_session_token!" do
    it "sets a new session token on the user" do
      user.valid?
      old = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "#is_password?" do
    it "verifies a password is correct" do
      expect(user.is_password?("longenough")).to be true
    end

    it "verifies a password is not correct" do
      expect(user.is_password?("bad_password")).to be false
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns user given good credentials" do
      expect(User.find_by_credentials("gameguy37@gmail.com", "longenough")).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_credentials("gameguy37@gmail.com", "bad_password")).to eq(nil)
    end
  end

end

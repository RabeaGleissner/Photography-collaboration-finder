require 'spec_helper'

describe User do
 it "has a valid factory" do  
  expect(FactoryGirl.build(:user)).to be_valid
  end

  describe '#flickr_name' do
    it "must have a flickr_name" do
      user = FactoryGirl.build(:user, flickr_name: nil)
      # user.flickr_name = nil
      expect(user).to_not be_valid
    end

    it "must be unique" do
      FactoryGirl.create(:user)
      user = FactoryGirl.build(:user)
      user.valid?
      expect(user.errors.messages[:flickr_name]).to eq ["has already been taken"]
    end
  end

  describe '#uid' do
  it "must be unique" do
    FactoryGirl.create(:user)
    user = FactoryGirl.build(:user)
    user.valid?
    expect(user.errors.messages[:uid]).to eq ["has already been taken"]
  end
end


end

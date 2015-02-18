require 'spec_helper'

describe Collaboration do
 it "has a valid factory" do  
  expect(FactoryGirl.build(:collaboration)).to be_valid
end

it "only can only be created when two users have the same film types" do

end

it "collaborator_1 and collaborator_2 are not the same id" do

end

# only sends email if user has receive_email true

end
require 'spec_helper'

describe Collaboration do
 it "has a valid factory" do  
  expect(FactoryGirl.build(:collaboration)).to be_valid
end

# describe '#collaborator1_id' do
#   it "should not be the same as collaborator2_id" do
#     collaboration = FactoryGirl.build(:collaboration)
#     expect(collaboration.collaborator1_id == collaboration.collaborator2_id).to_not be_valid
#   end
# end



# 
# should only be created if both collaborators have the same film formats
# only sends email if user has receive_email true

end
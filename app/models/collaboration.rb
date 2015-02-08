class Collaboration < ActiveRecord::Base

  belongs_to :user, foreign_key: 'collaborator1_id'
  belongs_to :user, foreign_key: 'collaborator2_id'
end

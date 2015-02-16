class Photo < ActiveRecord::Base
  has_many :albums
  has_many :users, through: :albums

  def store
    false
  end

end

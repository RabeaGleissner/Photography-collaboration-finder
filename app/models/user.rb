class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:flickr]
  
  has_many :collaborations, foreign_key: :collaborator1_id   
  has_many :collaborations, foreign_key: :collaborator2_id 
  has_and_belongs_to_many :films, dependent: :destroy

  attr_accessor :flickr_access_token, :flickr_access_secret

  scope :excluding, -> (*users) { where(["users.id NOT IN (?)", (users.flatten.compact.map(&:id) << 0)]) }


  def self.from_omniauth(auth)
    if user = User.find_by_flickr_name(auth.info.name)
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.flickr_name = auth.info.name
        user.location = auth.info.location._content
        user.profileurl = auth.extra.raw_info.person.profileurl._content
        user.image = auth.info.image
        user.password = Devise.friendly_token[0,20]
        user.role = "user"
      end
    end
  end

def email_required?
  false
end

def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
end

  # def last_ten
  #   flickr.
  # end

  def flickr
    return @flickr if @flickr

    @flickr = FlickRaw::Flickr.new
    @flickr.access_token = flickr_access_token
    @flickr.access_secret = flickr_access_secret
    @flickr
  end

end

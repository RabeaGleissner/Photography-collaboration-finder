class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:flickr]
  
  has_many :collaborations, foreign_key: :collaborator1_id   
  has_many :collaborations, foreign_key: :collaborator2_id 
  has_many :films

  attr_accessor :flickr_access_token, :flickr_access_secret


  # Example
  # has_many :x_matches, class_name:'Match', foreign_key: :player_x_id     
  

  def self.from_omniauth(auth)
    if user = User.find_by_flickr_name(auth.info.name)
      raise
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.flickr_name = auth.info.name
        user.location = auth.info.location._content
        # user.profileurl = auth.extra.raw_info.person.profileurl._content
        user.email = "#{rand(1000)}@#{rand(121212)}.com"
        user.password = Devise.friendly_token[0,20]
      end
    end
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

class HomeController < ApplicationController

  before_action :flickr_keys

  def index
   @photos = flickr.photosets.getPhotos(photoset_id: '72157626714345858').photo
  end

  def about

  end



  private

  def flickr_keys
    FlickRaw.api_key       = ENV['FLICKR_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_SECRET_API_KEY'] 
  end

 

end

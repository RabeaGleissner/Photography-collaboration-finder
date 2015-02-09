class HomeController < ApplicationController


  def index

   @photos = flickr.photosets.getPhotos(photoset_id: '72157626714345858').photo

  end

  def about

  end



  private

 

end

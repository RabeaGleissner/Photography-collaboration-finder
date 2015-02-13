class HomeController < ApplicationController


  def index

   @photos = flickr.photosets.getPhotos(photoset_id: '72157626714345858').photo

  end

  def gallery
    authorize! :gallery, :home
  end

  def tips
    authorize! :tips, :home
  end

  def about

  end



  private

 

end

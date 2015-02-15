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
    @pool_photos = flickr.groups.pools.getPhotos(group_id: '1743197@N22').photo
  end



  private

 

end

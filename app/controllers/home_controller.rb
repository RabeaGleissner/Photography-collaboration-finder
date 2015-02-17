class HomeController < ApplicationController


  def index

   @photos = flickr.photosets.getPhotos(photoset_id: '72157650882962825').photo

  end

  def gallery
    authorize! :gallery, :home
  end

  def tips
    authorize! :tips, :home
  end


  def about

    @photos = flickr.photosets.getPhotos(photoset_id: '72157650882962825').photo

    @page = params.fetch(:page, 1).to_i
     per_page = 3
    @pool_photos = flickr.groups.pools.getPhotos(group_id: '2771363@N20', per_page: per_page, page: @page).photo 


  render partial: "pool_photo", collection: @pool_photos, layout: false if request.xhr?

end



  private

 

end

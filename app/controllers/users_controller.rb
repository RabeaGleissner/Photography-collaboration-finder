class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:new_user, :show]
  load_and_authorize_resource

  def index
    @user = current_user
    @users = User.all
    @films = Film.all
  end

  def show
    @user = User.find(params[:id])
    @films = @user.films

    if @user.uid
    @photosets = flickr.photosets.getList(user_id: @user.uid)

    @selected_set_photos = flickr.photosets.getPhotos(photoset_id: @user.album.flickr_id, privacy_filter: '1').photo.first(10)

    @firstset = flickr.photosets.getList(user_id: @user.uid).first
    @firstsetphotos = flickr.photosets.getPhotos(photoset_id: @firstset.id, privacy_filter: 1).photo
    end
  end

  def edit
    @films = Film.all
    @user = User.find(params[:id])
    if @user.uid
    @photosets = flickr.photosets.getList(user_id: @user.uid)
    end
  end

  def update

    album = Album.new
    album.update(flickr_id: params[:albums])
    album.save

    current_user.update(user_params)
    redirect_to user_path(current_user.id)
  end


  def new_user
  
  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :flickr_name, :location, :uid, :provider, :availability, :image, {film_ids: []},
      {album_attributes: [:id, :flickr_id]}
      )
  end

end
